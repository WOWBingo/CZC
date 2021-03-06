//
//  OrderDetailsViewController.m
//  CZC
//
//  Created by 张浩 on 15/8/16.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "OrderViewController.h"
#import "OrderTableViewCell.h"
#import "OrderHeadView.h"
#import "OrderFootView.h"
#import "OrderObject.h"
#import "OrderProductObject.h"
#import "OrderDetailViewController.h"
#import "EvaluateViewController.h"
#import "PayForView.h"
#import "AppDelegate.h"
@interface OrderViewController (){
    PayForView *payForView;
}

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单明细";
    //创建segmentControl
    LjjUISegmentedControl* ljjuisement=[[LjjUISegmentedControl alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH,34)];
    ljjuisement.delegate = self;
    NSArray* ljjarray=[NSArray arrayWithObjects:@"全部",@"待付款",@"待发货",@"待收货",@"待评价",nil];
    [ljjuisement AddSegumentArray:ljjarray];
    [self.view addSubview:ljjuisement];
    
    //创建tableView
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 34, SCREEN_WIDTH, SCREEN_HEIGHT-64-34)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:self.tableView];
    //Change the background color
    //    ljjuisement.LJBackGroundColor=[UIColor BlackColor];
    
    //Change Title color
    //    ljjuisement.titleColor=[UIColor BlackColor];
    
    //Change the Color of selectionButton
    //    ljjuisement.selectColor=[UIColor BlackColor];
    
    //Change the buttonTitle Font
    //    ljjuisement.titleFont=[UIFont fontWithName:@".Helvetica Neue Interface" size:14.0f];
    
    //Select the Button
    [ljjuisement selectTheSegument:0];
    
    self.orderListArray = [[NSMutableArray alloc]init];
    [self getOrderListWithType:@"0"];
    
}
-(void)getOrderListWithType:(NSString *)type{
#pragma mark - 14.订单列表
    /** 14.订单列表 http://app.czctgw.com/api/order/member/OrderList?pageIndex=1&pageCount=5&memLoginID=yemao&t=2 */
    NSString *params = [NSString stringWithFormat:@"pageIndex=1&pageCount=5&memLoginID=%@&t=",kAccountObject.memLoginID];
    params = [params stringByAppendingString:type];
    [CZCService GETmethod:kOrderNumber_URL andParameters:params andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            //NSInteger count = [[myresult objectForKey:@"Count"]integerValue];
            NSArray *dataArr = [myresult objectForKey:@"Data"];
            NSArray *list = [OrderObject objectArrayWithKeyValuesArray:dataArr];
            NSLog(@"14.订单列表 ------%@",list);
            self.orderListArray = [[NSMutableArray alloc]initWithArray:list];
            [self.tableView reloadData];
        }
        else{
            NSLog(@"失败");
        }
    }];
}
//异步加载图片
- (void)updateImage:(UIImage *)img withCell:(OrderTableViewCell *)cell{
    if (img != nil) {
        cell.imgView.image = img;
    } else {
        cell.imgView.image = [UIImage imageNamed:@"cpsc-p1"];
    }
}
#pragma tableViewHead
//section数，订单数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.orderListArray.count;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    OrderObject *orderObj = [self.orderListArray objectAtIndex:section];
    OrderHeadView *headView = [OrderHeadView instanceView];
    [headView.shopNameBtn setTitle:orderObj.shopName forState:UIControlStateNormal];
    //根据orderStatus 判断  0待付款 1待发货 2待收货  3已完成订单
    switch (orderObj.oderStatus) {
        case 0:
            [headView.orderStatusLab setText:@"待付款"];
            break;
        case 1:
            [headView.orderStatusLab setText:@"待发货"];
            break;
        case 2:
            [headView.orderStatusLab setText:@"待收货"];
            break;
        case 3:
            [headView.orderStatusLab setText:@"已完成"];
            break;
        default:
            [headView.orderStatusLab setText:@"已完成"];
            break;
    }
    return headView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    OrderObject *orderObj = [self.orderListArray objectAtIndex:section];
    return orderObj.productList.count;//productList.count;
}
#pragma tableViewFoot
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    OrderObject *orderObj = [self.orderListArray objectAtIndex:section];
    OrderFootView *footView = [OrderFootView instanceView];
    //遍历所有productList
    int proNum = 0;
    //定义一个临时数组，接收ProductList数组对象
    NSMutableArray *productListArr = [[NSMutableArray alloc]init];
    productListArr = orderObj.productList;
    for (int i =0; i<orderObj.productList.count; i++) {
        OrderProductObject *orderProObj = [OrderProductObject objectWithKeyValues:[productListArr objectAtIndex:i]];
        NSLog(@"%@",orderProObj);
        int temp = (int)orderProObj.buyNumber;
        proNum = proNum+temp;
    }
    footView.proNumLab.text = [NSString stringWithFormat:@"共%d件商品,合计:￥",proNum];
    footView.totalLab.text = [NSString stringWithFormat:@"%.02f",orderObj.shouldPayPrice];
    //运费
    if (orderObj.packPrice == 0) {
        footView.freightLab.text = @"(免运费)";
    }else{
        footView.freightLab.text = [NSString stringWithFormat:@"(包含运费￥%.02f)",orderObj.packPrice];
    }
    //根据订单状态修改btn
    footView.oneBtn.chooseBtnIndex = (int)section;
    footView.twoBtn.chooseBtnIndex = (int)section;
    footView.threeBtn.chooseBtnIndex = (int)section;
    
    switch (orderObj.oderStatus) {//给btn一个TAG值，根据这个值后期点击的时候获取按钮类型 0取消订单 1付款 2退款 3提醒卖家 4确认收货 5删除订单 6查看物流 7退货申请
        case 0://待付款
            footView.oneBtn.tag = 0;
            [footView.oneBtn setTitle:@"取消订单" forState:UIControlStateNormal];
            [self changeBtnBorderWithColor:[UIColor grayColor] andBtn:footView.oneBtn];
            footView.twoBtn.tag = 1;
            [footView.twoBtn setTitle:@"付款" forState:UIControlStateNormal];
            [self changeBtnBorderWithColor:[UIColor orangeColor] andBtn:footView.twoBtn];
            footView.threeBtn.hidden = YES;
            break;
        case 1://待发货
            footView.oneBtn.tag = 2;
            [footView.oneBtn setTitle:@"退款" forState:UIControlStateNormal];
            [self changeBtnBorderWithColor:[UIColor grayColor] andBtn:footView.oneBtn];
            footView.twoBtn.tag = 3;
            [footView.twoBtn setTitle:@"提醒卖家" forState:UIControlStateNormal];
            [self changeBtnBorderWithColor:[UIColor grayColor] andBtn:footView.twoBtn];
            footView.threeBtn.hidden = YES;
            break;
        case 2://待收货
            footView.oneBtn.tag = 2;
            [footView.oneBtn setTitle:@"退款" forState:UIControlStateNormal];
            [self changeBtnBorderWithColor:[UIColor grayColor] andBtn:footView.oneBtn];
            footView.twoBtn.tag = 4;
            [footView.twoBtn setTitle:@"确认收货" forState:UIControlStateNormal];
            [self changeBtnBorderWithColor:[UIColor greenColor] andBtn:footView.twoBtn];
            footView.threeBtn.tag = 6;
            [footView.threeBtn setTitle:@"查看物流" forState:UIControlStateNormal];
            [self changeBtnBorderWithColor:[UIColor grayColor] andBtn:footView.threeBtn];
            break;
        case 3://已完成
            footView.oneBtn.tag = 5;
            [footView.oneBtn setTitle:@"删除订单" forState:UIControlStateNormal];
            [self changeBtnBorderWithColor:[UIColor grayColor] andBtn:footView.oneBtn];
            footView.twoBtn.tag = 7;
            [footView.twoBtn setTitle:@"申请退货" forState:UIControlStateNormal];
            [self changeBtnBorderWithColor:[UIColor redColor] andBtn:footView.twoBtn];
            footView.threeBtn.hidden = YES;
            break;
            //        case 7://退货
            //            footView.oneBtn.tag = 8;
            //            [footView.oneBtn setTitle:@"退货申请" forState:UIControlStateNormal];
            //            footView.twoBtn.hidden = YES;
            //            footView.threeBtn.hidden = YES;
            //            break;
            //        case 8://待评价
            //            footView.oneBtn.tag = 6;
            //            [footView.oneBtn setTitle:@"评价" forState:UIControlStateNormal];
            //            footView.twoBtn.hidden = YES;
            //            footView.threeBtn.hidden = YES;
            //            break;
        default:
            footView.oneBtn.tag = 5;
            [footView.oneBtn setTitle:@"删除订单" forState:UIControlStateNormal];
            [self changeBtnBorderWithColor:[UIColor grayColor] andBtn:footView.oneBtn];
            footView.twoBtn.hidden = YES;
            footView.threeBtn.hidden = YES;
            break;
    }
    //划线
    [PublicObject drawHorizontalLineOnView:footView andX:footView.frame.origin.x andY:footView.proNumLab.frame.origin.y+footView.proNumLab.frame.size.height+8 andWidth:SCREEN_WIDTH-16 andColor:[UIColor groupTableViewBackgroundColor]];
    //设置代理
    footView.delegate = self;
    return footView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 90;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"OrderTableViewCell";
    OrderTableViewCell *cell = (OrderTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:CellIdentifier owner:self options:nil];
        cell = (OrderTableViewCell *)[nibArray objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    cell.backgroundColor = [UIColor whiteColor];
    //获取订单详情
    OrderObject *orderObj = [self.orderListArray objectAtIndex:indexPath.section];
    //定义一个临时数组，接收ProductList数组对象
    NSMutableArray *productListArr = [[NSMutableArray alloc]init];
    productListArr = orderObj.productList;
    NSLog(@"%lu",(unsigned long)productListArr.count);
    NSLog(@"%ld",(long)indexPath.row);
    OrderProductObject *orderProObj = [OrderProductObject objectWithKeyValues:[productListArr objectAtIndex:indexPath.row]];
    NSLog(@"%@",orderProObj);
    //图片
    NSString *imgURL = @"";
    imgURL = [PublicObject convertNullString:orderProObj.productImg];
    if ([imgURL isEqualToString:@""]||imgURL == nil) {
        cell.imgView.image = [UIImage imageNamed:@"cpsc-p1"];
    } else {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSString *urlString = [NSString stringWithFormat:@"%@",imgURL];
            NSURL *imageUrl = [NSURL URLWithString:urlString];
            NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
            UIImage *img = [UIImage imageWithData:imageData];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateImage:img withCell:cell];
            });
        });
    }
    cell.delegate = self;
    cell.orderIndex = (int)indexPath.section;//存储订单的index
    cell.evaluateBtn.tag = indexPath.row;//存储商品的index
    //修改字体颜色
    [cell.evaluateBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    //修改边框颜色
    CALayer * downButtonLayer = [cell.evaluateBtn layer];
    [downButtonLayer setMasksToBounds:YES];
    [downButtonLayer setCornerRadius:3.0];
    [downButtonLayer setBorderWidth:1.0];
    [downButtonLayer setBorderColor:[[UIColor orangeColor] CGColor]];
    
    //基本信息
    cell.infolab.text = orderProObj.productName;
    //其他信息
    cell.otherInfoLab.text = [NSString stringWithFormat:@"%@%@",orderProObj.specificationName,orderProObj.specificationValue];
    //订单状态
    cell.orderStatusLab.text = orderObj.paymentName;
    //订单时间
    cell.timeLab.text = [orderObj.createTime substringToIndex:9];//下单时间
    //根据orderStatus 判断0 全部订单  1待付款 2 待发货 3 待收货  4 已完成订单  5 买家已经评价  6 卖家已经评价  7退货8 订单完成并且未评价
    if (orderObj.oderStatus == 3) {
        cell.evaluateBtn.hidden = NO;
    }else{
        cell.evaluateBtn.hidden = YES;
    }
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //    if (IS_IOS8_OR_ABOVE) {
    //        return UITableViewAutomaticDimension;
    //    }else{
    return 90;
    //    }
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderDetailViewController *orderDetailVC = [[OrderDetailViewController alloc]initWithNibName:@"OrderDetailViewController" bundle:nil];
    orderDetailVC.orderObj = [self.orderListArray objectAtIndex:indexPath.section];
    [self.navigationController pushViewController:orderDetailVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - uisegument
-(void)uisegumentSelectionChange:(NSInteger)selection{
    NSLog(@"%ld",(long)selection);
    NSString *type = [NSString stringWithFormat:@"%ld",(long)selection];
    if (selection == 4) {
        type = @"8";
    }
    [self getOrderListWithType:type];
}
-(void)changeBtnBorderWithColor:(UIColor *)color andBtn:(OrderBtn *)btn{
    //修改字体颜色
    [btn setTitleColor:color forState:UIControlStateNormal];
    //修改边框颜色
    CALayer * downButtonLayer = [btn layer];
    [downButtonLayer setMasksToBounds:YES];
    [downButtonLayer setCornerRadius:3.0];
    [downButtonLayer setBorderWidth:1.0];
    [downButtonLayer setBorderColor:[color CGColor]];
}
-(void)orderFootViewBtnClick:(OrderBtn *)btn{
    //0取消订单 1付款 2退款 3提醒卖家 4确认收货 5删除订单 6查看物流 7退货申请
    switch (btn.tag) {
        case 0:{
            NSLog(@"取消订单");
            [self delateOrder:btn.chooseBtnIndex];
        }
            break;
        case 1:{
            NSLog(@"付款");
            //获取订单详情
            OrderObject *orderObj = [self.orderListArray objectAtIndex:btn.chooseBtnIndex];
            //获得nib视图数组
            NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"PayForView" owner:self options:nil];
            //得到第一个UIView
            payForView = [nib objectAtIndex:0];
            //获得屏幕的Frame
            CGRect tmpFrame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            payForView.frame = tmpFrame;
            //添加视图
            payForView.backgroundColor = [UIColor clearColor];
            //传递数据
            payForView.orderNumber = orderObj.orderNumber;
            payForView.delegate = self;
            AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            [delegate.window addSubview:payForView];
        }
            break;
        case 2:{
            NSLog(@"退款");
            [self returnOrder:@"1" and:btn.chooseBtnIndex];
        }
            break;
        case 3:{
            NSLog(@"提醒卖家");
        }
            break;
        case 4:{
            NSLog(@"确认收货");
        }
            break;
        case 5:{
            NSLog(@"删除订单");
            [self delateOrder:btn.chooseBtnIndex];
        }
            break;
        case 6:{
            NSLog(@"查看物流");
        }
            break;
        case 7:{
            NSLog(@"退货申请");
            [self returnOrder:@"1" and:btn.chooseBtnIndex];
        }
            break;
        default:
            break;
    }
}
-(void)hidenPayForView{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    for (UIView *tempView in appDelegate.window.subviews) {
        if ([tempView isKindOfClass:[PayForView class]]) {
            tempView.hidden = YES;
        }
    }
}
-(void)hidenPayForViewAndBack{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    for (UIView *tempView in appDelegate.window.subviews) {
        if ([tempView isKindOfClass:[PayForView class]]) {
            tempView.hidden = YES;
        }
    }
    [self.navigationController popViewControllerAnimated:YES];
}
//-(void)cancelOrder{
//#pragma mark - 14.取消订单
//    /** 14.订单列表 http://app.czctgw.com/api/order/member/OrderList?pageIndex=1&pageCount=5&memLoginID=yemao&t=2 */
//    NSString *params = [NSString stringWithFormat:@"pageIndex=1&pageCount=5&memLoginID=%@&t=",kAccountObject.memLoginID];
//    params = [params stringByAppendingString:type];
//    [CZCService GETmethod:kOrderDelete_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            //NSInteger count = [[myresult objectForKey:@"Count"]integerValue];
//            NSArray *dataArr = [myresult objectForKey:@"Data"];
//            NSArray *list = [OrderObject objectArrayWithKeyValuesArray:dataArr];
//            NSLog(@"14.订单列表 ------%@",list);
//            self.orderListArray = [[NSMutableArray alloc]initWithArray:list];
//            [self.tableView reloadData];
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
//}
-(void)delateOrder:(int)index{
#pragma mark - 17.取消订单
    /** 17.取消订单 http://api/order/OrderUpdate/ */
    //获取订单详情
    OrderObject *orderObj = [self.orderListArray objectAtIndex:index];
    [CZCService GETmethod:kOrderDelete_URL andParameters:orderObj.guid andHandle:^(NSDictionary *myresult) {
        NSDictionary *result = myresult;
        NSLog(@"%@",result);
        if (result) {
            NSString *statuStr = [NSString stringWithFormat:@"%@",[result objectForKey:@"return"]];
            if ([statuStr isEqualToString:@"200"]) {
                NSLog(@"取消订单成功");
                [self showHUDViewTitle:@"取消订单成功" info:@"" andCodes:^{
                }];
            }else{
                NSLog(@"取消订单失败");
                [self showHUDViewTitle:@"取消订单失败" info:@"" andCodes:^{
                }];
            }
        }
        else{
            [self showHUDViewTitle:@"取消订单失败" info:@"" andCodes:^{
            }];
        }
    }];
    //刷新
    [self.tableView reloadData];
}
//跳转评价界面
-(void)goEvaluateVC:(int)orderIndex andBtn:(UIButton *)btn{
    NSLog(@"评价");
    //获取订单详情
    OrderObject *orderObj = [self.orderListArray objectAtIndex:orderIndex];
    EvaluateViewController *evaluateVC = [[EvaluateViewController alloc]initWithNibName:@"EvaluateViewController" bundle:nil];
    evaluateVC.orderObj = orderObj;
    evaluateVC.orderProObj = [OrderProductObject objectWithKeyValues:[orderObj.productList objectAtIndex:btn.tag]];
    [self.navigationController pushViewController:evaluateVC animated:YES];
}
//退款/退货
-(void)returnOrder:(NSString *)type and:(int)index{
#pragma mark - 53.退款/退货
    /** 53.退款/退货 http://api/order/Returnofgoods2 */
    //获取订单详情
    NSLog(@"%d",index);
    OrderObject *orderObj = [self.orderListArray objectAtIndex:index];
    NSDictionary *dic = @{@"OrderID":orderObj.guid,
                          @"RefundType":type,
                          @"RefundMoney":@"100",
                          @"RefundContent":@"退货说明",
                          @"RefundImg":@"图片",
                          @"MemLoginID":kAccountObject.memLoginID,
                          @"ShopID":orderObj.shopID,
                          @"LogisticName":@"物流公司",
                          @"LogisticNumber":@"12131234",
                          };
    [CZCService POSTmethod:kReturnofgoods_URL andDicParameters:dic andHandle:^(NSDictionary *myresult) {
        NSDictionary *result = myresult;
        NSLog(@"%@",result);
        if (result) {
            NSString *statuStr = [NSString stringWithFormat:@"%@",[result objectForKey:@"return"]];
            if (statuStr) {
                NSLog(@"申请成功");
                [self showHUDViewTitle:@"申请成功" info:@"" andCodes:^{
                    [self.navigationController popViewControllerAnimated:YES];
                }];
            }else{
                NSLog(@"申请失败");
                [self showHUDViewTitle:@"申请失败" info:@"" andCodes:^{
                }];
            }
        }
        else{
            [self showHUDViewTitle:@"申请失败" info:@"" andCodes:^{
            }];
        }
    }];
}
@end
