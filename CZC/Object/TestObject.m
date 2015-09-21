//
//  TestObject.m
//  CZC
//
//  Created by 周德艺 on 15/8/8.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "TestObject.h"
#import "CZCAPIService.h"
#import "ProductsObject.h"
#import "ProductCatagoryObject.h"
#import "SpecificationObject.h"
#import "SpecificationOfPriceObject.h"
#import "SpecificationAllObject.h"
#import "ShopObject.h"
#import "CommentObject.h"
#import "ShopCarObject.h"
#import "ShopCarProductObject.h"
#import "OrderObject.h"
#import "OrderProductObject.h"
#import "AddressObject.h"
#import "PaymentObject.h"
#import "AccoutObject.h"
#import "CollectProductObject.h"
#import "CollectShopObject.h"
#import "MessageObject.h"
#import "HomeImageObject.h"

@implementation TestObject

-(void)getData{
    
#pragma mark - 平台首页新品，推荐，热卖，精品
    /**
     *平台首页新品，推荐，热卖，精品
     *	http://app.czctgw.com/api/product2/type/?type=0&sorts=ModifyTime&isASC=true&pageIndex=1&pageCount=5&CityDomainName=gy
     
     */
    NSString *params = [NSString stringWithFormat:@"type=0&sorts=ModifyTime&isASC=true&pageIndex=1&pageCount=5&CityDomainName=gy"];
//    [CZCService GETmethod:kHomeNewAdMore_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        NSDictionary *result = myresult;
//        if (result) {
//            NSArray *dataArr = [result objectForKey:@"Data"];
//            NSArray *productList = [ProductsObject objectArrayWithKeyValuesArray:dataArr];
//            NSLog(@"1.平台首页新品，推荐，热卖，精品平台首页新品，推荐，热卖，精品------%@",productList);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];

    
#pragma mark - 2.产品搜索
    /**
     *2.产品搜索
     *	http://app.czctgw.com/api/product/search/-1?sorts=SaleNumber&isASC=true&pageIndex=1&pageCount=5&name=&CityDomainName=gy
     
     */
//    params = [NSString stringWithFormat:@"sorts=SaleNumber&isASC=true&pageIndex=1&pageCount=5&name=&CityDomainName=gy"];
//    [CZCService GETmethod:kProductSearch_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        NSDictionary *result = myresult;
//        if (result) {
//            NSArray *dataArr = [result objectForKey:@"Data"];
//            NSArray *productList = [ProductsObject objectArrayWithKeyValuesArray:dataArr];
//            NSLog(@"2.产品搜索------%@",productList);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];

#pragma mark - 3.店铺搜索列表
    /** 3.店铺搜索列表 http://app.czctgw.com/api/shops?pageIndex=1&pageCount=5&OderStatus=0&keyKeyword=&CityDomainName=gy */
//    params = @"pageIndex=1&pageCount=5&OderStatus=0&keyKeyword=&CityDomainName=gy";
//    [CZCService GETmethod:kShops_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            NSInteger count = [[myresult objectForKey:@"Count"]integerValue];
//            NSArray *dataArr = [myresult objectForKey:@"Data"];
//            NSArray *list = [ShopObject objectArrayWithKeyValuesArray:dataArr];
//            NSLog(@"3.店铺搜索列表 ------%@",list);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
    
#pragma mark - 4.平台产品类别
    /**
     *4.平台产品类别
     *	http://app.czctgw.com/api/productcatagory/0
     */
//    params = @"0";
//    [CZCService GETmethod:kProductCatagory_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        NSDictionary *result = myresult;
//        if (result) {
//            NSArray *dataArr = [result objectForKey:@"productcatagory"];
//            NSArray *list = [ProductCatagoryObject objectArrayWithKeyValuesArray:dataArr];
//            NSLog(@"4.平台产品类别------%@",list);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
    
    
#pragma mark - 5.平台产品列表
    /**
     *5.平台产品列表 http://app.czctgw.com/api/product/list/004001001?sorts=SaleNumber&isASC=true&pageIndex=1&pageCount=5&CityDomainName=gy */
//    params = [NSString stringWithFormat:@"004001001?sorts=SaleNumber&isASC=true&pageIndex=1&pageCount=5&CityDomainName=gy"];
//    [CZCService GETmethod:kProductList_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        NSDictionary *result = myresult;
//        if (result) {
//            NSArray *dataArr = [result objectForKey:@"Data"];
//            NSArray *productList = [ProductsObject objectArrayWithKeyValuesArray:dataArr];
//            NSLog(@"5.平台产品列表------%@",productList);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
    
#pragma mark - 6.产品详细
    /**
     *6.产品详细
     *	http://app.czctgw.com/api/product/d3777035-8d88-4e87-8d2b-7021e03d4d2a
     */
//    params = @"d3777035-8d88-4e87-8d2b-7021e03d4d2a";
//    [CZCService GETmethod:kProductInfo_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        NSDictionary *result = myresult;
//        if (result) {
//            NSDictionary *dic = [result objectForKey:@"ProductInfo"];
//            ProductsObject *object = [ProductsObject objectWithKeyValues:dic];
//            NSLog(@"6.产品详细------%@",object);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
    
#pragma mark - 7.产品规格
    /**
     *7.产品规格 
     *	http://app.czctgw.com/api/SpecificationList/8BF39849-C3B8-4529-ABE6-6D3E1DA5227D
     */
//    params = @"8BF39849-C3B8-4529-ABE6-6D3E1DA5227D";
//    [CZCService GETmethod:kProSpecificationList_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        NSDictionary *result = myresult;
//        if (result) {
//            NSArray *dataArr = [result objectForKey:@"SpecificationProudct"];
//            NSArray *list = [SpecificationAllObject objectArrayWithKeyValuesArray:dataArr];
//            NSLog(@"7.产品规格 ------%@",list);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
    
#pragma mark - 8.规格查询价格
    /**
     *8.规格查询价格
     *http://app.czctgw.com/api/Specification/8bf39849-c3b8-4529-abe6-6d3e1da5227d?Detail=%E7%89%9B%E4%BB%94%E8%93%9D,234%7CM,665
     *
     */
//    params = @"8bf39849-c3b8-4529-abe6-6d3e1da5227d?Detail=牛仔蓝,234%7CM,665";
//    [CZCService GETmethod:kPriceBySpecification_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        NSDictionary *result = myresult;
//        if (result) {
//            NSArray *dataArr = [result objectForKey:@"Specification"];
//            NSArray *list = [SpecificationOfPriceObject objectArrayWithKeyValuesArray:dataArr];
//            NSLog(@"8.产品规格获得价格 ------%@",list);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];

#pragma mark - 9.店铺详细信息
    /**
     *9.店铺详细信息
     *http://app.czctgw.com/api/shopsinfo/100001058
     */
//    params = @"100001058";
//    [CZCService GETmethod:kShopsInfo_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        NSDictionary *result = myresult;
//        if (result) {
//            NSDictionary *dic = [result objectForKey:@"Shop"];
//            ShopObject *object = [ShopObject objectWithKeyValues:dic];
//            NSLog(@"9.店铺详细信息 ------%@",object);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
    
#pragma mark - 10.店铺评价
    /**
     *10.店铺评价
     *http://app.czctgw.com/api/product/ProductComment3/100001104?pageIndex=1&pageCount=5&T=1
     */
//    params = @"100001104?pageIndex=1&pageCount=5&T=1";
//    [CZCService GETmethod:kProductComment3_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        NSDictionary *result = myresult;
//        if (result) {
//            NSInteger commentCount1 = [[result objectForKey:@"CommentCount1"]intValue];
//            NSInteger commentCount2 = [[result objectForKey:@"CommentCount2"]intValue];
//            NSInteger commentCount3 = [[result objectForKey:@"CommentCount3"]intValue];
//            NSInteger commentCount4 = [[result objectForKey:@"CommentCount4"]intValue];
//            NSInteger pageIndex = [[result objectForKey:@"pageIndex"]intValue];
//            NSInteger count = [[result objectForKey:@"Count"]intValue];
//            NSArray *dataArr = [result objectForKey:@"Data"];
//            NSArray *list = [CommentObject objectArrayWithKeyValuesArray:dataArr];
//            NSLog(@"10.店铺评价 ------%@",list);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
    
#pragma mark - 11. 购物车列表
    /**11. 购物车列表  http://app.czctgw.com/api/shoppingcart2/a465788 */
//    params = @"a465788";
//    [CZCService GETmethod:kShoppingCartList_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        NSDictionary *result = myresult;
//        if (result) {
//            NSArray *dataArr = [result objectForKey:@"DATA"];
//            NSArray *list = [ShopCarObject objectArrayWithKeyValuesArray:dataArr];
//            NSLog(@"11. 购物车列表 ------%@",list);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];

    
#pragma mark - 12.添加购物车(1)
    /**  12.添加购物车(1) http://app.czctgw.com/api/shoppingcart/ */
//    NSDictionary *dic = @{
//                          @"MemLoginID":@"111111",
//                          @"ProductGuid":@"af0c9869-d790-482b-af24-6c8e1e5ada1c",
//                          @"BuyNumber":@"1",
//                          @"BuyPrice":@"234",
//                          @"Attributes":@"",
//                          @"ExtensionAttriutes":@"M",
//                          @"SpecificationName":@"颜色:褐色;鞋码:40",
//                          @"SpecificationValue":@"褐色,3|40,139"
//                          };
//    [CZCService POSTmethod:kShoppingCartAdd_URL andDicParameters:dic andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            NSInteger result = [[myresult objectForKey:@"return"] integerValue];
//            NSLog(@"添加购物车结果 ------%d",result);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
 
    
#pragma mark - (2) 直接购买时使用
    /** (2) 直接购买时使用 http://app.czctgw.com/api/shoppingcart2/ */
//    [CZCService POSTmethod:kBuyNow_URL andDicParameters:dic andHandle:^(NSDictionary *myresult) {
//        NSDictionary *result = myresult;
//        if (result) {
//            NSArray *dataArr = [result objectForKey:@"shoppingCart"];
//            NSArray *list = [ShopCarProductObject objectArrayWithKeyValuesArray:dataArr];
//            NSLog(@"直接购买时使用 ------%@",list);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
//    
    
#pragma mark - 13删除购物车产品
    /** 13删除购物车产品 http://app.czctgw.com/api/shoppingcart/pw7606/274D288D-3EBA-46D6-BC84-027A613922F2 */
//    params = @"pw7606/274D288D-3EBA-46D6-BC84-027A613922F2";
//    [CZCService GETmethod:kShoppingCartDelete_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            NSInteger result = [[myresult objectForKey:@"return"]integerValue];
//            if (result == 200) {
//                NSLog(@"13删除购物车产品 ------成功");
//            }
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
    
#pragma mark - 14.订单列表！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！已用
    /** 14.订单列表 http://app.czctgw.com/api/order/member/OrderList?pageIndex=1&pageCount=5&memLoginID=yemao&t=2 */
//    params = @"pageIndex=1&pageCount=5&memLoginID=111111&t=0";//yemao
//    [CZCService GETmethod:kOrderNumber_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            NSInteger count = [[myresult objectForKey:@"Count"]integerValue];
//            NSArray *dataArr = [myresult objectForKey:@"Data"];
//            NSArray *list = [OrderObject objectArrayWithKeyValuesArray:dataArr];
//            NSLog(@"14.订单列表 ------%@",list);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
    
#pragma mark - 15.订单详情！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！已用
    /** 15.订单详情 http://app.czctgw.com/api/order/201503091548989 */
//    params = @"201503091548989";
//    [CZCService GETmethod:kOrderInfo_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            NSDictionary *dic = [myresult objectForKey:@"Orderinfo"];
//            OrderObject *object = [OrderObject objectWithKeyValues:dic];
//            NSLog(@"15.订单详情 ------%@",object);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
    
    
#pragma mark - 16.提交订单
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
    
#pragma mark - 18.收货地址列表！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！已用
    /** 18.收货地址列表 http://app.czctgw.com/api/address/a465788 */
//    params = @"a465788";
//    [CZCService GETmethod:kAddressList_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            NSArray *dataArr = [myresult objectForKey:@"AddressList"];
//            NSArray *list = [AddressObject objectArrayWithKeyValuesArray:dataArr];
//            NSLog(@"18.收货地址列表 ------%@",list);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
    
    
#pragma mark - 19.支付方式列表
    /** 19.支付方式列表 http://app.czctgw.com/api/payment/ */
//    params = @"a465788";
//    [CZCService GETmethod:kPayMentList_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            NSArray *dataArr = [myresult objectForKey:@"PaymentList"];
//            NSArray *list = [PaymentObject objectArrayWithKeyValuesArray:dataArr];
//            NSLog(@"19.支付方式列表 ------%@",list);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
    
    
#pragma mark - 20.用户信息！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！已用
    /** 20.用户信息 http://app.czctgw.com/api/account/a465788 */
//    params = @"a465788";
//    [CZCService GETmethod:kAccountInfo_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            NSDictionary *dic = [myresult objectForKey:@"AccoutInfo"];
//            AccoutObject *object = [AccoutObject objectWithKeyValues:dic];
//            NSLog(@"20.用户信息 ------%@",object);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
    
    
    /** 21.判断用户是否存在 /api/account/userexist/111111 */
    
#pragma mark - 22.用户注册
    /** 22.用户注册 /api/account/Regist */
//    NSDictionary *accountDic = @{
//                          @"MemLoginID" : @"zhou101",
//                          @"Pwd" : @"qaz123",
//                          };
//    
//    [CZCService POSTmethod:kAccountRegist_URL andDicParameters:accountDic andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            NSInteger result = [[myresult objectForKey:@"return"] integerValue];
//            NSLog(@"用户注册结果 ------%d",result);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
//    
#pragma mark - 23.产品收藏列表！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！已用
    /** 23.产品收藏列表 http://app.czctgw.com/api/CollectList?MemLoginID=zh010101&pageIndex=1&pageCount=5 */
//    params = @"MemLoginID=zh010101&pageIndex=1&pageCount=5 ";
//    [CZCService GETmethod:kProCollectList_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            NSInteger count = [[myresult objectForKey:@"Count"]integerValue];
//            NSArray *dataArr = [myresult objectForKey:@"Data"];
//            NSArray *list = [CollectProductObject objectArrayWithKeyValuesArray:dataArr];
//            NSLog(@"23.产品收藏列表 ------%@",list);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
    
    /** 24.宝贝收藏删除 /api/mycollect/delete?Guid=dc900185-1203-4dd0-8682-d490acb03b6b&MemLoginID=111111 */

#pragma mark - 25.店铺收藏列表！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！已用
    /** 25.店铺收藏列表 http://app.czctgw.com/api/ShopCollectList?MemLoginID=s1886&pageIndex=1&pageCount=5 */
//    params = @"MemLoginID=s1886&pageIndex=1&pageCount=5";
//    [CZCService GETmethod:kShopCollectList_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            NSInteger count = [[myresult objectForKey:@"Count"]integerValue];
//            NSArray *dataArr = [myresult objectForKey:@"Data"];
//            NSArray *list = [CollectShopObject objectArrayWithKeyValuesArray:dataArr];
//            NSLog(@"25.店铺收藏列表  ------%@",list);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
    
    /** 26.店铺收藏删除*/
    
#pragma mark - 27.商品信誉评价
    /** 27.商品信誉评价 http://app.czctgw.com/api/product/ProductComment2/ADBE421F-765C-4000-9196-008D8DE4ADDD?pageIndex=1&pageCount=5&T=pageIndex=1&pageCount=5&T=0 */
//    params = @"ADBE421F-765C-4000-9196-008D8DE4ADDD?pageIndex=1&pageCount=5&T=pageIndex=1&pageCount=5&T=0";
//    [CZCService GETmethod:kProductComment_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        NSDictionary *result = myresult;
//        if (result) {
//            NSInteger commentCount1 = [[result objectForKey:@"CommentCount1"]intValue];
//            NSInteger commentCount2 = [[result objectForKey:@"CommentCount2"]intValue];
//            NSInteger commentCount3 = [[result objectForKey:@"CommentCount3"]intValue];
//            NSInteger commentCount4 = [[result objectForKey:@"CommentCount4"]intValue];
//            NSInteger pageIndex = [[result objectForKey:@"pageIndex"]intValue];
//            NSInteger count = [[result objectForKey:@"Count"]intValue];
//            NSArray *dataArr = [result objectForKey:@"Data"];
//            NSArray *list = [CommentObject objectArrayWithKeyValuesArray:dataArr];
//            NSLog(@"27.商品信誉评价  ------%@",list);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
    
    /** 28.店铺信誉评价 同10.店铺评价*/
    
#pragma mark - 29.会员消息列表
    /** 29.会员消息列表 http://app.czctgw.com/api/membermessage/list/1/hyx888*/
//    params = @"1/hyx888";
//    [CZCService GETmethod:kMemberMessage_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            NSInteger count = [[myresult objectForKey:@"Count"]integerValue];
//            NSArray *dataArr = [myresult objectForKey:@"Data"];
//            NSArray *list = [MessageObject objectArrayWithKeyValuesArray:dataArr];
//            NSLog(@"29.会员消息列表 ------%@",list);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
    
#pragma mark - 38.收货地址!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!已用
//    NSDictionary *addressDic = @{
//                                 @"NAME":@"盖伦",
//                                 @"Email":@"wewe@qq.com",
//                                 @"Address":@"北京市北京辖区东城区",
//                                 @"Postalcode":@"423654",
//                                 @"Mobile":@"15236585965",
//                                 @"Tel":@"",
//                                 @"AddressCode":@"001",
//                                 @"MemLoginID":@"zhou001"
//                               };
//    [CZCService POSTmethod:kAddressAdd_URL andDicParameters:addressDic andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            NSInteger result = [[myresult objectForKey:@"return"] integerValue];
//            NSLog(@"38.收货地址结果 ------%d",result);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
    
#pragma mark - 44.登录
//    NSDictionary *loginDic = @{
//                               @"MemLoginID":@"zhou001",
//                               @"Pwd":@"qaz123",
//                               @"RememberMe":@"true",
//                               };
//    [CZCService POSTmethod:kAccountLogin_URL andDicParameters:loginDic andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            NSInteger result = [[myresult objectForKey:@"return"] integerValue];
//            NSLog(@"登录结果 ------%d",result);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
    
#pragma mark - 买家商品评价
//    
//    NSDictionary *dic = @{
//                               @"CommentType":@10,
//                               @"Speed":@3,
//                               @"Attitude":@2,
//                               @"Character":@1,
//                               @"Comment":@"hhhhhhhh",
//                               @"ProductGuid":@"821819f8-0383-40bf-b5c8-822ce6754cf5",
//                               @"ShopID":@"10001",
//                               @"MemLoginID":@"111111",
//                               @"ShopLoginid":@"shop1",
//                               @"ShopName":@" 精品女装",
//                               @"OrderGuid":@"821819f8-0383-40bf-b5c8-822ce6754cf5",
//                               @"ProductName":@"一个好的产品嘻嘻嘻",
//                               @"ProductPrice":@"100"
//                               };
//    [CZCService POSTmethod:kProductCommentAdd_URL andDicParameters:dic andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            NSInteger result = [[myresult objectForKey:@"return"] integerValue];
//            NSLog(@"评价结果 ------%d",result);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
    
#pragma mark - 商品回评
    
//    NSDictionary *dic = @{
//                          @"Guid":@"700caa5f-2ebf-4383-9335-228e39482534",
//                          @"ContinueReply":@"gfgfgfgfg"
//                          };
//    [CZCService POSTmethod:kProductCommentLastAdd_URL andDicParameters:dic andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            NSInteger result = [[myresult objectForKey:@"return"] integerValue];
//            NSLog(@"评价结果 ------%d",result);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
    
#pragma mark - 修改密码/用户信息!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!已用
    
//    NSDictionary *dic = @{
//                          @"Email":@"qwqwq@sina.cn ",
//                          @"MemLoginID":@"zhou001",
//                          @"RealName":@"测试名",
//                          @"QQ":@"121212"
//                          };
//    [CZCService POSTmethod:kAccountUpdate_URL andDicParameters:dic andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            NSInteger result = [[myresult objectForKey:@"return"] integerValue];
//            NSLog(@"修改密码结果 ------%d",result);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];

#pragma mark - 申请退货退款
    
//    NSDictionary *dic = @{
//                          @"OrderID":@"a272603c-caba-43a4-a354-1af15f98d0a6",
//                          @"RefundType":@1,
//                          @"RefundMoney":@10,
//                          @"RefundContent":@"xxxxxxxxxxxx",
//                          @"RefundImg":@"0110101010",
//                          @"MemLoginID":@"111111",
//                          @"ShopID":@"shop1",
//                          @"LogisticName":@"圆通",
//                          @"LogisticNumber":@"45254785478544"
//                          };
//    [CZCService POSTmethod:kReturnofgoods_URL andDicParameters:dic andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            NSInteger result = [[myresult objectForKey:@"return"] integerValue];
//            NSLog(@"修改密码结果 ------%d",result);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];

#pragma mark - 59.首页图片
    /**  59.首页图片 http://app.czctgw.com/api/ShopGGlistIndex/?CityDomianName=chengdu*/
//    params = @"CityDomianName=chengdu";
//    [CZCService GETmethod:kShopGGlistIndex_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            NSArray *dataArr = [myresult objectForKey:@"ImageList"];
//            NSArray *list = [HomeImageObject objectArrayWithKeyValuesArray:dataArr];
//            NSLog(@" 59.首页图片 ------%@",list);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
    
#pragma mark - 49.生成订单号
    /** 49.生成订单号 http://app.czctgw.com/api/getorderno*/
//    [CZCService GETmethod:kGetOrder_URL andParameters:@"" andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            NSString *OrderNumber = [myresult objectForKey:@"OrderNumber"];
//            NSLog(@" 生成订单号 ------%@",OrderNumber);
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
#pragma mark - 50.获取省、市、区！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！已用
    /** 49.获取省、市、区 http://app.czctgw.com/api/region/0*/
//        params = @"0";
//        [CZCService GETmethod:kRegion_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//            if (myresult) {
//                NSArray *resultArr = [myresult objectForKey:@"RegionList"];
//                NSLog(@" 获取省市区 ------%@",resultArr);
//            }
//            else{
//                NSLog(@"失败");
//            }
//        }];
    
}
/**
 *	Dci转JSON字符串
 *
 *	@param object	dic数据
 *
 *	@return JSON字符串
 */
-(NSString*)DataTOjsonString:(id)object
{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

@end
