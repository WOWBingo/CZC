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
#import "ZDYPrintObject.h"

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

- (void)viewWillAppear:(BOOL)animated{
    [self getAddress];
    [self getOrderNumber];
    [self getPayment];
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
        [cell.nameLabel setText:[NSString stringWithFormat:@"%@  %@",_addressObj.name,_addressObj.mobile]];
        [cell.addressLabel setText:_addressObj.address];
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




#pragma mark - 网络数据操作
/**
 *  支付方式列表
 */
-(void)getPayment{
    [CZCService GETmethod:kPayMentList_URL andParameters:@"" andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            NSArray *dataArr = [myresult objectForKey:@"AddressList"];
            _paymentList = [PaymentObject objectArrayWithKeyValuesArray:dataArr];
            if (_paymentList.count > 1) {
                _paymentObject = [_paymentList objectAtIndex:0];
            }
        }
        else{
            NSLog(@"获取支付方式失败");
        }
    }];
}

/**
 *  收货地址列表
 */
-(void)getAddress{
    /** 18.收货地址列表 http://app.czctgw.com/api/address/a465788 */
    NSString *params = @"a465788";
    [CZCService GETmethod:kAddressList_URL andParameters:params andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            NSArray *dataArr = [myresult objectForKey:@"AddressList"];
            NSArray *list = [AddressObject objectArrayWithKeyValuesArray:dataArr];
            BOOL isHaveDefault;
            for (int i = 0; i < list.count; i++) {
                AddressObject *addressObj = [list objectAtIndex:i];
                if (addressObj.isDefault) {
                    _addressObj = addressObj;
                    isHaveDefault = YES;
                    break;
                }
            }
            if (!isHaveDefault) {
                _addressObj = [list objectAtIndex:0];
            }
            [self.tableView reloadData];
        }
        else{
            NSLog(@"失败");
        }
    }];
}

/**
 *	生成订单号
 */
- (void)getOrderNumber{
    [CZCService GETmethod:kGetOrder_URL andParameters:@"" andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            _tradeID = [myresult objectForKey:@"OrderNumber"];
            NSLog(@" 生成订单号 ------%@",_tradeID);
        }
        else{
            NSLog(@"失败");
        }
    }];
}
/**
 *	提交订单
 *
 */
