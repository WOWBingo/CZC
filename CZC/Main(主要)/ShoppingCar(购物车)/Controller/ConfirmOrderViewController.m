//
//  ConfirmOrderViewController.m
//  CZC
//
//  Created by 周德艺 on 15/9/9.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ConfirmOrderViewController.h"
#import "ConfirmOrderTableViewCell.h"
#import "PayAddressTableViewCell.h"
#import "ConfirmOrderShopCell.h"
#import "ConfirmOrderOtherCell.h"
#import "ShopCarObject.h"
#import "AddressViewController.h"

@interface ConfirmOrderViewController ()

@end

@implementation ConfirmOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"确认订单";
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView setTableFooterView:[[UIView alloc]init]];
    //[_tableView setSeparatorColor:[UIColor clearColor]];
    _tableView.separatorStyle = NO;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 110;
}

#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _selectedShopList.count+1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else{
        ShopCarObject *shopObject = [_selectedShopList objectAtIndex:section-1];
        return shopObject.productList.count+2;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (IS_IOS8_OR_ABOVE) {
        return UITableViewAutomaticDimension;
    }else{
        return 110;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    if (section == 0) {
        /**
         *	地址的cell
         */
        static NSString *CellIdentifier = @"PayAddressTableViewCell";
        PayAddressTableViewCell *cell = (PayAddressTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            NSBundle *bundle = [NSBundle mainBundle];
            NSArray *nibArray = [bundle loadNibNamed:CellIdentifier owner:self options:nil];
            cell = (PayAddressTableViewCell *)[nibArray objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }else{
        ShopCarObject *shopObject = [_selectedShopList objectAtIndex:section-1];
        if(row == 0){
            /**
             *	店铺cell
             */
            static NSString *cellIdentifier = @"ConfirmOrderShopCell";
            ConfirmOrderShopCell *cell = (ConfirmOrderShopCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (cell == nil) {
                NSBundle *bundle = [NSBundle mainBundle];
                NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
                cell = (ConfirmOrderShopCell *)[nibArray objectAtIndex:0];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            }
            [cell.shopNameLabel setText:shopObject.shop];
            return cell;
        }else if(row == shopObject.productList.count+1){
            /**
             *	快递选择，留言等的cell
             */
            static NSString *cellIdentifier = @"ConfirmOrderOtherCell";
            ConfirmOrderOtherCell *cell = (ConfirmOrderOtherCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (cell == nil) {
                NSBundle *bundle = [NSBundle mainBundle];
                NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
                cell = (ConfirmOrderOtherCell *)[nibArray objectAtIndex:0];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            }
            int num;
            for (int i = 0; i < shopObject.productList.count; i++) {
                ShopCarProductObject *proObject = [shopObject.productList objectAtIndex:i];
                num += proObject.buyNumber;
            }
            [cell.priceLabel setText:[NSString stringWithFormat:@"￥%.2f",shopObject.price]];
            [cell.numLabel setText:[NSString stringWithFormat:@"共%d件商品，",num]];
            return cell;
        }else{
            /**
             *	每条产品的cell
             */
            ShopCarProductObject *proObject = [shopObject.productList objectAtIndex:row-1];
            static NSString *cellIdentifier = @"ConfirmOrderTableViewCell";
            ConfirmOrderTableViewCell *cell = (ConfirmOrderTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (cell == nil) {
                NSBundle *bundle = [NSBundle mainBundle];
                NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
                cell = (ConfirmOrderTableViewCell *)[nibArray objectAtIndex:0];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                [cell setBackgroundColor:BackGroundColor];
            }
            [cell.proNameLabel setText:proObject.name];
            [cell.proInfoLabel setText:[NSString stringWithFormat:@"%@%@",proObject.specificationValue,proObject.specificationName]];
            [cell.numberLabel setText:[NSString stringWithFormat:@"X %ld",proObject.buyNumber]];
            [cell.priceLabel setText:[NSString stringWithFormat:@"￥%.2f",proObject.buyPrice]];
            [cell.image sd_setImageWithURL:[NSURL URLWithString:proObject.originalImge] placeholderImage:DefaultImage];
            return cell;
        }
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        AddressViewController *newVC = [[AddressViewController alloc]initWithNibName:@"AddressViewController" bundle:nil];
        [self.navigationController pushViewController:newVC animated:YES];
    }
}

#pragma mark - 16.提交订单
- (IBAction)accountClick:(id)sender{

    /**  16.提交订单(1) http://app.czctgw.com/api/shoppingcart/ */
    //    NSDictionary *dic = @{
    //                          @"MemLoginID": @"a465788",
    //                          @"OrderNumber": @"201505122319090",
    //                          @"TradeID": @"201505122319090",
    //                          @"Name": @"陈胜",
    //                          @"Email": @"",
    //                          @"Address": @"江苏省苏州市常熟市 江苏省苏州市常熟市古里镇小康村庐山苑三区31号",
    //                          @"Postalcode": @"215500",
    //                          @"Tel": @"",
    //                          @"Mobile": @"15952069203",
    //                          @"PaymentGuid": @"31e9ce27-bc27-4e16-8e53-dc171194531a",
    //                          @"ProductPrice": @"100.00",
    //                          @"DispatchPrice": @"0.00",
    //                          @"ShouldPayPrice": @"100.00",
    //                          @"OutOfStockOperate": @"",
    //                          @"ClientToSellerMsg": @"",
    //                          @"RegionCode":@"1",
    //                          @"orderPrice":@"200",
    //                          @"PostType": @"0",
    //                          @"ProductList": @[
    //                                           @{
    //                                               @"Guid": @"252df425-238e-4a00-9b75-e056a3e418a9",
    //                                               @"MemLoginID": @"a465788",
    //                                               @"ProductGuid": @"181dc6c6-6b2f-49ef-9a42-5e2fbc534520",
    //                                               @"OriginalImge": @"http://www.czctgw.com/ImgUpload/shopImage/2014/shop100000615/201412051232517.jpg_100X100.jpg",
    //                                               @"Name": @"2014秋装V领 纯净色黑白纯色打底 百搭时尚长袖男T恤 youtesi",
    //                                               @"RepertoryNumber": @"C028",
    //                                               @"Attributes": @"",
    //                                               @"ExtensionAttriutes": @"M",
    //                                               @"BuyNumber": @"3",
    //                                               @"MarketPrice": @"99.00",
    //                                               @"BuyPrice": @"154.00",
    //                                               @"IsJoinActivity": @"0",
    //                                               @"IsPresent": @"0",
    //                                               @"CreateTime": @"2015/08/07 17:56:23",
    //                                               @"ShopID": @"h4",
    //                                               @"ShopName": @"天天",
    //                                               @"SpecificationName": @"颜色分类:浅灰色|尺码:M",
    //                                               @"SpecificationValue": @"浅灰色|M",
    //                                               @"RepertoryCount": @"160"
    
    //                                           }
    //                                           ],
    //                          };
    ////    NSString *str=@" \"MemLoginID \":   \"a465788 \",\"OrderNumber \":   \"201505122319090 \",\"TradeID \":   \"201505122319090 \",\"Name \":   \"陈胜 \",\"Email \":   \" \",\"Address \":   \"江苏省苏州市常熟市 江苏省苏州市常熟市古里镇小康村庐山苑三区31号 \",\"Postalcode \":   \"215500 \",\"Tel \":   \" \",\"Mobile \":   \"15952069203 \",\"PaymentGuid \":   \"31e9ce27-bc27-4e16-8e53-dc171194531a \",\"ProductPrice \":   \"100.00 \",\"DispatchPrice \":   \"0.00 \",\"ShouldPayPrice \":   \"100.00 \",\"OutOfStockOperate \":   \" \",\"ClientToSellerMsg \":   \" \",\"RegionCode \":  \"1 \",\"orderPrice \":  \"200 \",\"PostType \":   \"0 \",\"ProductList \":  [{\"Guid \":   \"252df425-238e-4a00-9b75-e056a3e418a9 \",\"MemLoginID \":   \"a465788 \",\"ProductGuid \":   \"181dc6c6-6b2f-49ef-9a42-5e2fbc534520 \",\"OriginalImge \":   \"http://www.czctgw.com/ImgUpload/shopImage/2014/shop100000615/201412051232517.jpg_100X100.jpg \",\"Name \":   \"2014秋装V领 纯净色黑白纯色打底 百搭时尚长袖男T恤 youtesi \",\"RepertoryNumber \":   \"C028 \",\"Attributes \":   \" \",\"ExtensionAttriutes \":   \"M \",\"BuyNumber \":   \"3 \",\"MarketPrice \":   \"99.00 \",\"BuyPrice \":   \"154.00 \",\"IsJoinActivity \":   \"0 \",\"IsPresent \":   \"0 \",\"CreateTime \":   \"2015/08/07 17:56:23 \",\"ShopID \":   \"h4 \",\"ShopName \":   \"天天 \",\"SpecificationName \":   \"颜色分类:浅灰色|尺码:M \",\"SpecificationValue \":   \"浅灰色|M \",\"RepertoryCount \":   \"160 \"";
    //    [CZCService POSTmethod:kOrderAdd_URL andParameters:[self DataTOjsonString:dic] andHandle:^(NSDictionary *myresult) {
    //        if (myresult) {
    //            NSInteger result = [[myresult objectForKey:@"return"] integerValue];
    //            NSLog(@"16.提交订单 ------%d",result);
    //        }
    //        else{
    //            NSLog(@"失败");
    //        }
    //    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
