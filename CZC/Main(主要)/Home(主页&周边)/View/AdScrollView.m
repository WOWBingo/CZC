//
//  AdScrollView.m
//  CZC
//
//  Created by 周德艺 on 15/7/6.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "AdScrollView.h"

#define UISCREENWIDTH  self.bounds.size.width//广告的宽度
#define UISCREENHEIGHT  self.bounds.size.height//广告的高度

#define HIGHT self.bounds.origin.y //由于_pageControl是添加进父视图的,所以实际位置要参考,滚动视图的y坐标

static CGFloat const chageImageTime = 4.0;
static NSUInteger currentImage = 1;//记录中间图片的下标,开始总是为1

@interface AdScrollView ()

{
    //广告的label
    UILabel * _adLabel;
    //循环滚动的三个视图
//    UIBtn * _leftBtn;
//    UIBtn * _centerBtn;
//    UIBtn * _rightBtn;
    UIButton *_leftBtn;
    UIButton *_centerBtn;
    UIButton *_rightBtn;
    
    //循环滚动的周期时间
    NSTimer * _moveTime;
    //用于确定滚动式由人导致的还是计时器到了,系统帮我们滚动的,YES,则为系统滚动,NO则为客户滚动(ps.在客户端中客户滚动一个广告后,这个广告的计时器要归0并重新计时)
    BOOL _isTimeUp;
    //为每一个图片添加一个广告语(可选)
    UILabel * _leftAdLabel;
    UILabel * _centerAdLabel;
    UILabel * _rightAdLabel;
}

@property (retain,nonatomic,readonly) UIButton *leftBtn;;
@property (retain,nonatomic,readonly) UIButton *centerBtn;;
@property (retain,nonatomic,readonly) UIButton *rightBtn;

@end

@implementation AdScrollView

#pragma mark - 自由指定广告所占的frame
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.bounces = NO;
        
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.pagingEnabled = YES;
        self.contentOffset = CGPointMake(UISCREENWIDTH, 0);
        self.contentSize = CGSizeMake(UISCREENWIDTH * 3, UISCREENHEIGHT);
        self.delegate = self;
        
        _leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, UISCREENWIDTH, UISCREENHEIGHT)];
        [self addSubview:_leftBtn];
        _centerBtn = [[UIButton alloc]initWithFrame:CGRectMake(UISCREENWIDTH, 0, UISCREENWIDTH, UISCREENHEIGHT)];
        [_centerBtn addTarget:self action:@selector(clickCenter:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_centerBtn];
        _rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(UISCREENWIDTH*2, 0, UISCREENWIDTH, UISCREENHEIGHT)];
        [self addSubview:_rightBtn];
        
        _moveTime = [NSTimer scheduledTimerWithTimeInterval:chageImageTime target:self selector:@selector(animalMoveImage) userInfo:nil repeats:YES];
        _isTimeUp = NO;
        
    }
    return self;
}

#pragma mark - 设置广告所使用的图片(名字)
- (void)setImageNameArray:(NSArray *)imageNameArray
{
    _imageNameArray = imageNameArray;

    [_leftBtn setBackgroundImage:[UIImage imageNamed:_imageNameArray[0]] forState:UIControlStateNormal];
    [_centerBtn setBackgroundImage:[UIImage imageNamed:_imageNameArray[1]] forState:UIControlStateNormal];
    [_rightBtn setBackgroundImage:[UIImage imageNamed:_imageNameArray[2]] forState:UIControlStateNormal];

}

#pragma mark - 设置每个对应广告对应的广告语
- (void)setAdTitleArray:(NSArray *)adTitleArray withShowStyle:(AdTitleShowStyle)adTitleStyle
{
    _adTitleArray = adTitleArray;
    
    if(adTitleStyle == AdTitleShowStyleNone)
    {
        return;
    }

    
    _leftAdLabel = [[UILabel alloc]init];
    _centerAdLabel = [[UILabel alloc]init];
    _rightAdLabel = [[UILabel alloc]init];
    
    
    _leftAdLabel.frame = CGRectMake(10, UISCREENHEIGHT - 40, UISCREENWIDTH, 20);
    [_leftBtn addSubview:_leftAdLabel];
    _centerAdLabel.frame = CGRectMake(10, UISCREENHEIGHT - 40, UISCREENWIDTH, 20);
    [_centerBtn addSubview:_centerAdLabel];
    _rightAdLabel.frame = CGRectMake(10, UISCREENHEIGHT - 40, UISCREENWIDTH, 20);
    [_rightBtn addSubview:_rightAdLabel];
    
    if (adTitleStyle == AdTitleShowStyleLeft) {
        _leftAdLabel.textAlignment = NSTextAlignmentLeft;
        _centerAdLabel.textAlignment = NSTextAlignmentLeft;
        _rightAdLabel.textAlignment = NSTextAlignmentLeft;
    }
    else if (adTitleStyle == AdTitleShowStyleCenter)
    {
        _leftAdLabel.textAlignment = NSTextAlignmentCenter;
        _centerAdLabel.textAlignment = NSTextAlignmentCenter;
        _rightAdLabel.textAlignment = NSTextAlignmentCenter;
    }
    else
    {
        _leftAdLabel.textAlignment = NSTextAlignmentRight;
        _centerAdLabel.textAlignment = NSTextAlignmentRight;
        _rightAdLabel.textAlignment = NSTextAlignmentRight;
    }
    
    
    _leftAdLabel.text = _adTitleArray[0];
    _centerAdLabel.text = _adTitleArray[1];
    _rightAdLabel.text = _adTitleArray[2];
    
}


