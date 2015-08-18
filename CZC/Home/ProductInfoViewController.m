//
//  ProductInfoViewController.m
//  CZC
//
//  Created by 周德艺 on 15/7/14.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ProductInfoViewController.h"
#import "ProductTableInfoCell.h"
#import "AdScrollView.h"
#import "ZDYScrollView.h"

@interface ProductInfoViewController ()

@end

static CGFloat kImageOriginHight = 240.f;

@implementation ProductInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"产品详情";
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView setTableFooterView:[[UIView alloc]init]];
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = SCREEN_WIDTH;
    

    
    _headView = [[ZDYScrollView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, kImageOriginHight)];
    
    self.tableView.contentInset = UIEdgeInsetsMake(kImageOriginHight, 0, 0, 0);
    [self.tableView addSubview:_headView];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row == 0) {
//        return SCREEN_WIDTH*0.5;
//    }
    return UITableViewAutomaticDimension;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    if (indexPath.row == 0) {
//        static NSString *TableSampleIdentifier = @"HomeHeadView";
//        
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
//                                 TableSampleIdentifier];
//        if (cell == nil) {
//            cell = [[UITableViewCell alloc]
//                    initWithStyle:UITableViewCellStyleDefault
//                    reuseIdentifier:TableSampleIdentifier];
//        }
//        AdScrollView * scrollView = [[AdScrollView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_WIDTH*0.5)];
//        scrollView.imageNameArray = @[@"zy-p6",@"zy-p7",@"zy-p12",@"zy-p16",@"zy-p17"];
//        [scrollView setAdTitleArray:@[@"zy-p6",@"zy-p7",@"zy-p12",@"zy-p16",@"zy-p17"] withShowStyle:AdTitleShowStyleLeft];
//        //如果滚动视图的父视图由导航控制器控制,必须要设置该属性(ps,猜测这是为了正常显示,导航控制器内部设置了UIEdgeInsetsMake(64, 0, 0, 0))
//        //scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
//        scrollView.PageControlShowStyle = UIPageControlShowStyleCenter;
//        scrollView.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
//        scrollView.pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
//        //[cell addSubview:scrollView];
//        return cell;
//    }else{
    
        static NSString *cellIdentifier = @"ProductTableInfoCell";
        ProductTableInfoCell *cell = (ProductTableInfoCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            NSBundle *bundle = [NSBundle mainBundle];
            NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
            cell = (ProductTableInfoCell *)[nibArray objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        
        return cell;
   // }
}

#pragma mark ----scrollView滚动代理
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    CGFloat kImageOriginHight = 200.0;
//    // 向下滚动为负
//    CGFloat offsetY  = scrollView.contentOffset.y;
//    
//    CGRect rect = _headView.frame;
//    if (offsetY <= 0 || offsetY < kImageOriginHight)
//        rect.size.height = kImageOriginHight - offsetY;
//    
//    _headView.frame = rect;
//}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat yOffset  = scrollView.contentOffset.y;
    if (yOffset < -kImageOriginHight) {
        CGRect f = _headView.frame;
        f.origin.y = yOffset;
        f.size.height =  -yOffset;
        _headView.frame = f;
    }
}

- (IBAction)goShoppingCar:(id)sender {
}

- (IBAction)addShoppingCar:(id)sender {
}
@end
