//
//  PopoverView.m
//  ArrowView
//
//  Created by guojiang on 4/9/14.
//  Copyright (c) 2014年 LINAICAI. All rights reserved.
//


#import "PopoverView.h"

#define kArrowHeight 0.f
#define kArrowCurvature 0.f
#define SPACE 2.f
#define ROW_HEIGHT 30.f
#define TITLE_FONT [UIFont systemFontOfSize:14]
#define RGB(r, g, b)    [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:1.f]

@interface PopoverView ()

@property (nonatomic, strong) UIView *backgroudView;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic) CGPoint showPoint;

@property (nonatomic, strong) UIButton *handerView;


@property (nonatomic, strong) UIButton *btn1;
@property (nonatomic, strong) UIButton *btn2;
@property (nonatomic, strong) UIButton *btn3;

@end

@implementation PopoverView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.borderColor = RGB(200, 199, 204);
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

-(id)initWithPoint:(CGPoint)point;// titles:(NSArray *)titles images:(NSArray *)images
{
    self = [super init];
    if (self) {
        self.showPoint = point;
        self.titleArray = @[@"取消收藏",@"进入店铺",@"最新动态"];
        self.frame = [self getViewFrame];
        
        _backgroudView = [[UIView alloc]initWithFrame:CGRectMake(5, 5, self.frame.size.width-10, self.frame.size.height-10)];
        _backgroudView.backgroundColor = [UIColor whiteColor];
        [PublicObject drawHorizontalLineOnView:_backgroudView andX:0 andY:_backgroudView.frame.size.height/3 andWidth:_backgroudView.frame.size.width andColor:[UIColor lightGrayColor]];
        [PublicObject drawHorizontalLineOnView:_backgroudView andX:0 andY:_backgroudView.frame.size.height/3*2 andWidth:_backgroudView.frame.size.width andColor:[UIColor lightGrayColor]];
        
        _btn1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, _backgroudView.frame.size.width, _backgroudView.frame.size.height/3)];
        _btn2 = [[UIButton alloc]initWithFrame:CGRectMake(0, _backgroudView.frame.size.height/3, _backgroudView.frame.size.width, _backgroudView.frame.size.height/3)];
        _btn3 = [[UIButton alloc]initWithFrame:CGRectMake(0, _backgroudView.frame.size.height/3*2, _backgroudView.frame.size.width, _backgroudView.frame.size.height/3)];
        
        [_btn1 setTitle:@"取消收藏" forState:UIControlStateNormal];
        _btn1.titleLabel.font = [UIFont systemFontOfSize:10];
        [_btn1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_btn1 setTag:0];
        [_btn1 addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_backgroudView addSubview:_btn1];
        
        [_btn2 setTitle:@"进入店铺" forState:UIControlStateNormal];
        _btn2.titleLabel.font = [UIFont systemFontOfSize:10];
        [_btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_btn2 setTag:1];
        [_btn2 addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_backgroudView addSubview:_btn2];
        
        [_btn3 setTitle:@"最新动态" forState:UIControlStateNormal];
        _btn3.titleLabel.font = [UIFont systemFontOfSize:10];
        [_btn3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_btn3 setTag:2];
        [_btn3 addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_backgroudView addSubview:_btn3];
        
        [self addSubview:_backgroudView];
    }
    return self;
}
-(CGRect)getViewFrame
{
    CGRect frame = CGRectZero;
    
    frame.size.height = [self.titleArray count] * ROW_HEIGHT  + kArrowHeight + 2;
    
    for (NSString *title in self.titleArray) {
        CGFloat width =  [title sizeWithFont:TITLE_FONT constrainedToSize:CGSizeMake(300, 100) lineBreakMode:NSLineBreakByCharWrapping].width;
        frame.size.width = MAX(width, frame.size.width);
    }
    
    frame.origin.x = self.showPoint.x - frame.size.width;
    frame.origin.y = self.showPoint.y - frame.size.height/2;
    
    //左间隔最小5x
    if (frame.origin.x < 5) {
        frame.origin.x = 5;
    }
    //右间隔最小5x
    if ((frame.origin.x + frame.size.width) > 315) {
        frame.origin.x = 315 - frame.size.width;
    }
    
    return frame;
}


