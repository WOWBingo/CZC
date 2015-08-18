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
@interface OrderViewController ()

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单明细";
    //创建segmentControl
    LjjUISegmentedControl* ljjuisement=[[LjjUISegmentedControl alloc]initWithFrame:CGRectMake(0, 64,SCREEN_WIDTH,34)];
    ljjuisement.delegate = self;
    NSArray* ljjarray=[NSArray arrayWithObjects:@"全部",@"待付款",@"待发货",@"待收货",@"待评价",nil];
    [ljjuisement AddSegumentArray:ljjarray];
    [self.view addSubview:ljjuisement];
    self.view.backgroundColor = [UIColor redColor];
    
    //创建tableView
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
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
    NSString *params = @"pageIndex=1&pageCount=5&memLoginID=yemao&t=2";
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
    OrderProductObject *orderProObj = [productListArr objectAtIndex:0];
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
    NSLog(@"%ld",(long)indexPath.row);
    //    switch (indexPath.section) {
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
