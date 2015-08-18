//
//  ZDYScrollView.h
//  CZC
//
//  Created by 周德艺 on 15/8/12.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDYScrollView : UIScrollView<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrV;
@property (strong, nonatomic) UIPageControl *pageC;
@property (strong, nonatomic) UIImageView *imgVLeft;
@property (strong, nonatomic) UIImageView *imgVCenter;
@property (strong, nonatomic) UIImageView *imgVRight;
@property (strong, nonatomic) UIButton *buttonCenter;
@property (strong, nonatomic) UILabel *lblImageDesc;
@property (strong, nonatomic) NSArray *mImageArray;
@property (assign, nonatomic) NSUInteger currentImageIndex;
@property (assign, nonatomic) NSUInteger imageCount;
@property (assign, nonatomic) BOOL isTimeUp;
//循环滚动的周期时间
@property (strong, nonatomic) NSTimer *moveTime;
//用于确定滚动式由人导致的还是计时器到了,系统帮我们滚动的,YES,则为系统滚动,NO则为客户滚动(ps.在客户端中客户滚动一个广告后,这个广告的计时器要归0并重新计时)


/**
 *  加载图片数据
 */
- (void)loadImageData:(NSArray*)imageArray;

/**
 *  添加滚动视图
 */
- (void)addScrollView;

/**
 *  添加三个图片视图到滚动视图内
 */
- (void)addImageViewsToScrollView;

/**
 *  添加分页控件
 */
- (void)addPageControl;

/**
 *  添加标签；用于图片描述
 */
- (void)addLabel;

/**
 *  根据当前图片索引设置信息
 *
 *  @param currentImageIndex 当前图片索引；即中间
 */
- (void)setInfoByCurrentImageIndex:(NSUInteger)currentImageIndex;

/**
 *  设置默认信息
 */
- (void)setDefaultInfo;

/**
 *  重新加载图片
 */
- (void)reloadImage;
/**
 *	刷新大小
 */
- (void)reloadSize;

@end
