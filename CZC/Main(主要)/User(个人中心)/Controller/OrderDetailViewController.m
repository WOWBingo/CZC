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
@interface OrderDetailViewController ()

@end

@implementation OrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单详情";
    // Do any additional setup after loading the view from its nib.
    NSLog(@"%@",self.orderObj);
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
            cell3.otherInfoLab.text = @"缺少其他信息字段";
            //价格
            cell3.moneyLab.text = [NSString stringWithFormat:@"%.02f",orderProObj.buyPrice];
            //物品数量
            cell3.numLab.text = [NSString stringWithFormat:@"X%ld",orderProObj.buyNumber];
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
            hight = 70;
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



@end
