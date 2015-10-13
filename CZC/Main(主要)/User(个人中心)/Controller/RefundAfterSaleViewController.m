//
//  RefundAfterSaleViewController.m
//  CZC
//
//  Created by 张浩 on 15/10/12.
//  Copyright © 2015年 周德艺. All rights reserved.
//

#import "RefundAfterSaleViewController.h"
#import "OrderTableViewCell.h"
#import "OrderHeadView.h"
#import "OrderFootView.h"
#import "OrderObject.h"
#import "OrderProductObject.h"
#import "OrderDetailViewController.h"
@interface RefundAfterSaleViewController ()

@end

@implementation RefundAfterSaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    self.title = @"退款/售后";
    
    //创建tableView
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.view addSubview:self.tableView];
    
    self.orderListArray = [[NSMutableArray alloc]init];
    [self getOrderListWithType:@"7"];
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    [headView.orderStatusLab setText:@"退款受理"];
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
    [footView.oneBtn setTitle:@"查看进度" forState:UIControlStateNormal];
    [self changeBtnBorderWithColor:[UIColor grayColor] andBtn:footView.oneBtn];
    footView.twoBtn.hidden = YES;
    footView.threeBtn.hidden = YES;
    
    //划线
    [PublicObject drawHorizontalLineOnView:footView andX:footView.frame.origin.x andY:footView.proNumLab.frame.origin.y+footView.proNumLab.frame.size.height+8 andWidth:SCREEN_WIDTH-16 andColor:[UIColor groupTableViewBackgroundColor]];
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
    cell.evaluateBtn.hidden = YES;
    //基本信息
    cell.infolab.text = orderProObj.productName;
    //其他信息
    cell.otherInfoLab.text = [NSString stringWithFormat:@"%@%@",orderProObj.specificationName,orderProObj.specificationValue];
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


@end
