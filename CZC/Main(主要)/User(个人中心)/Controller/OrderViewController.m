//
//  OrderDetailsViewController.m
//  CZC
//
//  Created by 张浩 on 15/8/16.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "OrderViewController.h"
#import "OrderTableViewCell.h"
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
    NSArray* ljjarray=[NSArray arrayWithObjects:@"全部",@"待付款",@"待发货",@"待收货",@"待评价",nil];
    [ljjuisement AddSegumentArray:ljjarray];
    [self.view addSubview:ljjuisement];
    
    //创建tableView
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 34, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.orderListArray.count;
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
    //划线
    [PublicObject drawHorizontalLineOnView:cell.backView andX:cell.backView.frame.origin.x andY:cell.imgView.frame.origin.y+cell.imgView.frame.size.height+8 andWidth:SCREEN_WIDTH-16 andColor:[UIColor grayColor]];
    [PublicObject drawHorizontalLineOnView:cell.backView andX:cell.backView.frame.origin.x andY:cell.proNumLab.frame.origin.y+cell.proNumLab.frame.size.height+8 andWidth:SCREEN_WIDTH-16 andColor:[UIColor grayColor]];
    //获取订单详情
    OrderObject *orderObj = [self.orderListArray objectAtIndex:indexPath.row];
    //定义一个临时数组，接收ProductList数组对象
    NSMutableArray *productListArr = [[NSMutableArray alloc]init];
    productListArr = orderObj.productList;
    OrderProductObject *orderProObj = [OrderProductObject objectWithKeyValues:[productListArr objectAtIndex:0]];
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
    //物品数量
    cell.proNumLab.text = [NSString stringWithFormat:@"%ld",orderProObj.buyNumber];
    //总价
    cell.moneyLab.text = [NSString stringWithFormat:@"%f",orderProObj.buyPrice];
    //运费
    cell.freightLab.text = [NSString stringWithFormat:@"%f",orderObj.packPrice];
    //根据orderStatus 判断0 全部订单  1待付款 2 待发货 3 待收货  4 已完成订单  5 买家已经评价  6 卖家已经评价  7退货8 订单完成并且未评价
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //    if (IS_IOS8_OR_ABOVE) {
    //        return UITableViewAutomaticDimension;
    //    }else{
    return 180;
    //    }
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderDetailViewController *orderDetailVC = [[OrderDetailViewController alloc]initWithNibName:@"OrderDetailViewController" bundle:nil];
    orderDetailVC.orderObj = [self.orderListArray objectAtIndex:indexPath.row];
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
