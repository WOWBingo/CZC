//
//  Key.m
//  CZC
//
//  Created by 周德艺 on 15/8/11.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "Key.h"

#pragma mark - 网络
/** 全局用户对象 */
AccoutObject *kAccountObject = nil;

NSString *const kConnectionFailureError = @"连接失败，请检查网络连接";
NSString *const kRequestTimedOutError  = @"请求超时，请检查连接网络";
NSString *const kAuthenticationError  = @"认证失败，请检查网络连接";

NSString *const kPublic_URL = @"http://app.czctgw.com/";
NSString *const kImage_URL = @"http://www.czctgw.com";

/**1.平台首页新品，推荐，热卖，精品 type=2&sorts=ModifyTime&isASC=true&pageIndex=1&pageCount=5&CityDomainName=wuhan */
NSString *const kHomeNewAdMore_URL = @"api/product2/type/?";

/**2.产品搜索 sorts=SaleNumber&isASC=true&pageIndex=1&pageCount=5&name=4&CityDomainName=wuhan */
NSString *const kProductSearch_URL = @"api/product/search/-1?";

/**3.店铺搜索和店铺列表pageIndex=1&pageCount=5&OderStatus=1&keyKeyword=c&CtiyDomainName=wuhan */
NSString *const kShops_URL = @"api/shops?";

/**4.平台产品类别 0 */
NSString *const kProductCatagory_URL = @"api/productcatagory/";

/**5.平台产品列表  004001001?sorts=SaleNumber&isASC=true&pageIndex=1&pageCount=5&CtiyDomainName=wuhan*/
NSString *const kProductList_URL = @"api/product/listNew/";

/**6.产品详细 67c5d699-d41a-4bd7-9b8a-62e94aeee709  */
NSString *const kProductInfo_URL = @"api/product/";

/**7.产品规格 67c5d699-d41a-4bd7-9b8a-62e94aeee709 */
NSString *const kProSpecificationList_URL = @"api/SpecificationList/";

/**8.规格查询价格/67c5d699-d41a-4bd7-9b8a-62e94aeee709?Detail=%u84DD%u8272%2C52%7C185/104%28XXL%29%2C93%7C%u5957%u9910%u4E09%2C95*/
NSString *const kPriceBySpecification_URL = @"api/Specification/";

/**9.店铺详细信息 10001 */
NSString *const kShopsInfo_URL = @"api/shopsinfo/";

/**10.店铺评价 10001?pageIndex=1&pageCount=5&T=1 */
NSString *const kProductComment3_URL = @"api/product/ProductComment3/";

/**11. 购物车列表 111111*/
NSString *const kShoppingCartList_URL = @"api/shoppingcart2/";

/** 12.添加购物车(1) */
NSString *const kShoppingCartAdd_URL = @"api/shoppingcart/";

/** (2) 直接购买时使用 */
NSString *const kBuyNow_URL = @"api/shoppingcart2/";

/** 13删除购物车产品 /1111111/b6551b4d-7bbe-45a8-b674-7df54682336f */
NSString *const kShoppingCartDelete_URL = @"api/shoppingcart/";

/** 14.订单列表 pageIndex=1&pageCount=5&memLoginID=111111&t=1 */
NSString *const kOrderNumber_URL = @"api/order/member/OrderList?";

/** 15.订单详情 201310245746481 */
NSString *const kOrderInfo_URL = @"api/order/";

/** 16.提交订单 /api/order/ */
NSString *const kOrderAdd_URL = @"api/order/";

/** 17.取消订单 /api/order/OrderUpdate/10099d24-0360-4f4a-b174-9a4277cc1e9d */
NSString *const kOrderDelete_URL = @"api/order/OrderUpdate/";

/** 18.收货地址列表 /api/address/111111 */
NSString *const kAddressList_URL = @"api/address/";

/** 19.支付方式列表 /api/payment/ */
NSString *const kPayMentList_URL = @"api/payment/";

/** 20.用户信息 /api/account/111111 */
NSString *const kAccountInfo_URL = @"/api/account/";

/** 21.判断用户是否存在 /api/account/userexist/111111 */
NSString *const kAccountIsHave_URL = @"api/account/userexist/";

/** 22.用户注册 /api/account/Regist */
NSString *const kAccountRegist_URL = @"api/account/Regist";

/** 23.产品收藏列表 api/CollectList?MemLoginID=111111&pageIndex=1&pageCount=5 */
NSString *const kProCollectList_URL = @"api/CollectList?";