#pragma mark - 创建pageControl,指定其显示样式
- (void)setPageControlShowStyle:(UIPageControlShowStyle)PageControlShowStyle
{
    if (PageControlShowStyle == UIPageControlShowStyleNone) {
        return;
    }
    _pageControl = [[UIPageControl alloc]init];
    _pageControl.numberOfPages = _imageNameArray.count;
    
    if (PageControlShowStyle == UIPageControlShowStyleLeft)
    {
        _pageControl.frame = CGRectMake(10, HIGHT+UISCREENHEIGHT - 20, 20*_pageControl.numberOfPages, 20);
    }
    else if (PageControlShowStyle == UIPageControlShowStyleCenter)
    {
        _pageControl.frame = CGRectMake(0, 0, 20*_pageControl.numberOfPages, 20);
        _pageControl.center = CGPointMake(UISCREENWIDTH/2.0, HIGHT+UISCREENHEIGHT - 10);
    }
    else
    {
        _pageControl.frame = CGRectMake( UISCREENWIDTH - 20*_pageControl.numberOfPages, HIGHT+UISCREENHEIGHT - 20, 20*_pageControl.numberOfPages, 20);
    }
    _pageControl.currentPage = 0;
    
    _pageControl.enabled = NO;
    
    [self performSelector:@selector(addPageControl) withObject:nil afterDelay:0.1f];
}
//由于PageControl这个空间必须要添加在滚动视图的父视图上(添加在滚动视图上的话会随着图片滚动,而达不到效果)
- (void)addPageControl
{
    [[self superview] addSubview:_pageControl];
}

#pragma mark - 计时器到时,系统滚动图片
- (void)animalMoveImage
{
    
    [self setContentOffset:CGPointMake(UISCREENWIDTH * 2, 0) animated:YES];
    _isTimeUp = YES;
    [NSTimer scheduledTimerWithTimeInterval:0.4f target:self selector:@selector(scrollViewDidEndDecelerating:) userInfo:nil repeats:NO];
}

#pragma mark - 图片停止时,调用该函数使得滚动视图复用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (self.contentOffset.x == 0)
    {
        currentImage = (currentImage-1)%_imageNameArray.count;
        _pageControl.currentPage = (_pageControl.currentPage - 1)%_imageNameArray.count;
    }
    else if(self.contentOffset.x == UISCREENWIDTH * 2)
    {
        
       currentImage = (currentImage+1)%_imageNameArray.count;
       _pageControl.currentPage = (_pageControl.currentPage + 1)%_imageNameArray.count;
    }
    else
    {
        return;
    }
    
    [_leftBtn setBackgroundImage:[UIImage imageNamed:_imageNameArray[(currentImage-1)%_imageNameArray.count]] forState:UIControlStateNormal];
    _leftAdLabel.text = _adTitleArray[(currentImage-1)%_imageNameArray.count];
    
    [_centerBtn setBackgroundImage:[UIImage imageNamed:_imageNameArray[currentImage%_imageNameArray.count]] forState:UIControlStateNormal];
    _centerAdLabel.text = _adTitleArray[currentImage%_imageNameArray.count];
    _centerBtn.tag = currentImage%_imageNameArray.count;
        
    [_rightBtn setBackgroundImage:[UIImage imageNamed:_imageNameArray[(currentImage+1)%_imageNameArray.count]] forState:UIControlStateNormal];
    _rightAdLabel.text = _adTitleArray[(currentImage+1)%_imageNameArray.count];
    
    self.contentOffset = CGPointMake(UISCREENWIDTH, 0);
    
    //手动控制图片滚动应该取消那个三秒的计时器
    if (!_isTimeUp) {
        [_moveTime setFireDate:[NSDate dateWithTimeIntervalSinceNow:chageImageTime]];
    }
    _isTimeUp = NO;
}

- (IBAction)clickCenter:(id)sender{
    UIButton *btn = (UIButton *)sender;
    NSLog(@"点击的数据为%ld",(long)btn.tag);
    
}

@end