//-(void)show
//{
//    self.handerView = [UIButton buttonWithType:UIButtonTypeCustom];
//    [_handerView setFrame:[UIScreen mainScreen].bounds];
//    [_handerView setBackgroundColor:[UIColor clearColor]];
//    [_handerView addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
//    [_handerView addSubview:self];
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    
//    [_parentView addSubview:_handerView];
//    
//    CGPoint arrowPoint = [self convertPoint:self.showPoint fromView:_handerView];
//    self.layer.anchorPoint = CGPointMake(arrowPoint.x / self.frame.size.width, arrowPoint.y / self.frame.size.height);
//    self.frame = [self getViewFrame];
//    
//    self.alpha = 0.f;
//    self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
//    [UIView animateWithDuration:0.2f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        self.transform = CGAffineTransformMakeScale(1.05f, 1.05f);
//        self.alpha = 1.f;
//    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:0.08f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
//            self.transform = CGAffineTransformIdentity;
//        } completion:nil];
//    }];
//}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self.borderColor set]; //设置线条颜色
    
    CGRect frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - kArrowHeight);

    float xMin = CGRectGetMinX(frame);
    float yMin = CGRectGetMinY(frame);
    
    float xMax = CGRectGetMaxX(frame);
    float yMax = CGRectGetMaxY(frame);
    
    CGPoint arrowPoint = [self convertPoint:self.showPoint fromView:_handerView];
    
    UIBezierPath *popoverPath = [UIBezierPath bezierPath];
    [popoverPath moveToPoint:CGPointMake(xMin, yMin)];//左上角
    
    /********************向上的箭头**********************/
    [popoverPath addLineToPoint:CGPointMake(arrowPoint.x - kArrowHeight, yMin)];//left side
    [popoverPath addCurveToPoint:arrowPoint
                   controlPoint1:CGPointMake(arrowPoint.x - kArrowHeight + kArrowCurvature, yMin)
                   controlPoint2:arrowPoint];//actual arrow point
    
    [popoverPath addCurveToPoint:CGPointMake(arrowPoint.x + kArrowHeight, yMin)
                   controlPoint1:arrowPoint
                   controlPoint2:CGPointMake(arrowPoint.x + kArrowHeight - kArrowCurvature, yMin)];//right side
    /********************向上的箭头**********************/
    
    
    [popoverPath addLineToPoint:CGPointMake(xMax, yMin)];//右上角
    
    [popoverPath addLineToPoint:CGPointMake(xMax, yMax)];//右下角
    
    [popoverPath addLineToPoint:CGPointMake(xMin, yMax)];//左下角
    
    //填充颜色
    [RGB(245, 245, 245) setFill];
    [popoverPath fill];
    
    [popoverPath closePath];
    [popoverPath stroke];
}


//-(void)dismiss
//{
//    [self dismiss:YES];
//}
//
//-(void)dismiss:(BOOL)animate
//{
//    if (!animate) {
//        [_handerView removeFromSuperview];
//        return;
//    }
//    
//    [UIView animateWithDuration:0.3f animations:^{
//        self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
//        self.alpha = 0.f;
//    } completion:^(BOOL finished) {
//        [_handerView removeFromSuperview];
//    }];
//    
//}
-(void)selectBtn:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    NSLog(@"%ld",(long)btn.tag);
    if (self.selectRowAtIndex) {
        self.selectRowAtIndex(btn.tag);
    }
    [self removeFromSuperview];
}

//#pragma mark - UITableView
//
//-(UITableView *)tableView
//{
//    if (_tableView != nil) {
//        return _tableView;
//    }
//
//    CGRect rect = self.frame;
//    rect.origin.x = SPACE;
//    rect.origin.y = kArrowHeight + SPACE;
//    rect.size.width -= SPACE * 2;
//    rect.size.height -= (SPACE - kArrowHeight);
//
//    self.tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
//    _tableView.delegate = self;
//    _tableView.dataSource = self;
//    _tableView.alwaysBounceHorizontal = NO;
//    _tableView.alwaysBounceVertical = NO;
//    _tableView.showsHorizontalScrollIndicator = NO;
//    _tableView.showsVerticalScrollIndicator = NO;
//    _tableView.scrollEnabled = NO;
//    _tableView.backgroundColor = [UIColor clearColor];
////    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//
//    return _tableView;
//}
//
//#pragma mark - UITableView DataSource
//
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return [_titleArray count];
//}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *identifier = @"cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//    }
//
//    cell.backgroundView = [[UIView alloc] init];
//  //  cell.backgroundView.backgroundColor = RGB(245, 245, 245);
//
////    if ([_imageArray count] == [_titleArray count]) {
////        cell.imageView.image = [UIImage imageNamed:[_imageArray objectAtIndex:indexPath.row]];
////    }
//    cell.textLabel.font = [UIFont systemFontOfSize:16];
//    cell.textLabel.text = [_titleArray objectAtIndex:indexPath.row];
//
//    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0) {
//        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
//    }
//
//    return cell;
//}
//
//#pragma mark - UITableView Delegate
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//    if (self.selectRowAtIndex) {
//        self.selectRowAtIndex(indexPath.row);
//    }
//    [self dismiss:YES];
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return ROW_HEIGHT;
//}





@end
