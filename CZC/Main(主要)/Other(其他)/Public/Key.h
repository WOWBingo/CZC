//
//  Key.h
//  CZC
//
//  Created by 周德艺 on 15/8/11.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AccoutObject.h"

#pragma mark - 网络

/** 全局用户对象 */
UIKIT_EXTERN AccoutObject *kAccountObject;

/** 连接失败，请检查网络连接 */
UIKIT_EXTERN NSString *const kConnectionFailureError;
/** 请求超时，请检查连接网络 */
UIKIT_EXTERN NSString *const kRequestTimedOutError;
/** 认证失败，请检查网络连接 */
UIKIT_EXTERN NSString *const kAuthenticationError;

/** 接口地址 */
UIKIT_EXTERN NSString *const kPublic_URL;
UIKIT_EXTERN NSString *const kImage_URL;

/**1.平台首页新品，推荐，热卖，精品 */
UIKIT_EXTERN NSString *const kHomeNewAdMore_URL;

/**2.产品搜索 */
UIKIT_EXTERN NSString *const kProductSearch_URL;

/**3.店铺搜索和店铺列表 */
UIKIT_EXTERN NSString *const kShops_URL;

/**4.平台产品类别 */
UIKIT_EXTERN NSString *const kProductCatagory_URL;

/**5.平台产品列表 */
UIKIT_EXTERN NSString *const kProductList_URL;

/**6.产品详细   */
UIKIT_EXTERN NSString *const kProductInfo_URL;

/**7.产品规格  */
UIKIT_EXTERN NSString *const kProSpecificationList_URL;

/**8.规格查询价格 */
UIKIT_EXTERN NSString *const kPriceBySpecification_URL;

/**9.店铺详细信息  */
UIKIT_EXTERN NSString *const kShopsInfo_URL;

/**10.店铺评价  */
UIKIT_EXTERN NSString *const kProductComment3_URL;

/**11. 购物车列表 111111*/
UIKIT_EXTERN NSString *const kShoppingCartList_URL;

/** 12.添加购物车(1) */
UIKIT_EXTERN NSString *const kShoppingCartAdd_URL;

/** (2) 直接购买时使用 */
UIKIT_EXTERN NSString *const kBuyNow_URL;

/** 13删除购物车产品 */
UIKIT_EXTERN NSString *const kShoppingCartDelete_URL;

/** 14.订单列表  */
UIKIT_EXTERN NSString *const kOrderNumber_URL;

/** 15.订单详情  */
UIKIT_EXTERN NSString *const kOrderInfo_URL;

/** 16.提交订单 */
UIKIT_EXTERN NSString *const kOrderAdd_URL;

/** 17.取消订单  */
UIKIT_EXTERN NSString *const kOrderDelete_URL;

/** 18.收货地址列表 */
UIKIT_EXTERN NSString *const kAddressList_URL;

/** 19.支付方式列表   */
UIKIT_EXTERN NSString *const kPayMentList_URL;

/** 20.用户信息 */
UIKIT_EXTERN NSString *const kAccountInfo_URL;

/** 21.判断用户是否存在   */
UIKIT_EXTERN NSString *const kAccountIsHave_URL;

/** 22.用户注册   */
UIKIT_EXTERN NSString *const kAccountRegist_URL;

/** 23.产品收藏列表   */
UIKIT_EXTERN NSString *const kProCollectList_URL;

/** 24.产品收藏删除  */
UIKIT_EXTERN NSString *const kProCollectDelete_URL;

/** 25.店铺收藏列表  */
UIKIT_EXTERN NSString *const kShopCollectList_URL;

/** 26.店铺收藏删除  */
UIKIT_EXTERN NSString *const kShopCollectDelete_URL;

/** 27.商品信誉评价   */
UIKIT_EXTERN NSString *const kProductComment_URL;

/** 28.店铺信誉评价   */
UIKIT_EXTERN NSString *const kShopComment_URL;

/** 29.会员消息列表  */
UIKIT_EXTERN NSString *const kMemberMessage_URL;

/** 30.删除会员消息  */
UIKIT_EXTERN NSString *const kMemberMessageDelete_URL;

/** 31.店铺新品，推荐，热门，精品    */
UIKIT_EXTERN NSString *const kProNewAdMoreURL;

/** 32.店铺产品列表+搜索  */
UIKIT_EXTERN NSString *const kShopProList_URL;

/** 33.确定收货  */
UIKIT_EXTERN NSString *const kShipmentStatusUpdate_URL;

/** 34.物流单号跟踪   */
UIKIT_EXTERN NSString *const kkuaidi100_URL;

/** 35.查询库存量   */
UIKIT_EXTERN NSString *const kProductRepertoryCount_URL;

/** 36.店铺类别 一级类别   */
//UIKIT_EXTERN NSString *const kProductCatagory_URL = @"api/productcatagory/"

/** 37.退货  */
UIKIT_EXTERN NSString *const kOrderReturnofgoods_URL;

/** 38.添加收货地址   */
UIKIT_EXTERN NSString *const kAddressAdd_URL;

/** 39.省、市、区   */
UIKIT_EXTERN NSString *const kRegion_URL;

