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
@interface OrderDetailViewController ()

@end

@implementation OrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
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
            //加载数据
            cell2.nameLab.text = self.orderObj.name;
            cell2.telLab.text = self.orderObj.mobile;
            cell2.addressLab.text = self.orderObj.address;
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
            //加载数据
            //定义一个临时数组，接收ProductList数组对象
            NSMutableArray *productListArr = [[NSMutableArray alloc]init];
            productListArr = self.orderObj.productList;
            OrderProductObject *orderProObj = [OrderProductObject objectWithKeyValues:[productListArr objectAtIndex:0]];
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
            cell3.otherInfoLab.text = @"缺少其他信息字段";
            //物品数量
            cell3.numLab.text = [NSString stringWithFormat:@"X%ld",orderProObj.buyNumber];
            //总价
            cell3.moneyLab.text = [NSString stringWithFormat:@"%f",self.orderObj.shouldPayPrice];
            //运费
            cell3.freightLab.text = [NSString stringWithFormat:@"%f",self.orderObj.packPrice];
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
    }else{
        return 20;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 44;
            break;
        case 1:
            return 70;
            break;
        case 2:
            return 188;
            break;
        case 3:
            return 100;
            break;
        default:
            break;
    }
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 160;
    }else{
        return 44;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}




@end