/** 24.产品收藏删除 /api/mycollect/delete?Guid=dc900185-1203-4dd0-8682-d490acb03b6b&MemLoginID=111111 */
NSString *const kProCollectDelete_URL = @"api/mycollect/delete?";

/** 25.店铺收藏列表 /api/ShopCollectList?MemLoginID=111111&pageIndex=1&pageCount=5 */
NSString *const kShopCollectList_URL = @"api/ShopCollectList?";

/** 26.店铺收藏删除 /api/Shopcollect/DELETE?Guid=81e8aaf7-b566-41b9-99c2-7c70351510c7&memLoginID=111111 */
NSString *const kShopCollectDelete_URL = @"api/Shopcollect/DELETE?";

/** 27.商品信誉评价 /api/product/ProductComment2/abbe7fca-6f62-416d-8d52-6e29db58e48d?pageIndex=1&pageCount=5&T=0 */
NSString *const kProductComment_URL = @"api/product/ProductComment2/";

/** 28.店铺信誉评价 /api/product/ProductComment3/10001?pageIndex=1&pageCount=5&T=1 */
NSString *const kShopComment_URL = @"api/product/ProductComment3/";

/** 29.会员消息列表 /api/membermessage/list/1/111111 */
NSString *const kMemberMessage_URL = @"api/membermessage/list/";

/** 30.删除会员消息 /api/membermessage/delete/?msgId=75df9d79-8a3b-4685-864d-46f1ded476a7&MemLoginID=111111 */
NSString *const kMemberMessageDelete_URL = @"api/membermessage/delete/?";

/** 31.店铺新品，推荐，热门，精品 /api/product1/type/?type=2&sorts=ModifyTime&isASC=true&pageIndex=1&pageCount=5&shopid=10001 */
NSString *const kProNewAdMoreURL = @"api/product1/type/?";

/** 32.店铺产品列表+搜索 /api/product/list/-1?sorts=SaleNumber&isASC=true&pageIndex=1&pageCount=5&shopid=10001&name=1 */
NSString *const kShopProList_URL = @"api/product/list/-1?";

/** 33.确定收货 /api/order/UpdateShipmentStatus/926c2491-ca2f-47a4-90d9-52bcecdda0d9/111111?OrderNumber=20146565786565 */
NSString *const kShipmentStatusUpdate_URL = @"api/order/UpdateShipmentStatus/";

/** 34.物流单号跟踪 http://m.kuaidi100.com/index_all.html?type=[快递公司编码]&postid=[快递单号] */
NSString *const kkuaidi100_URL = @"http://m.kuaidi100.com/index_all.html?type=[快递公司编码]&postid=[快递单号]";

/** 35.查询库存量 /api/product/GetProductRepertoryCount/aaf6b80b-d0f4-492f-afc4-1a7f99835628?SpecificationValue=%u8910%u8272%2C3%7C180/96%28XL%29%2C86%7C%u5957%u9910%u4E94B%2C97 */
NSString *const kProductRepertoryCount_URL = @"api/product/GetProductRepertoryCount/";

/** 36.店铺类别 一级类别 /api/productcatagory/0/10001 */
//NSString *const kProductCatagory_URL = @"api/productcatagory/"

/** 37.退货 /api/order/Returnofgoods/987AD705-5149-4918-95BF-13552175F369/111111 */
NSString *const kOrderReturnofgoods_URL = @"api/order/Returnofgoods/";

/** 38.添加收货地址 /api/address/ */
NSString *const kAddressAdd_URL = @"api/address/";

/** 39.省、市、区 /api/region/ */
NSString *const kRegion_URL = @"api/region/";

/** 40.产品收藏 /api/Collect/?productGuid=926c2491-ca2f-47a4-90d9-52bcecdda0d9&sellLoginid=shop1&shopname=女装&MemLoginID=111111 */
NSString *const kProCollect_URL = @"api/Collect/?";

/** 41.登陆 /api/account/login/ */
NSString *const kAccountLogin_URL = @"api/account/login/";

/** 42.广告图片 /api/ShopGGlist/10001 */
NSString *const kShopGGlist_URL = @"api/ShopGGlist/";

/** 43.添加收藏店铺 /api/Shopcollect/Add?memLoginID=111111&shopid=10001 */
NSString *const kShopCollectAdd_URL = @"api/Shopcollect/Add?";