/** 40.产品收藏   */
UIKIT_EXTERN NSString *const kProCollect_URL;

/** 41.登陆   */
UIKIT_EXTERN NSString *const kAccountLogin_URL;

/** 42.广告图片   */
UIKIT_EXTERN NSString *const kShopGGlist_URL;

/** 43.添加收藏店铺   */
UIKIT_EXTERN NSString *const kShopCollectAdd_URL;

/** 44.买家商品评价   */
UIKIT_EXTERN NSString *const kProductCommentAdd_URL;

/** 45.商品回评  */
UIKIT_EXTERN NSString *const kProductCommentLastAdd_URL;

/** 46.修改用户信息、密码修改   */
UIKIT_EXTERN NSString *const kAccountInfoUpdate_URL;

/** 47.预存款支付   */
UIKIT_EXTERN NSString *const kBuyAdvancePayment_URL;

/** 48.删除收货地址默认收货地   */
UIKIT_EXTERN NSString *const kAddressDefaultDel_URL;

/** 49.生成订单号   */
UIKIT_EXTERN NSString *const kGetOrder_URL;

/** 50.密码修改   */
UIKIT_EXTERN NSString *const kAccountUpdate_URL;

/** 51.手机网页支付（支付宝）  */
UIKIT_EXTERN NSString *const kAlipay_URL;

/** 52 修改站内信息已读状态   */
UIKIT_EXTERN NSString *const kMemberMessageIsReaded_URL;

/** 53 退货(退款)申请 */
UIKIT_EXTERN NSString *const kReturnofgoods_URL;

/** 54.邮费计算 */
UIKIT_EXTERN NSString *const kAppShopfeetemplate_URL;

/** 55.APP欢迎图  */
UIKIT_EXTERN NSString *const kWelcome_URL;

/** 56.手机网页支付（支付宝，多订单支付）  */
UIKIT_EXTERN NSString *const kAlipayMore_URL;

/** 57. 获取所有城市名称及地址  */
UIKIT_EXTERN NSString *const kCityAllInfo_URL;

/** 58.其他会员发给当前消息列表  */
UIKIT_EXTERN NSString *const kMemberNowMessageList_URL;

/** 59. 城市多用户首页轮播图片 */
UIKIT_EXTERN NSString *const kShopGGlistIndex_URL;

/** 60. 手机验证码 */
UIKIT_EXTERN NSString *const kMobileVerifyCode_URL;

#pragma mark - 常量
UIKIT_EXTERN CGFloat const kHUDTime;
UIKIT_EXTERN CGFloat const kAnimaTime;
UIKIT_EXTERN NSString *const kLastCatchTime;
UIKIT_EXTERN NSString *const kLastCatchInfoTime;
UIKIT_EXTERN NSString *const kIsNetConnect;
UIKIT_EXTERN NSString *const PASSWORD;//密码
UIKIT_EXTERN NSString *const USERINFO;//用户信息
UIKIT_EXTERN NSString *const ISAUTOLOGIN;//是否自动登录的key

#pragma mark - 排序
/** 时间 */
UIKIT_EXTERN NSString *const kSortsProModifyTime;
/** 价格 */
UIKIT_EXTERN NSString *const kSortsProPrice;
/** 销售量 */
UIKIT_EXTERN NSString *const kSortsProSaleNumber;
/** 升序 */
UIKIT_EXTERN NSString *const kSortsisASCTrue;
/** 降序 */
UIKIT_EXTERN NSString *const kSortsisASCFalse;


#pragma mark - 定义宏

#define CZCService [CZCAPIService shareService]
//程序主色调
#define RGB(Red,Green,Blue,Alpha) [UIColor colorWithRed:Red/255.0 green:Green/255.0 blue:Blue/255.0 alpha:Alpha]
#define DominantColor [UIColor colorWithRed:28.0/255.0 green:164.0/255.0 blue:247.0/255.0 alpha:1.0]
#define NavigationColor [UIColor colorWithRed:0/255.0 green:150.0/255.0 blue:245.0/255.0 alpha:1.0]
#define BackGroundColor [UIColor colorWithRed:243.0/255.0 green:244.0/255.0 blue:250.0/255.0 alpha:1.0]
#define PlaceholderColor [UIColor colorWithRed:89.0/255.0 green:190.0/255.0 blue:231.0/255.0 alpha:0.6]

#define ButtonBackGround [UIColor colorWithRed:0.0/255.0 green:160.0/255.0 blue:253.0/255.0 alpha:1]
#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define IS_IOS8_OR_ABOVE ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IS_IOS7_OR_ABOVE ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

#define DefaultImage [UIImage imageNamed:@"tabbar"]


#define NormalFontSize 16               //普通字体大小
#define LeftSpace 35                    //控件左边距
#define ElementHeight 50                //控件高度
#define ButtonHeight 40                 //按钮高度
#define VerifyCodeTime 90               //验证码等待时间


//tabbar最近一次选择的Index
UIKIT_EXTERN NSUInteger kLastSelectedIndex;

UIKIT_EXTERN NSString *const kAccoutInfo_Default;



@interface Key : NSObject

@end
