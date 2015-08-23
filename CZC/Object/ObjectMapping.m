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
#import "SpecificationAllObject.h"
#import "SpecificationOfPriceObject.h"
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
#import "HomeImageObject.h"

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
                 @"express_fee" : @"Express_fee",
                 @"wap_desc" : @"Wap_desc",
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
    
    [ProductsObject setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"ImagesList" : @"NSString",
                 };
    }];
    
    /**
     *	分类对象
     */
    [ProductCatagoryObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"orderID" : @"OrderID",
                 @"catagoryDescription" : @"Description",
                 @"code" : @"Code",
                 @"isLastLevel" : @"IsLastLevel",
                 @"categoryLevel" : @"CategoryLevel",
                 @"fatherID" : @"FatherID",
                 @"name" : @"Name",
                 @"keywords" : @"Keywords",
                 @"catagoryID" : @"ID",
                 @"memLoginID" : @"MemLoginID",
                 @"shopID" : @"ShopID",
                 };
    }];
    /**
     *	产品规格
     */
    [SpecificationAllObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"specificationList" : @"Specification",
                 @"specValueName" : @"SpecValueName",
                 };
    }];
    
    [SpecificationAllObject setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"Specification" : @"SpecificationObject",
                 };
    }];
    
    [SpecificationObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"specValueName" : @"SpecValueName",
                 @"specName" : @"SpecName",
                 @"specid" : @"Specid",
                 @"guid" : @"Guid",
                 @"specValueid" : @"SpecValueid",
                 @"detail" : @"Detail",
                 };
    }];
    
    [SpecificationOfPriceObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"specTotalId" : @"SpecTotalId",
                 @"tbProp" : @"TbProp",
                 @"specDetail" : @"SpecDetail",
                 @"shopID" : @"ShopID",
                 @"productGuid" : @"ProductGuid",
                 @"goodsStock" : @"GoodsStock",
                 @"salesCount" : @"SalesCount",
                 @"goodsNumber" : @"GoodsNumber",
                 @"goodsPrice" : @"GoodsPrice",
                 @"goodColor" : @"GoodColor",
                 };
    }];
    /**
     *	店铺信息
     */
    [ShopObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"addressValue" : @"AddressValue",
                 @"shopUrl" : @"ShopUrl",
                 @"tel" : @"Tel",
                 @"attitudeBL" : @"AttitudeBL",
                 @"name" : @"Name",
                 @"shopID" : @"ShopID",
                 @"memLoginID" : @"MemLoginID",
                 @"address" : @"Address",
                 @"clickCount" : @"ClickCount",
                 @"shopReputation" : @"ShopReputation",
                 @"haoPingLV" : @"HaoPingLV",
                 @"salesRange" : @"SalesRange",
                 @"banner" : @"Banner",
                 @"characterBL" : @"CharacterBL",
                 @"email" : @"Email",
                 @"mainGoods" : @"MainGoods",
                 @"phone" : @"Phone",
                 @"collectCount" : @"CollectCount",
                 @"pic" : @"Pic",
                 @"shopName" : @"ShopName",
                 @"companyIntroduce" : @"CompanyIntroduce",
                 @"shopCharacter" : @"ShopCharacter",
                 @"speedBL" : @"SpeedBL",
                 @"applyTime" : @"ApplyTime",
                 @"shopAttitude" : @"ShopAttitude",
                 @"shopSpeed" : @"ShopSpeed",
                 @"guid" : @"Guid",
                 @"addressCode" : @"AddressCode",
                 };
    }];
    /**
     *	评论信息
     */
    [CommentObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"commentType" : @"CommentType",
                 @"commentTime" : @"CommentTime",
                 @"reply" : @"Reply",
                 @"continueComment" : @"ContinueComment",
                 @"continueState" : @"ContinueState",
                 @"continueReply" : @"ContinueReply",
                 @"speed" : @"Speed",
                 @"shopID" : @"ShopID",
                 @"comment" : @"Comment",
                 @"specValue" : @"SpecValue",
                 @"memLoginID" : @"MemLoginID",
                 @"continueTime" : @"ContinueTime",
                 @"continueReplyTime" : @"ContinueReplyTime",
                 @"productPrice" : @"ProductPrice",
                 @"buyerAttitude" : @"BuyerAttitude",
                 @"productName" : @"ProductName",
                 @"attitude" : @"Attitude",
                 @"character" : @"Character",
                 @"shopName" : @"ShopName",
                 @"orderGuid" : @"OrderGuid",
                 @"replyTime" : @"ReplyTime",
                 @"shopLoginId" : @"ShopLoginId",
                 @"productGuid" : @"ProductGuid",
                 @"isAudit" : @"IsAudit",
                 @"guid" : @"Guid",
                 @"isNick" : @"IsNick",
                 };
    }];
    
    /**
     *	购物车
     */
    [ShopCarObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"shopID" : @"ShopID",
                 @"shop" : @"Shop",
                 @"count" : @"Count",
                 @"price" : @"Price",
                 @"productList" : @"Data",
                 };
    }];
    [ShopCarObject setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"Data" : @"ShopCarProductObject",
                 };
    }];
    [ShopCarProductObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"guid" : @"Guid",
                 @"extensionAttriutes" : @"ExtensionAttriutes",
                 @"shopID" : @"ShopID",
                 @"repertoryCount" : @"RepertoryCount",
                 @"name" : @"Name",
                 @"originalImge" : @"OriginalImge",
                 @"specificationValue" : @"SpecificationValue",
                 @"buyNumber" : @"BuyNumber",
                 @"marketPrice" : @"MarketPrice",
                 @"isPresent" : @"IsPresent",
                 @"buyPrice" : @"BuyPrice",
                 @"createTime" : @"CreateTime",
                 @"shopName" : @"ShopName",
                 @"repertoryNumber" : @"RepertoryNumber",
                 @"productGuid" : @"ProductGuid",
                 @"memLoginID" : @"MemLoginID",
                 @"attributes" : @"Attributes",
                 @"isJoinActivity" : @"IsJoinActivity",
                 @"specificationName" : @"SpecificationName",
                 };
    }];
    
    /**
     *	订单
     */
    [OrderProductObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"guid" : @"Guid",
                 @"extensionAttriutes" : @"ExtensionAttriutes",
                 @"shopID" : @"ShopID",
                 @"specificationValue" : @"SpecificationValue",
                 @"productName" : @"ProductName",
                 @"buyNumber" : @"BuyNumber",
                 @"productImg" : @"ProductImg",
                 @"shopPrice" : @"ShopPrice",
                 @"buyPrice" : @"BuyPrice",
                 @"isShipment" : @"IsShipment",
                 @"specificationName" : @"SpecificationName",
                 @"attributes" : @"Attributes",
                 @"productGuid" : @"ProductGuid",
                 @"orderInfoGuid" : @"OrderInfoGuid",
                 @"memLoginID" : @"MemLoginID",
                 };
    }];
    [OrderObject setupObjectClassInArray:^NSDictionary *{
         return @{
                  @"ProductList" : @"OrderProductObject",
                  };
     }];
    [OrderObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"outOfStockOperate" : @"OutOfStockOperate",
                 @"oderStatus" : @"OderStatus",
                 @"shouldPayPrice" : @"ShouldPayPrice",
                 @"refundStatus" : @"RefundStatus",
                 @"email" : @"Email",
                 @"mobile" : @"Mobile",
                 @"isBuyComment" : @"IsBuyComment",
                 @"joinActiveType" : @"JoinActiveType",
                 @"payment" : @"Payment",
                 @"tradeID" : @"TradeID",
                 @"confirmTime" : @"ConfirmTime",
                 @"usedFavourTicket" : @"UsedFavourTicket",
                 @"shopName" : @"ShopName",
                 @"alreadPayPrice" : @"AlreadPayPrice",
                 @"useScore" : @"UseScore",
                 @"postType" : @"PostType",
                 @"scorePrice" : @"ScorePrice",
                 @"regionCode" : @"RegionCode",
                 @"paymentStatus" : @"PaymentStatus",
                 @"shopID" : @"ShopID",
                 @"payMemo" : @"PayMemo",
                 @"invoiceType" : @"InvoiceType",
                 @"activityGuid" : @"ActivityGuid",
                 @"discount" : @"Discount",
                 @"shopPhone" : @"shopPhone",
                 @"invoiceTax" : @"InvoiceTax",
                 @"tel" : @"Tel",
                 @"shipmentNumber" : @"ShipmentNumber",
                 @"blessCardPrice" : @"BlessCardPrice",
                 @"clientToSellerMsg" : @"ClientToSellerMsg",
                 @"createTime" : @"CreateTime",
                 @"shipmentStatus" : @"ShipmentStatus",
                 @"paymentPrice" : @"PaymentPrice",
                 @"isSellComment" : @"IsSellComment",
                 @"dispatchType" : @"DispatchType",
                 @"memLoginID" : @"MemLoginID",
                 @"substationID" : @"SubstationID",
                 @"packGuid" : @"PackGuid",
                 @"blessCardGuid" : @"BlessCardGuid",
                 @"invoiceTitle" : @"InvoiceTitle",
                 @"invoiceContent" : @"InvoiceContent",
                 @"packPrice" : @"PackPrice",
                 @"payTime" : @"PayTime",
                 @"dispatchTime" : @"DispatchTime",
                 @"postalcode" : @"Postalcode",
                 @"deposit" : @"Deposit",
                 @"dispatchPrice" : @"DispatchPrice",
                 @"paymentName" : @"PaymentName",
                 @"actvieContent" : @"ActvieContent",
                 @"logisticsCompanyCode" : @"LogisticsCompanyCode",
                 @"name" : @"Name",
                 @"paymentGuid" : @"PaymentGuid",
                 @"productPrice" : @"ProductPrice",
                 @"shopID2" : @"ShopID2",
                 @"shopTel" : @"ShopTel",
                 @"guid" : @"Guid",
                 @"orderNumber" : @"OrderNumber",
                 @"address" : @"Address",
                 @"surplusPrice" : @"SurplusPrice",
                 @"productList" : @"ProductList",
                 };
    }];
    /**
     *	收货地址
     */
    [AddressObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"guid" : @"Guid",
                 @"mobile" : @"Mobile",
                 @"modifyTime" : @"ModifyTime",
                 @"email" : @"Email",
                 @"postalcode" : @"Postalcode",
                 @"tel" : @"Tel",
                 @"name" : @"NAME",
                 @"createUser" : @"CreateUser",
                 @"addressCode" : @"AddressCode",
                 @"address" : @"Address",
                 @"isDefault" : @"IsDefault",
                 @"createTime" : @"CreateTime",
                 @"memLoginID" : @"MemLoginID",
                 @"modifyUser" : @"ModifyUser",
                 };
    }];
    
    /**
     *	支付方式
     */
    [PaymentObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"guid" : @"Guid",
                 @"isCOD" : @"IsCOD",
                 @"charge" : @"Charge",
                 @"email" : @"Email",
                 @"isPercent" : @"IsPercent",
                 @"orderID" : @"OrderID",
                 @"payType" : @"payType",
                 @"paymentType" : @"PaymentType",
                 @"secondKey" : @"SecondKey",
                 @"name" : @"NAME",
                 @"merchantCode" : @"MerchantCode",
                 @"public_Key" : @"Public_Key",
                 @"forAdvancePayment" : @"ForAdvancePayment",
                 @"private_Key" : @"Private_Key",
                 };
    }];
    
    /**
     *	用户信息
     */
   [AccoutObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"guid" : @"Guid",
                 @"url" : @"Url",
                 @"QQ" : @"QQ",
                 @"payPwd" : @"PayPwd",
                 @"email" : @"Email",
                 @"score" : @"Score",
                 @"memberRank" : @"MemberRank",
                 @"name" : @"Name",
                 @"mobile" : @"Mobile",
                 @"pwd" : @"Pwd",
                 @"advancePayment" : @"AdvancePayment",
                 @"memLoginID" : @"MemLoginID",
                 @"rememberMe" : @"RememberMe",
                 @"realName" : @"RealName",
                 };
    }];
    
    /**
     *	产品收藏列表
     */
    [CollectProductObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"smallImage" : @"SmallImage",
                 @"shopName" : @"ShopName",
                 @"sellLoginID" : @"SellLoginID",
                 @"collectTime" : @"CollectTime",
                 @"productGuid" : @"ProductGuid",
                 @"memLoginID" : @"MemLoginID",
                 @"shopPrice" : @"ShopPrice",
                 @"guid" : @"Guid",
                 @"name" : @"Name",
                 };
    }];
    
    /**
     *	店铺收藏
     */
    [CollectShopObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"shopID" : @"ShopID",
                 @"shopName" : @"ShopName",
                 @"banner" : @"Banner",
                 @"collectTime" : @"CollectTime",
                 @"memLoginID" : @"MemLoginID",
                 @"memLoginID2" : @"MemLoginID2",
                 @"guid" : @"Guid",
                 @"collectCount" : @"CollectCount",
                 };
    }];
    /**
     *	消息列表
     */
    [MessageObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"sendTime" : @"SendTime",
                 @"isRead" : @"IsRead",
                 @"memLoginID" : @"MemLoginID",
                 @"type" : @"Type",
                 @"guid" : @"Guid",
                 @"title" : @"Title",
                 @"content" : @"Content",
                 @"isDeleted" : @"IsDeleted",
                 };
    }];
    
    /**
     *	首页图片
     */
    [HomeImageObject setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"homeImageID" : @"ID",
                 @"url" : @"Url",
                 @"value" : @"Value",
                 @"configType" : @"ConfigType",
                 @"shopID" : @"ShopID",
                 };
    }];
    
    
    
    
    
}


@end