- (IBAction)accountClick:(id)sender{
    
    //对象转换成字典，注意首字大写
    NSArray *dictArray = [ShopCarObject keyValuesArrayWithObjectArray:_selectedShopList];
    ShopCarObject *shopObject = [_selectedShopList objectAtIndex:0];
    NSMutableArray *productDicList = [[NSMutableArray alloc]init];
    for (int i = 0; i < shopObject.productList.count; i++) {
        ShopCarProductObject *productObject = [shopObject.productList objectAtIndex:i];
        NSDictionary *productDic = [ZDYPrintObject getObjectData:productObject];//getObjectData经过修改，首字大写
        [productDicList addObject:productDic];
    }
    
    NSLog(@"%@",productDicList);
    for (NSMutableDictionary *productDic in productDicList) {
        [productDic removeObjectForKey:@"IsSelected"];
    }
    //
    //    NSDictionary *dic = @{
    //                          @"MemLoginID": @"111111",
    //                          @"OrderNumber": _tradeID,
    //                          @"TradeID": _tradeID,
    //                          @"Name": _addressObj.name,
    //                          @"Email": _addressObj.email,
    //                          @"Address": _addressObj.address,
    //                          @"Postalcode":_addressObj.postalcode,
    //                          @"Tel": _addressObj.tel,
    //                          @"Mobile": _addressObj.mobile,
    //                          @"PaymentGuid": _paymentObject.guid,
    //                          @"OutOfStockOperate": @"",
    //                          @"ClientToSellerMsg": @"",//留言
    //                          @"RegionCode":@"1",//配送区域编码
    //                          @"PostType": @"0",//快递方式
    //                          @"orderPrice":@"",//订单价格
    //                          @"ProductPrice": @"",//产品价格
    //                          @"DispatchPrice": @"0.00",//邮费
    //                          @"ShouldPayPrice": @"248.00",//应支付
    //                          @"ProductList": productDicList
    //                          };
    //
    //    NSLog(@"%@",productDicList);
    
    NSData *testData = [NSJSONSerialization dataWithJSONObject:productDicList options:0 error:nil];
    NSString *testStr = [NSString stringWithUTF8String:[testData bytes]];//[[NSString alloc] initWithBytes:[testData bytes] length:[testData length] encoding:NSUTF8StringEncoding];
    
    //testStr = [NSString stringWithFormat:@"%@%@",kOrderAdd_URL,testStr];
    // NSLog(@"%@",dic);
    NSLog(@"%@",testStr);
    
    NSString *str2 = [NSString stringWithFormat:@"%@",productDicList];
    str2 = [str2 stringByReplacingOccurrencesOfString:@"(" withString:@"["];
    str2 = [str2 stringByReplacingOccurrencesOfString:@")" withString:@"]"];
    
    /**  16.提交订单(1) http://app.czctgw.com/api/order/*/
    NSDictionary *dic = @{
                          @"MemLoginID": @"111111",
                          @"OrderNumber": _tradeID,
                          @"TradeID": _tradeID,
                          @"Name": @"陈胜",// _addressObj.name,
                          @"Email": @"",
                          @"Address": @"江苏省苏州市常熟市 江苏省苏州市常熟市古里镇小康村庐山苑三区31号",//_addressObj.address,
                          @"Postalcode": @"215500",//_addressObj.postalcode,
                          @"Tel": @"",//_addressObj.tel,
                          @"Mobile": @"15952069203",//_addressObj.mobile,
                          @"PaymentGuid": @"c7e5c13c-dd60-4f76-bf50-54297997b7dd",
                          @"ProductPrice": @"248.00",
                          @"DispatchPrice": @"0.00",
                          @"ShouldPayPrice": @"248.00",
                          @"OutOfStockOperate": @"",
                          @"ClientToSellerMsg": @"",
                          @"RegionCode":@"1",
                          @"orderPrice":@"248.00",
                          @"PostType": @"0",
                          @"ProductList":productDicList
                          };
    
//    
//    NSLog(@"%@",dic);
    NSData *dicData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:nil];
    NSString *dicStr = [[NSString alloc] initWithBytes:[dicData bytes] length:[dicData length] encoding:NSUTF8StringEncoding];
    NSLog(@"dicStr:%@",dicStr);
  //  NSLog(@"%@",dic);
    [self downloadData:dicStr];
    
    //IOS自己的JSON转换方式
//    NSData* data = [NSJSONSerialization dataWithJSONObject:[location toDictionary] options:0 error:NULL];
//    NSString *jsonString = [NSString stringWithUTF8String:[data bytes]];
    
//    NSString* urlStr = @"http://app.czctgw.com/api/order/";
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [manager  POST:urlStr parameters:dicStr success:^(AFHTTPRequestOperation *operation, id responseObject){
//        
//        NSDictionary *dic =  (NSDictionary *) responseObject;
//        NSLog(@"%@",dic);
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"%@",error);
//
//    }    ];
//    
    
//    
//    [CZCService POSTmethod:kOrderAdd_URL andDicParameters:dic andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            NSInteger result = [[myresult objectForKey:@"return"] integerValue];
//            NSLog(@"162222.提交订单 ------%d",result);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
}

- (void)downloadData:(NSString*)str
{
    // 1. 创建NSURL类型对象
    NSURL *url = [NSURL URLWithString:@"http://app.czctgw.com/api/order/"];
    // 2. 创建NSMutableURLRequest类型对象
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    // 转化为二进制数据
    NSData *paramData = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    // 1) 设置请求体
    [request setHTTPBody:paramData];
    
    // 2) 设置请求方式
    [request setHTTPMethod:@"post"];
    
    // 3) 设置请求参数的大小
    NSString *lengthStr = [NSString stringWithFormat:@"%ld", paramData.length];
    [request setValue:lengthStr forHTTPHeaderField:@"content-length"];
    
    // 4) 设置类型
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
    
    // 3.发送请求
    _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];

}
//接收到服务器回应的时候调用此方法
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *res = (NSHTTPURLResponse *)response;
    NSLog(@"%@",[res allHeaderFields]);
    self.receiveData = [NSMutableData data];
    
}
//接收到服务器传输数据的时候调用，此方法根据数据大小执行若干次
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receiveData appendData:data];
}
//数据传完之后调用此方法
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *receiveStr = [[NSString alloc]initWithData:self.receiveData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",receiveStr);
}
//网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
-(void)connection:(NSURLConnection *)connection
 didFailWithError:(NSError *)error
{
    NSLog(@"%@",[error localizedDescription]);
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
