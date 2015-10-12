//
//  OrderDetailViewController.m
//  CZC
//
//  Created by 张浩 on 15/8/19.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "OrderDetailViewController.h"
#import "OrderDetailOneTableViewCell.h"
#import "OrderDetailTwoTableViewCell.h"
#import "OrderDetailThreeTableViewCell.h"
#import "OrderDetailFourTableViewCell.h"
#import "OrderProductObject.h"
#import "EvaluateViewController.h"
#import "PayForView.h"
#import "AppDelegate.h"
@interface OrderDetailViewController (){
    PayForView *payForView;
}
@end

@implementation OrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单详情";
    // Do any additional setup after loading the view from its nib.
    NSLog(@"%@",self.orderObj);
    //根据订单状态显示button
    switch (self.orderObj.oderStatus) {//给btn一个TAG值，根据这个值后期点击的时候获取按钮类型 0取消订单 1付款 2退款 3提醒卖家 4确认收货 5删除订单 6评价 7查看物流 8退货申请
        case 0://待付款
            self.oneBtn.tag = 0;
            [self.oneBtn setTitle:@"取消订单" forState:UIControlStateNormal];
            [self changeBtnBorderWithColor:[UIColor grayColor] andBtn:self.oneBtn];
            self.twoBtn.tag = 1;
            [self.twoBtn setTitle:@"付款" forState:UIControlStateNormal];
            [self changeBtnBorderWithColor:[UIColor orangeColor] andBtn:self.twoBtn];
            self.threeBtn.hidden = YES;
            break;
        case 1://待发货
            self.oneBtn.tag = 2;
            [self.oneBtn setTitle:@"退款" forState:UIControlStateNormal];
            [self changeBtnBorderWithColor:[UIColor grayColor] andBtn:self.oneBtn];
            self.twoBtn.tag = 3;
            [self.twoBtn setTitle:@"提醒卖家" forState:UIControlStateNormal];
            [self changeBtnBorderWithColor:[UIColor grayColor] andBtn:self.twoBtn];
            self.threeBtn.hidden = YES;
            break;
        case 2://待收货
            self.oneBtn.tag = 2;
            [self.oneBtn setTitle:@"退款" forState:UIControlStateNormal];
            [self changeBtnBorderWithColor:[UIColor grayColor] andBtn:self.oneBtn];
            self.twoBtn.tag = 4;
            [self.twoBtn setTitle:@"确认收货" forState:UIControlStateNormal];
            [self changeBtnBorderWithColor:[UIColor greenColor] andBtn:self.twoBtn];
            self.threeBtn.tag = 7;
            [self.threeBtn setTitle:@"查看物流" forState:UIControlStateNormal];
            [self changeBtnBorderWithColor:[UIColor grayColor] andBtn:self.threeBtn];
            break;
        case 3://已完成
            self.oneBtn.tag = 5;
            [self.oneBtn setTitle:@"删除订单" forState:UIControlStateNormal];
            [self changeBtnBorderWithColor:[UIColor grayColor] andBtn:self.oneBtn];
            self.twoBtn.tag = 6;
            [self.twoBtn setTitle:@"评价" forState:UIControlStateNormal];
            [self changeBtnBorderWithColor:[UIColor greenColor] andBtn:self.twoBtn];
            self.threeBtn.hidden = YES;
            break;
            //        case 7://退货
            //            self.oneBtn.tag = 8;
            //            [self.oneBtn setTitle:@"退货申请" forState:UIControlStateNormal];
            //            self.twoBtn.hidden = YES;
            //            self.threeBtn.hidden = YES;
            //            break;
            //        case 8://待评价
            //            self.oneBtn.tag = 6;
            //            [self.oneBtn setTitle:@"评价" forState:UIControlStateNormal];
            //            self.twoBtn.hidden = YES;
            //            self.threeBtn.hidden = YES;
            //            break;
        default:
            self.oneBtn.tag = 5;
            [self.oneBtn setTitle:@"删除订单" forState:UIControlStateNormal];
            [self changeBtnBorderWithColor:[UIColor grayColor] andBtn:self.oneBtn];
            self.twoBtn.tag = 6;
            [self.twoBtn setTitle:@"评价" forState:UIControlStateNormal];
            [self changeBtnBorderWithColor:[UIColor greenColor] andBtn:self.twoBtn];
            self.threeBtn.hidden = YES;
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//异步加载图片
- (void)updateImage:(UIImage *)img withCell:(OrderDetailThreeTableViewCell *)cell{
    if (img != nil) {
        cell.imgView.image = img;
    } else {
        cell.imgView.image = [UIImage imageNamed:@"cpsc-p1"];
    }
}
#pragma mark - tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 4;
}
#pragma tableViewHead
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        self.headView  = [OrderDetailHeadView instanceView];
        [self.headView.shopNameBtn setTitle:self.orderObj.shopName forState:UIControlStateNormal];
        return self.headView;
    }else{
        return nil;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int cellNum = 1;
    if (section == 2) {
        cellNum = (int)self.orderObj.productList.count;
    }
    return cellNum;
}
#pragma tableViewFoot
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 2) {
        self.footView = [OrderDetailFootView instanceView];
        //遍历所有productList
        int proNum = 0;
        //定义一个临时数组，接收ProductList数组对象
        NSMutableArray *productListArr = [[NSMutableArray alloc]init];
        productListArr = self.orderObj.productList;
        for (int i =0; i<self.orderObj.productList.count; i++) {
            OrderProductObject *orderProObj = [OrderProductObject objectWithKeyValues:[productListArr objectAtIndex:i]];
            NSLog(@"%@",orderProObj);
            int temp = (int)orderProObj.buyNumber;
            proNum = proNum+temp;
        }
        self.footView.totalLab.text = [NSString stringWithFormat:@"%.02f",self.orderObj.shouldPayPrice];
        //运费
        if (self.orderObj.packPrice == 0) {
            self.footView.freightLab.text = @"(免运费)";
        }else{
            self.footView.freightLab.text = [NSString stringWithFormat:@"(包含运费￥%.02f)",self.orderObj.packPrice];
        }
        //    //划线
        //    [PublicObject drawHorizontalLineOnView:footView andX:footView.frame.origin.x andY:footView.proNumLab.frame.origin.y+footView.proNumLab.frame.size.height+8 andWidth:SCREEN_WIDTH-16 andColor:[UIColor groupTableViewBackgroundColor]];
        return self.footView;
    }else{
        return nil;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier1 = @"OrderDetailOneTableViewCell";
    static NSString *CellIdentifier2 = @"OrderDetailTwoTableViewCell";
    static NSString *CellIdentifier3 = @"OrderDetailThreeTableViewCell";
    static NSString *CellIdentifier4 = @"OrderDetailFourTableViewCell";
    
    OrderDetailOneTableViewCell *cell1 = (OrderDetailOneTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
    OrderDetailTwoTableViewCell *cell2 = (OrderDetailTwoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier2];
    OrderDetailThreeTableViewCell *cell3 = (OrderDetailThreeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier3];
    OrderDetailFourTableViewCell *cell4 = (OrderDetailFourTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier4];
    switch (indexPath.section) {
        case 0:{
            if (cell1 == nil) {
                NSBundle *bundle = [NSBundle mainBundle];
                NSArray *nibArray = [bundle loadNibNamed:CellIdentifier1 owner:self options:nil];
                cell1 = (OrderDetailOneTableViewCell *)[nibArray objectAtIndex:0];
                [cell1 setSelectionStyle:UITableViewCellSelectionStyleNone];
            }
            //加载数据
            cell1.orderStatusLab.text = self.orderObj.paymentName;
            //根据订单状态修改orderStatusLab
            switch (self.orderObj.oderStatus) {//
                case 1://待付款
                    cell1.orderStatusLab.text = @"待付款";
                    break;
                case 2://待发货
                    cell1.orderStatusLab.text = @"待发货";
                    break;
                case 3://待收货
                    cell1.orderStatusLab.text = @"待收货";
                    break;
                case 4://已完成
                    cell1.orderStatusLab.text = @"已完成";
                    break;
                case 8://待评价
                    cell1.orderStatusLab.text = @"待评价";
                    break;
                default:
                    break;
            }
        }
            return cell1;
            break;
        case 1:{
            if (cell2 == nil) {
                NSBundle *bundle = [NSBundle mainBundle];
                NSArray *nibArray = [bundle loadNibNamed:CellIdentifier2 owner:self options:nil];
                cell2 = (OrderDetailTwoTableViewCell *)[nibArray objectAtIndex:0];
                [cell2 setSelectionStyle:UITableViewCellSelectionStyleNone];
            }
            //添加分割线
            [PublicObject drawHorizontalLineOnView:cell2.contentView andX:0 andY:cell2.addressLab.frame.origin.y+cell2.addressLab.frame.size.height+3 andWidth:SCREEN_WIDTH andColor:[UIColor groupTableViewBackgroundColor]];
            //加载数据
            cell2.nameLab.text = self.orderObj.name;
            cell2.telLab.text = self.orderObj.mobile;
            cell2.addressLab.text = [NSString stringWithFormat:@"地址:%@",self.orderObj.address];
        }
            return cell2;
            break;
        case 2:{
            if (cell3 == nil) {
                NSBundle *bundle = [NSBundle mainBundle];
                NSArray *nibArray = [bundle loadNibNamed:CellIdentifier3 owner:self options:nil];
                cell3 = (OrderDetailThreeTableViewCell *)[nibArray objectAtIndex:0];
                [cell3 setSelectionStyle:UITableViewCellSelectionStyleNone];
            }
            //获取订单详情
            //定义一个临时数组，接收ProductList数组对象
            NSMutableArray *productListArr = [[NSMutableArray alloc]init];
            productListArr = self.orderObj.productList;
            NSLog(@"%lu",(unsigned long)productListArr.count);
            NSLog(@"%ld",(long)indexPath.row);
            OrderProductObject *orderProObj = [OrderProductObject objectWithKeyValues:[productListArr objectAtIndex:indexPath.row]];
            NSLog(@"%@",orderProObj);
            //图片
            NSString *imgURL = @"";
            imgURL = [PublicObject convertNullString:orderProObj.productImg];
            if ([imgURL isEqualToString:@""]||imgURL == nil) {
                cell3.imgView.image = [UIImage imageNamed:@"cpsc-p1"];
            } else {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    NSString *urlString = [NSString stringWithFormat:@"%@",imgURL];
                    NSURL *imageUrl = [NSURL URLWithString:urlString];
                    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
                    UIImage *img = [UIImage imageWithData:imageData];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self updateImage:img withCell:cell3];
                    });
                });
            }
            //基本信息
            cell3.infoLab.text = orderProObj.productName;
            //其他信息
            cell3.otherInfoLab.text = [NSString stringWithFormat:@"%@%@",orderProObj.specificationName,orderProObj.specificationValue];
            //价格
            cell3.moneyLab.text = [NSString stringWithFormat:@"%.02f",orderProObj.buyPrice];
            //物品数量
            cell3.numLab.text = [NSString stringWithFormat:@"X%ld",(long)orderProObj.buyNumber];
            //根据订单状态修改btn
            //            switch (self.orderObj.oderStatus) {//给btn一个TAG值，根据这个值后期点击的时候获取按钮类型 0取消订单 1付款 2退款 3提醒卖家 4确认收货 5删除订单 6评价
            //                case 1://待付款
            //                    cell3.btn.tag = 0;
            //                    [footView.leftBtn setTitle:@"取消订单" forState:UIControlStateNormal];
            //                    footView.rightBtn.tag = 1;
            //                    [footView.rightBtn setTitle:@"付款" forState:UIControlStateNormal];
            //                    break;
            //                case 2://待发货
            //                    footView.leftBtn.tag = 2;
            //                    [footView.rightBtn setTitle:@"退款" forState:UIControlStateNormal];
            //                    footView.rightBtn.tag = 3;
            //                    [footView.rightBtn setTitle:@"提醒卖家" forState:UIControlStateNormal];
            //                    break;
            //                case 3://待收货
            //                    footView.leftBtn.tag = 2;
            //                    [footView.leftBtn setTitle:@"退款" forState:UIControlStateNormal];
            //                    footView.rightBtn.tag = 4;
            //                    [footView.rightBtn setTitle:@"确认收货" forState:UIControlStateNormal];
            //                    break;
            //                case 4://已完成
            //                    footView.leftBtn.hidden = YES;
            //                    footView.rightBtn.tag = 5;
            //                    [footView.rightBtn setTitle:@"删除订单" forState:UIControlStateNormal];
            //                    break;
            //                case 8://待评价
            //                    footView.leftBtn.hidden = YES;
            //                    footView.rightBtn.tag = 6;
            //                    [footView.rightBtn setTitle:@"评价" forState:UIControlStateNormal];
            //                    break;
            //                default:
            //                    break;
            //            }
        }
            return cell3;
            break;
        case 3:{
            if (cell4 == nil) {
                NSBundle *bundle = [NSBundle mainBundle];
                NSArray *nibArray = [bundle loadNibNamed:CellIdentifier4 owner:self options:nil];
                cell4 = (OrderDetailFourTableViewCell *)[nibArray objectAtIndex:0];
                [cell4 setSelectionStyle:UITableViewCellSelectionStyleNone];
            }
            //加载数据
            //订单号
            cell4.orderIdLab.text = self.orderObj.orderNumber;
            //交易号
            cell4.tradeIdLab.text = self.orderObj.tradeID;
            //创建时间
            cell4.creatTimeLab.text = self.orderObj.createTime;
            //支付时间
            cell4.payTimeLab.text = self.orderObj.payTime;
            //发货时间
            cell4.deliveryTimeLab.text = self.orderObj.dispatchTime;
        }
            return cell4;
            break;
        default:
            break;
    }
    return cell1;
    return cell2;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.001;
    }else if (section == 2){
        return 44;
    }
    else{
        return 10;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    int hight = 0;
    switch (indexPath.section) {
        case 0:
            hight = 44;
            break;
        case 1:
            hight = 75;
            break;
        case 2:
            hight = 100;
            break;
        case 3:
            hight = 100;
            break;
        default:
            break;
    }
    //    if (indexPath.section == 0 && indexPath.row == 0) {
    //        return 160;
    //    }else{
    //        return 44;
    //    }
    return hight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return 120;
    }else{
        return 0.0001;
    }
}
// 去掉UItableview headerview黏性(sticky)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat sectionHeaderHeight = 40;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }
    else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
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
    [CZCService GETmethod:kOrderDelete_URL andParameters:self.orderObj.guid andHandle:^(NSDictionary *myresult) {
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
- (IBAction)orderBtnClick:(id)sender {
    OrderBtn *btn = (OrderBtn *)sender;
    //0取消订单 1付款 2退款 3提醒卖家 4确认收货 5删除订单 6评价 7查看物流 8退货申请
    switch (btn.tag) {
        case 0:{
            NSLog(@"取消订单");
            [self delateOrder:btn.chooseBtnIndex];
        }
            break;
        case 1:{
            NSLog(@"付款");
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
            payForView.orderNumber = self.orderObj.orderNumber;
            payForView.delegate = self;
            AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
            [delegate.window addSubview:payForView];
        }
            break;
        case 2:{
            NSLog(@"退款");
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
            NSLog(@"评价");
            EvaluateViewController *evaluateVC = [[EvaluateViewController alloc]initWithNibName:@"EvaluateViewController" bundle:nil];
            [self.navigationController pushViewController:evaluateVC animated:YES];
        }
            break;
        case 7:{
            NSLog(@"查看物流");
        }
            break;
        case 8:{
            NSLog(@"退货申请");
        }
            break;
        default:
            break;
    }
}
@end
