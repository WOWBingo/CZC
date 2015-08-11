////
////  Key.h
////  CZC
////
////  Created by 周德艺 on 15/7/5.
////  Copyright (c) 2015年 周德艺. All rights reserved.
////
//#import <Foundation/Foundation.h>
//
//#ifndef CZC_Key_h
//#define CZC_Key_h
//
//
//#pragma mark - 网络
//
//#define CZCService [CZCAPIService shareService]
//
//#define kConnectionFailureError @"连接失败，请检查网络连接"
//#define kRequestTimedOutError   @"请求超时，请检查连接网络"
//#define kAuthenticationError    @"认证失败，请检查网络连接"
//
//#define K_Public_URL @"http://app.czctgw.com/"
//
///**1.平台首页新品，推荐，热卖，精品 type=2&sorts=ModifyTime&isASC=true&pageIndex=1&pageCount=5&CityDomainName=wuhan */
//#define K_HomeNewAdMore_URL @"api/product2/type/?"
//
///**2.产品搜索 sorts=SaleNumber&isASC=true&pageIndex=1&pageCount=5&name=4&CityDomainName=wuhan */
//#define K_ProductSearch_URL @"api/product/search/-1?"
//
///**3.店铺搜索和店铺列表pageIndex=1&pageCount=5&OderStatus=1&keyKeyword=c&CtiyDomainName=wuhan */
//#define K_Shops_URL @"api/shops?"
//
///**4.平台产品类别 0 */
//#define K_ProductCatagory_URL @"api/productcatagory/"
//
///**5.平台产品列表  004001001?sorts=SaleNumber&isASC=true&pageIndex=1&pageCount=5&CtiyDomainName=wuhan*/
//#define K_ProductList_URL @"api/product/list/"
//
///**6.产品详细 67c5d699-d41a-4bd7-9b8a-62e94aeee709  */
//#define K_ProductInfo_URL @"api/product/"
//
///**7.产品规格 67c5d699-d41a-4bd7-9b8a-62e94aeee709 */
//#define K_ProSpecificationList_URL @"api/SpecificationList/"
//
///**8.规格查询价格/67c5d699-d41a-4bd7-9b8a-62e94aeee709?Detail=%u84DD%u8272%2C52%7C185/104%28XXL%29%2C93%7C%u5957%u9910%u4E09%2C95*/
//#define K_PriceBySpecification_URL @"api/Specification/"
//
///**9.店铺详细信息 10001 */
//#define K_ShopsInfo_URL @"api/shopsinfo/"
//
///**10.店铺评价 10001?pageIndex=1&pageCount=5&T=1 */
//#define K_ProductComment3_URL @"api/product/ProductComment3/"
//
///**11. 购物车列表 111111*/
//#define K_ShoppingCartList_URL @"api/shoppingcart2/"
//
///** 12.添加购物车(1) */
//#define K_ShoppingCartAdd_URL @"api/shoppingcart/"
//
///** (2) 直接购买时使用 */
//#define K_BuyNow_URL @"api/shoppingcart/"
//
///** 13删除购物车产品 /1111111/b6551b4d-7bbe-45a8-b674-7df54682336f */
//#define K_ShoppingCartDelete_URL @"api/shoppingcart/"
//
///** 14.订单列表 pageIndex=1&pageCount=5&memLoginID=111111&t=1 */
//#define K_OrderNumber_URL @"api/order/member/OrderList?"
//
///** 15.订单详情 201310245746481 */
//#define K_OrderInfo_URL @"api/order/"
//
///** 16.提交订单 /api/order/ */
//#define K_OrderAdd_URL @"api/order/"
//
///** 17.取消订单 /api/order/OrderUpdate/10099d24-0360-4f4a-b174-9a4277cc1e9d */
//#define K_OrderDelete_URL @"api/order/OrderUpdate/"
//
///** 18.收货地址列表 /api/address/111111 */
//#define K_AddressList_URL @"api/address/"
//
///** 19.支付方式列表 /api/payment/ */
//#define K_PayMentList_URL @"api/payment/"
//
///** 20.用户信息 /api/account/111111 */
//#define K_AccountInfo_URL @"/api/account/"
//
///** 21.判断用户是否存在 /api/account/userexist/111111 */
//#define K_AccountIsHave_URL @"api/account/userexist/"
//
///** 22.用户注册 /api/account/Regist */
//#define K_AccountRegist_URL @"api/account/Regist"
//
///** 23.产品收藏列表 api/CollectList?MemLoginID=111111&pageIndex=1&pageCount=5 */
//#define K_ProCollectList_URL @"api/CollectList?"
//
///** 24.产品收藏删除 /api/mycollect/delete?Guid=dc900185-1203-4dd0-8682-d490acb03b6b&MemLoginID=111111 */
//#define K_ProCollectDelete_URL @"api/mycollect/delete?"
//
///** 25.店铺收藏列表 /api/ShopCollectList?MemLoginID=111111&pageIndex=1&pageCount=5 */
//#define K_ShopCollectList_URL @"api/ShopCollectList?"
//
///** 26.店铺收藏删除 /api/Shopcollect/DELETE?Guid=81e8aaf7-b566-41b9-99c2-7c70351510c7&memLoginID=111111 */
//#define K_ShopCollectDelete_URL @"api/Shopcollect/DELETE?"
//
///** 27.商品信誉评价 /api/product/ProductComment2/abbe7fca-6f62-416d-8d52-6e29db58e48d?pageIndex=1&pageCount=5&T=0 */
//#define K_ProductComment_URL @"api/product/ProductComment2/"
//
///** 28.店铺信誉评价 /api/product/ProductComment3/10001?pageIndex=1&pageCount=5&T=1 */
//#define K_ShopComment_URL @"api/product/ProductComment3/"
//
///** 29.会员消息列表 /api/membermessage/list/1/111111 */
//#define K_MemberMessage_URL @"api/membermessage/list/"
//
///** 30.删除会员消息 /api/membermessage/delete/?msgId=75df9d79-8a3b-4685-864d-46f1ded476a7&MemLoginID=111111 */
//#define K_MemberMessageDelete_URL @"api/membermessage/delete/?"
//
///** 31.店铺新品，推荐，热门，精品 /api/product1/type/?type=2&sorts=ModifyTime&isASC=true&pageIndex=1&pageCount=5&shopid=10001 */
//#define K_ProNewAdMoreURL @"api/product1/type/?"
//
///** 32.店铺产品列表+搜索 /api/product/list/-1?sorts=SaleNumber&isASC=true&pageIndex=1&pageCount=5&shopid=10001&name=1 */
//#define K_ShopProList_URL @"api/product/list/-1?"
//
///** 33.确定收货 /api/order/UpdateShipmentStatus/926c2491-ca2f-47a4-90d9-52bcecdda0d9/111111?OrderNumber=20146565786565 */
//#define K_ShipmentStatusUpdate_URL @"api/order/UpdateShipmentStatus/"
//
///** 34.物流单号跟踪 http://m.kuaidi100.com/index_all.html?type=[快递公司编码]&postid=[快递单号] */
//#define K_kuaidi100_URL @"http://m.kuaidi100.com/index_all.html?type=[快递公司编码]&postid=[快递单号]"
//
///** 35.查询库存量 /api/product/GetProductRepertoryCount/aaf6b80b-d0f4-492f-afc4-1a7f99835628?SpecificationValue=%u8910%u8272%2C3%7C180/96%28XL%29%2C86%7C%u5957%u9910%u4E94B%2C97 */
//#define K_ProductRepertoryCount_URL @"api/product/GetProductRepertoryCount/"
//
///** 36.店铺类别 一级类别 /api/productcatagory/0/10001 */
////#define K_ProductCatagory_URL @"api/productcatagory/"
//
///** 37.退货 /api/order/Returnofgoods/987AD705-5149-4918-95BF-13552175F369/111111 */
//#define K_OrderReturnofgoods_URL @"api/order/Returnofgoods/"
//
///** 38.添加收货地址 /api/address/ */
//#define K_AddressAdd_URL @"api/address/"
//
///** 39.省、市、区 /api/region/0 */
//#define K_Region_URL @"api/region/0"
//
///** 40.产品收藏 /api/Collect/?productGuid=926c2491-ca2f-47a4-90d9-52bcecdda0d9&sellLoginid=shop1&shopname=女装&MemLoginID=111111 */
//#define K_ProCollect_URL @"api/Collect/?"
//
///** 41.登陆 /api/account/login/ */
//#define K_AccountLogin_URL @"api/account/login/"
//
///** 42.广告图片 /api/ShopGGlist/10001 */
//#define K_ShopGGlist_URL @"api/ShopGGlist/"
//
///** 43.添加收藏店铺 /api/Shopcollect/Add?memLoginID=111111&shopid=10001 */
//#define K_ShopCollectAdd_URL @"api/Shopcollect/Add?"
//
///** 44.买家商品评价 api/ProductComment/Add */
//#define K_ProductCommentAdd_URL @"api/ProductComment/Add"
//
///** 45.商品回评 api/ProductComment/LastAdd */
//#define K_ProductCommentLastAdd_URL @"api/ProductComment/LastAdd"
//
///** 46.修改用户信息、密码修改 /api/UpdateAccount */
//#define K_AccountInfoUpdate_URL @"api/UpdateAccount"
//
///** 47.预存款支付 api/order/BuyAdvancePayment/111111?OrderNumber=2014374374932749&PayPwd=123456 */
//#define K_BuyAdvancePayment_URL @"api/order/BuyAdvancePayment/"
//
///** 48.删除收货地址默认收货地 /api/address/del/33e36e94-a2e2-4900-aa2a-58a65af5df91?t=1&MemLoginID=111111 */
//#define K_AddressDefaultDel_URL @"api/address/del/"
//
///** 49.生成订单号 api/getorderno */
//#define K_GetOrder_URL @"api/getorderno"
//
///** 50.密码修改 /api/UpdateAccount */
//#define K_AccountUpdate_URL @"api/UpdateAccount"
//
///** 51.手机网页支付（支付宝）/alipay/default.aspx?out_trade_no=201403271635257500&subject=订单:201403271635257500&total_fee=0.01 */
//#define K_Alipay_URL @"alipay/default.aspx?"
//
///** 52 修改站内信息已读状态 /api/membermessage/IsReaded?Guid=409de06e-9c9c-4d6e-8e3b-6b125a699d27 */
//#define K_MemberMessageIsReaded_URL @"api/membermessage/IsReaded?"
//
///** 53 退货(退款)申请 /api/order/Returnofgoods2 */
//#define K_OrderReturnofgoods_URL @"api/order/Returnofgoods2"
//
///** 54.邮费计算/api/Appshopfeetemplate?productguid=82def311-4d4c-4790-bf8a-9913812ba5c5,1|82def311-4d4c-4790-bf8a-9913812ba5c5,1&code=001 */
//#define K_AppShopfeetemplate_URL @"api/Appshopfeetemplate?"
//
///** 55.APP欢迎图 /api/welcome/ */
//#define K_Welcome_URL @"api/welcome/"
//
///** 56.手机网页支付（支付宝，多订单支付）/alipay2/default.aspx?out_trade_no=201403271635257500&subject=订单:201403271635257500&total_fee=0.01  */
//#define K_AlipayMore_URL @"alipay2/default.aspx?"
//
///** 57. 获取所有城市名称及地址 /api/city/all */
//#define K_CityAllInfo_URL @"api/city/all"
//
///** 58.其他会员发给当前消息列表 /api/membermessage/tomember/list/?pageIndex=1&pageSize=5&ReLoginID=liuxing */
//#define K_MemberNowMessageList_URL @"api/membermessage/tomember/list/?"
//
///** 59. 城市多用户首页轮播图片/api/ShopGGlistIndex/?CityDomianName=chengdu */
//#define K_ShopGGlistIndex_URL @"api/ShopGGlistIndex/?"
////
////密码找回问题接口
////查询会员的密码问题
////查询手机是否绑定接口
////查询邮箱是否绑定接口
////获取手机验证码接口
////物流列表接口
////物流查询接口
////积分列表接口
////积分详细接口
////积分下单接口
////积分明细接口
////评价列表页面接口
////获取所有城市列表接口
////周边商家列表接口(区域筛选、分类筛选、排序)
////头像上传接口
////昵称、性别、生日修改接口
////消息列表接口
////消息详细接口
////收货地址修改接口
////删除收货地址接口
////获取默认收货地址接口
////设置默认收货地址接口
////退款／退货订单列表接口
//
//
//
//#pragma mark - 常量
//#define kHUDTime 1.0f
//#define kAnimaTime 0.30f
//#define kLastCatchTime @"LastCatchTime"
//#define kLastCatchInfoTime @"LastCatchTime_Info"
//#define kIsNetConnect @"isNetConnect"
//#define PASSWORD @"password"//密码
//#define USERINFO @"userInfo"//用户信息
//#define ISAUTOLOGIN @"isAutoLogin"//是否自动登录的key
//
////程序主色调
//#define DominantColor [UIColor colorWithRed:28.0/255.0 green:164.0/255.0 blue:247.0/255.0 alpha:1.0]
//#define NavigationColor [UIColor colorWithRed:0/255.0 green:150.0/255.0 blue:245.0/255.0 alpha:1.0]
//#define BackGroundColor [UIColor colorWithRed:243.0/255.0 green:244.0/255.0 blue:250.0/255.0 alpha:1.0]
//#define PlaceholderColor [UIColor colorWithRed:89.0/255.0 green:190.0/255.0 blue:231.0/255.0 alpha:0.6]
//
//#define NormalFontSize 16               //普通字体大小
//#define LeftSpace 35                    //控件左边距
//#define ElementHeight 50                //控件高度
//#define ButtonHeight 40                 //按钮高度
//#define VerifyCodeTime 90               //验证码等待时间
//
//#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
//#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
//#define IS_IOS8_OR_ABOVE ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
//#define IS_IOS7_OR_ABOVE ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
//
//#pragma mark - 方法
//
//#pragma mark - 全局变量
////typedef enum _OpinionType {//指南状态
////    OpinionTypeReport   = 1,
////    OpinionTypeSuggest  = 2,
////    OpinionTypeConsult  = 3
////} OpinionType;
//
////extern double KLongitude;
////extern double KLatitude;
////extern NSString *KLocation;
//
////#define APP_URL @""
////
////#define kReportArray [NSArray arrayWithObjects:@"营销诈骗",@"淫秽色情",@"地域攻击",@"其他理由",nil]//举报类型
//
//
//#endif
