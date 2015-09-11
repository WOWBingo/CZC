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
@interface OrderViewController ()

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单明细";
    //创建segmentControl
    LjjUISegmentedControl* ljjuisement=[[LjjUISegmentedControl alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH,34)];
    ljjuisement.delegate = self;
    NSArray* ljjarray=[NSArray arrayWithObjects:@"全部",@"待付款",@"待发货",@"待收货",@"待评价",@"退款/售后",nil];
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
    NSString *params = @"pageIndex=1&pageCount=5&memLoginID=yemao&t=";
    params = [params stringByAppendingString:type];
    [CZCService GETmethod:kOrderNumber_URL andParameters:params andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            NSInteger count = [[myresult objectForKey:@"Count"]integerValue];
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
    //根据orderStatus 判断0 全部订单  1待付款 2 待发货 3 待收货  4 已完成订单  5 买家已经评价  6 卖家已经评价  7退货8 订单完成并且未评价
    switch (orderObj.oderStatus) {
        case 1:
            [headView.orderStatusLab setText:@"待付款"];
            break;
        case 2:
            [headView.orderStatusLab setText:@"待发货"];
            break;
        case 3:
            [headView.orderStatusLab setText:@"待收货"];
            break;
        case 4:
            [headView.orderStatusLab setText:@"已完成"];
            break;
        case 8:
            [headView.orderStatusLab setText:@"未评价"];
            break;
        default:
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
    switch (orderObj.oderStatus) {//给btn一个TAG值，根据这个值后期点击的时候获取按钮类型 0取消订单 1付款 2退款 3提醒卖家 4确认收货 5删除订单 6评价
        case 1://待付款
            footView.leftBtn.tag = 0;
            [footView.leftBtn setTitle:@"取消订单" forState:UIControlStateNormal];
            footView.rightBtn.tag = 1;
            [footView.rightBtn setTitle:@"付款" forState:UIControlStateNormal];
            break;
        case 2://待发货
            footView.leftBtn.tag = 2;
            [footView.rightBtn setTitle:@"退款" forState:UIControlStateNormal];
            footView.rightBtn.tag = 3;
            [footView.rightBtn setTitle:@"提醒卖家" forState:UIControlStateNormal];
            break;
        case 3://待收货 少一个查看物流！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
            footView.leftBtn.tag = 2;
            [footView.leftBtn setTitle:@"退款" forState:UIControlStateNormal];
            footView.rightBtn.tag = 4;
            [footView.rightBtn setTitle:@"确认收货" forState:UIControlStateNormal];
            break;
        case 4://已完成
            footView.leftBtn.hidden = YES;
            footView.rightBtn.tag = 5;
            [footView.rightBtn setTitle:@"删除订单" forState:UIControlStateNormal];
            break;
        case 8://待评价
            footView.leftBtn.hidden = YES;
            footView.rightBtn.tag = 6;
            [footView.rightBtn setTitle:@"评价" forState:UIControlStateNormal];
            break;
        default:
            break;
    }
    //划线
    [PublicObject drawHorizontalLineOnView:footView andX:footView.frame.origin.x andY:footView.proNumLab.frame.origin.y+footView.proNumLab.frame.size.height+8 andWidth:SCREEN_WIDTH-16 andColor:[UIColor groupTableViewBackgroundColor]];
    return footView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 80;
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
    //基本信息
    
    cell.infolab.text = orderProObj.productName;
    //其他信息
    cell.otherInfoLab.text = @"缺少其他信息字段";
    //订单状态
    cell.orderStatusLab.text = orderObj.paymentName;
    //订单时间
    cell.timeLab.text = [orderObj.createTime substringToIndex:9];//下单时间
    //根据orderStatus 判断0 全部订单  1待付款 2 待发货 3 待收货  4 已完成订单  5 买家已经评价  6 卖家已经评价  7退货8 订单完成并且未评价
    
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
    [self getOrderListWithType:type];
}

@end
