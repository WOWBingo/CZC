//
//  ObjectMapping.m
//  CZC
//
//  Created by 周德艺 on 15/8/8.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ObjectMapping.h"
#import "TestObject.h"
#import "ProductsObject.h"
#import "ProductCatagoryObject.h"
#import "SpecificationObject.h"
#import "SpecificationProudctObject.h"
#import "SpecificationOfPricceObject.h"
#import "ShopObject.h"
#import "ShopCarObject.h"
#import "ShopCarProductObject.h"
#import "CommentObject.h"
#import "OrderProductObject.h"
#import "OrderObject.h"
#import "AddressObject.h"
#import "PaymentObject.h"
#import "AccoutObject.h"
#import "CollectProductObject.h"
#import "CollectShopObject.h"
#import "MessageObject.h"

@implementation ObjectMapping

static ObjectMapping *object = nil;

+(ObjectMapping*)sharePublicObject{
    if(object==nil){
        object = [[ObjectMapping alloc]init];
    }
    return object;
}

/**
 *	对数据模型进行重新编码，以匹配取到的dictionary
 */
+(void)mappingObjects{
    
    [TestObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"ID" : @"id",
                 @"desc" : @"desciption",
                 @"oldName" : @"name.oldName",
                 @"nowName" : @"name.newName",
                 @"nameChangedTime" : @"name.info",
                 };
    }];
    
    [ProductsObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"brandName" : @"BrandName",
                 @"modifyTime" : @"ModifyTime",
                 @"detail" : @"Detail",
                 @"nowName" : @"Express_fee",
                 @"nameChangedTime" : @"Wap_desc",
                 @"isShopRecommend" : @"IsShopRecommend",
                 @"productState" : @"ProductState",
                 @"isSystemHot" : @"IsSystemHot",
                 @"feeType" : @"FeeType",
                 @"saleNumber" : @"SaleNumber",
                 @"systemOrderID" : @"SystemOrderID",
                 @"feeTemplateID" : @"FeeTemplateID",
                 @"isBest" : @"IsBest",
                 @"clickCount" : @"ClickCount",
                 @"shopName" : @"ShopName",
                 @"imagesList" : @"ImagesList",
                 @"collectCount" : @"CollectCount",
                 @"keywords" : @"Keywords",
                 @"proDescription" : @"Description",
                 @"repertoryCount" : @"RepertoryCount",
                 @"feeTemplateName" : @"FeeTemplateName",
                 @"shopID" : @"ShopID",
                 @"isSystemRecommend" : @"IsSystemRecommend",
                 @"originalImage" : @"OriginalImage",
                 @"isSaled" : @"IsSaled",
                 @"productCategoryCode" : @"ProductCategoryCode",
                 @"smallImage" : @"SmallImage",
                 @"instruction" : @"Instruction",
                 @"post_fee" : @"Post_fee",
                 @"proDescription" : @"ProductSeriesCode",
                 @"unitName" : @"UnitName",
                 @"commentCount" : @"CommentCount",
                 @"isReal" : @"IsReal",
                 @"isPromotion" : @"IsPromotion",
                 @"multiImages" : @"MultiImages",
                 @"memLoginID" : @"MemLoginID",
                 @"ems_fee" : @"Ems_fee",
                 @"shopPrice" : @"ShopPrice",
                 @"substationID" : @"SubstationID",
                 @"isHot" : @"IsHot",
                 @"specificationProudct" : @"SpecificationProudct",
                 @"isNew" : @"IsNew",
                 @"isRecommend" : @"IsRecommend",
                 @"shopProRelateList" : @"ShopProRelateList",
                 @"marketPrice" : @"MarketPrice",
                 @"buyCount" : @"BuyCount",
                 @"orderID" : @"OrderID",
                 @"name" : @"Name",
                 @"isShopPromotion" : @"IsShopPromotion",
                 @"isShopHot" : @"IsShopHot",
                 @"guid" : @"Guid",
                 @"isShopGood" : @"IsShopGood",
                 @"thumbImage" : @"ThumbImage",
                 @"isShopNew" : @"IsShopNew",
                 @"productNum" : @"ProductNum",
                 @"imgList" : @"ImagesList",
                 
                 };
    }];
    /**
     *	分类对象
     */
    [ProductCatagoryObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{};
    }];
    /**
     *	产品规格
     */
    [SpecificationProudctObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"specificationList" : @"Specification",
                 @"specValueName" : @"SpecValueName",
                 };
    }];
    
    [SpecificationProudctObject setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"Specification" : @"SpecificationObject",
                 };
    }];
    
    [SpecificationObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"" : @""
                 };
    }];
    
    [SpecificationOfPricceObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"" : @"",
                 };
    }];
    /**
     *	店铺信息
     */
    [ShopObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"" : @"",
                 };
    }];
    /**
     *	评论信息
     */
    [CommentObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 };
    }];
    
    /**
     *	购物车
     */
    [ShopCarObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"shopID" : @"",
                 @"shop" : @"",
                 @"count" : @"",
                 @"price" : @"",
                 @"productList" : @"",
                 };
    }];
    [ShopCarObject setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"Data" : @"ShopCarProductObject",
                 };
    }];
    [ShopCarProductObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 };
    }];
    
    /**
     *	订单
     */
    [OrderProductObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 };
    }];
    [OrderObject setupObjectClassInArray:^NSDictionary *{
         return @{
                  @"ProductList" : @"OrderProductObject",
                  };
     }];
    
    /**
     *	收货地址
     */
    [AddressObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 };
    }];
    
    /**
     *	支付方式
     */
    [PaymentObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 };
    }];
    
    /**
     *	用户信息
     */
   [AccoutObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 };
    }];
    
    /**
     *	产品收藏列表
     */
    [CollectProductObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 };
    }];
    
    /**
     *	店铺收藏
     */
    [CollectShopObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 };
    }];
    /**
     *	消息列表
     */
    [MessageObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 @"" : @"",
                 };
    }];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


@end