/** 44.买家商品评价 api/ProductComment/Add */
NSString *const kProductCommentAdd_URL = @"api/ProductComment/Add";

/** 45.商品回评 api/ProductComment/LastAdd */
NSString *const kProductCommentLastAdd_URL = @"api/ProductComment/LastAdd";

/** 46.修改用户信息、密码修改 /api/UpdateAccount */
NSString *const kAccountInfoUpdate_URL = @"api/UpdateAccount";

/** 47.预存款支付 api/order/BuyAdvancePayment/111111?OrderNumber=2014374374932749&PayPwd=123456 */
NSString *const kBuyAdvancePayment_URL = @"api/order/BuyAdvancePayment/";

/** 48.删除收货地址默认收货地 /api/address/del/33e36e94-a2e2-4900-aa2a-58a65af5df91?t=1&MemLoginID=111111 */
NSString *const kAddressDefaultDel_URL = @"api/address/del/";

/** 49.生成订单号 api/getorderno */
NSString *const kGetOrder_URL = @"api/getorderno";

/** 50.密码修改 /api/UpdateAccount */
NSString *const kAccountUpdate_URL = @"api/UpdateAccount";

/** 51.手机网页支付（支付宝）/alipay/default.aspx?out_trade_no=201403271635257500&subject=订单:201403271635257500&total_fee=0.01 */
NSString *const kAlipay_URL = @"alipay/default.aspx?";

/** 52 修改站内信息已读状态 /api/membermessage/IsReaded?Guid=409de06e-9c9c-4d6e-8e3b-6b125a699d27 */
NSString *const kMemberMessageIsReaded_URL = @"api/membermessage/IsReaded?";

/** 53 退货(退款)申请 /api/order/Returnofgoods2 */
NSString *const kReturnofgoods_URL = @"api/order/Returnofgoods2";

/** 54.邮费计算/api/Appshopfeetemplate?productguid=82def311-4d4c-4790-bf8a-9913812ba5c5,1|82def311-4d4c-4790-bf8a-9913812ba5c5,1&code=001 */
NSString *const kAppShopfeetemplate_URL = @"api/Appshopfeetemplate?";

/** 55.APP欢迎图 /api/welcome/ */
NSString *const kWelcome_URL = @"api/welcome/";

/** 56.手机网页支付（支付宝，多订单支付）/alipay2/default.aspx?out_trade_no=201403271635257500&subject=订单:201403271635257500&total_fee=0.01  */
NSString *const kAlipayMore_URL = @"alipay2/default.aspx?";

/** 57. 获取所有城市名称及地址 /api/city/all */
NSString *const kCityAllInfo_URL = @"api/city/all";

/** 58.其他会员发给当前消息列表 /api/membermessage/tomember/list/?pageIndex=1&pageSize=5&ReLoginID=liuxing */
NSString *const kMemberNowMessageList_URL = @"api/membermessage/tomember/list/?";

/** 59. 城市多用户首页轮播图片/api/ShopGGlistIndex/?CityDomianName=chengdu */
NSString *const kShopGGlistIndex_URL = @"api/ShopGGlistIndex/?";

/** 60. 注册获取手机验证码/Api/OpenApi/IntegralPro.ashx?method=SendCodeForCheck&memid=shop5&strMobile=15865656565*/
NSString *const kMobileVerifyCode_URL = @"Api/OpenApi/IntegralPro.ashx?";

NSString *const kSortsProModifyTime = @"ModifyTime";
NSString *const kSortsProPrice = @"Price";
NSString *const kSortsProSaleNumber = @"SaleNumber";
NSString *const kSortsisASCTrue = @"true";
NSString *const kSortsisASCFalse = @"false";


#pragma mark - 常量
CGFloat const kHUDTime = 1.0f;
CGFloat const kAnimaTime  = 0.30f;
NSString *const kLastCatchTime = @"LastCatchTime";
NSString *const kLastCatchInfoTime = @"LastCatchTime_Info";
NSString *const kIsNetConnect = @"isNetConnect";
NSString *const PASSWORD = @"password";//密码
NSString *const USERINFO = @"userInfo";//用户信息
NSString *const ISAUTOLOGIN = @"isAutoLogin";//是否自动登录的key

/** tabbar最近一次选择的Index */
NSUInteger kLastSelectedIndex = 0;
NSString *const kAccoutInfo_Default = @"accoutInfo";

@implementation Key

@end
