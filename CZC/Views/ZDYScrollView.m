//
//  ZDYScrollView.m
//  CZC
//
//  Created by 周德艺 on 15/8/12.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ZDYScrollView.h"
#import "HomeImageObject.h"
#import "SDWebImageManager.h"

#define kImageViewCount 3
static CGFloat const chageImageTime = 4.0;

@implementation ZDYScrollView


#pragma mark - 自由指定广告所占的frame
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _moveTime = [NSTimer scheduledTimerWithTimeInterval:chageImageTime target:self selector:@selector(animalMoveImage) userInfo:nil repeats:YES];
        _isTimeUp = NO;
    }
    return self;
}


- (void)loadImageData:(NSArray*)imageArray {
    _mImageArray = imageArray;
    _imageCount = _mImageArray.count;
    [self addScrollView];
    [self addImageViewsToScrollView];
    [self addPageControl];
    [self addLabel];
    [self setDefaultInfo];
}

- (void)addScrollView {
    _scrV = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _scrV.contentSize = CGSizeMake(self.frame.size.width * kImageViewCount, self.frame.size.height);
    _scrV.contentOffset = CGPointMake(self.frame.size.width , 0.0);
    _scrV.pagingEnabled = YES;
    _scrV.showsHorizontalScrollIndicator = NO;
    _scrV.delegate = self;
    [self addSubview:_scrV];
}

- (void)addImageViewsToScrollView {
    //图片视图；左边
    _buttonLeft = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, self.frame.size.width , self.frame.size.height)];
    _buttonLeft.contentMode = UIViewContentModeScaleAspectFit;
    [_scrV addSubview:_buttonLeft];
    
    //图片视图；中间
    _buttonCenter = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width , 0.0, self.frame.size.width , self.frame.size.height)];
    _buttonCenter.contentMode = UIViewContentModeScaleAspectFit;
    [_buttonCenter addTarget:self action:@selector(clickCenterBtn) forControlEvents:UIControlEventTouchUpInside];
    [_scrV addSubview:_buttonCenter];
    
    //图片视图；右边
    _buttonRight = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width  * 2.0, 0.0, self.frame.size.width , self.frame.size.height)];
    _buttonRight.contentMode = UIViewContentModeScaleAspectFit;
    [_scrV addSubview:_buttonRight];
}

- (void)addPageControl {
    _pageC = [UIPageControl new];
    CGSize size= [_pageC sizeForNumberOfPages:_imageCount]; //根据页数返回 UIPageControl 合适的大小
    _pageC.bounds = CGRectMake(0.0, 0.0, size.width, size.height);
    _pageC.center = CGPointMake(self.frame.size.width  / 2.0, self.frame.size.height - 10.0);
    _pageC.numberOfPages = _imageCount;
    _pageC.pageIndicatorTintColor = [UIColor whiteColor];
    _pageC.currentPageIndicatorTintColor = [UIColor brownColor];
    _pageC.userInteractionEnabled = NO; //设置是否允许用户交互；默认值为 YES，当为 YES 时，针对点击控件区域左（当前页索引减一，最小为0）右（当前页索引加一，最大为总数减一），可以编写 UIControlEventValueChanged 的事件处理方法
    [self addSubview:_pageC];
}

- (void)addLabel {
    _lblImageDesc = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 40.0, self.frame.size.width , 40.0)];
    _lblImageDesc.textAlignment = NSTextAlignmentCenter;
    _lblImageDesc.textColor = [UIColor whiteColor];
    _lblImageDesc.font = [UIFont boldSystemFontOfSize:[UIFont labelFontSize]];
    _lblImageDesc.text = @"Fucking now.";
    [self addSubview:_lblImageDesc];
}

- (void)setInfoByCurrentImageIndex:(NSUInteger)currentImageIndex {
    
    HomeImageObject *object = [_mImageArray objectAtIndex:currentImageIndex];
    HomeImageObject *leftObject = [_mImageArray objectAtIndex:((_currentImageIndex - 1 + _imageCount) % _imageCount)];
    HomeImageObject *rightObject = [_mImageArray objectAtIndex:((_currentImageIndex + 1) % _imageCount)];
    
    //NSString *currentImageNamed = [NSString stringWithFormat:@"%lu.png", (unsigned long)currentImageIndex];
    
    [_buttonCenter sd_setBackgroundImageWithURL:[NSURL URLWithString:object.value] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"cpxx-p1"]];
     // sd_setImageWithURL:[NSURL URLWithString:object.value] placeholderImage:[UIImage imageNamed:@"cpxx-p1"]];
    
    [_buttonLeft sd_setBackgroundImageWithURL:[NSURL URLWithString:leftObject.value] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"cpxx-p1"]];
    // = [UIImage imageNamed:[NSString stringWithFormat:@"%lu.png", (unsigned long)((_currentImageIndex - 1 + _imageCount) % _imageCount)]];
    
    [_buttonRight sd_setBackgroundImageWithURL:[NSURL URLWithString:rightObject.value] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"cpxx-p1"]];
    //.image = [UIImage imageNamed:[NSString stringWithFormat:@"%lu.png", (unsigned long)((_currentImageIndex + 1) % _imageCount)]];
    
    _pageC.currentPage = currentImageIndex;
    _lblImageDesc.text = [NSString stringWithFormat:@"%ld",(long)object.homeImageID];
}

- (void)setDefaultInfo {
    _currentImageIndex = 0;
    [self setInfoByCurrentImageIndex:_currentImageIndex];
}

- (void)reloadImage {
    if (_imageCount == 0) {
        return;
    }
    CGPoint contentOffset = [_scrV contentOffset];
    if (_isTimeUp) {
        _currentImageIndex = (_currentImageIndex + 1) % _imageCount;
    }else{
        if (contentOffset.x > self.frame.size.width ) { //向左滑动
            _currentImageIndex = (_currentImageIndex + 1) % _imageCount;
        } else if (contentOffset.x < self.frame.size.width ) { //向右滑动
            _currentImageIndex = (_currentImageIndex - 1 + _imageCount) % _imageCount;
        }
    }
    [self setInfoByCurrentImageIndex:_currentImageIndex];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self reloadImage];
    
    _scrV.contentOffset = CGPointMake(self.frame.size.width , 0.0);
    _pageC.currentPage = _currentImageIndex;
    
    //NSString *currentImageNamed = [NSString stringWithFormat:@"%lu.png", (unsigned long)_currentImageIndex];
    HomeImageObject *object = [_mImageArray objectAtIndex:_currentImageIndex];
    _lblImageDesc.text = [NSString stringWithFormat:@"%ld",(long)object.homeImageID];
    
    //手动控制图片滚动应该取消那个三秒的计时器
    if (!_isTimeUp) {
        [_moveTime setFireDate:[NSDate dateWithTimeIntervalSinceNow:chageImageTime]];
    }
    _isTimeUp = NO;
}

#pragma mark - 计时器到时,系统滚动图片
- (void)animalMoveImage
{
    [self.scrV setContentOffset:CGPointMake(self.frame.size.width * 2, 0) animated:YES];
    _isTimeUp = YES;
    [NSTimer scheduledTimerWithTimeInterval:0.4f target:self selector:@selector(scrollViewDidEndDecelerating:) userInfo:nil repeats:NO];
}

- (void)clickCenterBtn{
    HomeImageObject *object = [_mImageArray objectAtIndex:_currentImageIndex];
    NSLog(@"点击的按钮为------%ld",(long)object.homeImageID);
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
