//
//  ProductsObject.h
//  CZC
//
//  Created by 周德艺 on 15/8/7.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

/**
 *	平台首页新品，推荐，热卖，精品
 */

#import <Foundation/Foundation.h>

@interface ProductsObject : NSObject

@property (nonatomic, copy) NSString *brandName;
@property (nonatomic, copy) NSString *modifyTime;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, assign) NSInteger express_fee;
@property (nonatomic, copy) NSString *wap_desc;
@property (nonatomic, assign) NSInteger isShopRecommend;
@property (nonatomic, assign) NSInteger productState;
@property (nonatomic, assign) NSInteger isSystemHot;
@property (nonatomic, assign) NSInteger feeType;
@property (nonatomic, assign) NSInteger saleNumber;
@property (nonatomic, assign) NSInteger systemOrderID;
@property (nonatomic, copy) NSString *feeTemplateID;

@property (nonatomic, assign) NSInteger isBest;

@property (nonatomic, assign) NSInteger clickCount;

@property (nonatomic, copy) NSString *shopName;

@property (nonatomic, copy) NSString *imagesList;

@property (nonatomic, assign) NSInteger collectCount;

@property (nonatomic, copy) NSString *keywords;

@property (nonatomic, copy) NSString *proDescription;

@property (nonatomic, assign) NSInteger repertoryCount;

@property (nonatomic, copy) NSString *feeTemplateName;

@property (nonatomic, copy) NSString *shopID;

@property (nonatomic, assign) NSInteger isSystemRecommend;

@property (nonatomic, copy) NSString *originalImage;/**< 图片路径 */

@property (nonatomic, assign) NSInteger isSaled;

@property (nonatomic, copy) NSString *productCategoryCode;

@property (nonatomic, copy) NSString *smallImage;

@property (nonatomic, copy) NSString *instruction;

@property (nonatomic, assign) NSInteger post_fee;

@property (nonatomic, copy) NSString *productSeriesCode;

@property (nonatomic, copy) NSString *unitName;

@property (nonatomic, assign) NSInteger commentCount;

@property (nonatomic, assign) NSInteger isReal;

@property (nonatomic, assign) NSInteger isPromotion;

@property (nonatomic, copy) NSString *multiImages;

@property (nonatomic, copy) NSString *memLoginID;

@property (nonatomic, assign) NSInteger ems_fee;

@property (nonatomic, assign) CGFloat shopPrice;/**< 店铺价格 */

@property (nonatomic, copy) NSString *substationID;

@property (nonatomic, assign) NSInteger isHot;

@property (nonatomic, copy) NSString *specificationProudct;

@property (nonatomic, assign) NSInteger isNew;

@property (nonatomic, assign) NSInteger isRecommend;

@property (nonatomic, copy) NSString *shopProRelateList;

@property (nonatomic, assign) CGFloat marketPrice;/**< 市场价格 */

@property (nonatomic, assign) NSInteger buyCount;

@property (nonatomic, assign) NSInteger orderID;

@property (nonatomic, copy) NSString *name;/**< 名称 */

@property (nonatomic, assign) NSInteger isShopPromotion;

@property (nonatomic, assign) NSInteger isShopHot;

@property (nonatomic, copy) NSString *guid;

@property (nonatomic, assign) NSInteger isShopGood;

@property (nonatomic, copy) NSString *thumbImage;

@property (nonatomic, assign) NSInteger isShopNew;

@property (nonatomic, copy) NSString *productNum;
/**
 *图片列表 
 */
@property (nonatomic, strong)NSMutableArray *imgList;/** <图片列表 */

@end
