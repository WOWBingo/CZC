//
//  HomeViewController.m
//  CZC
//
//  Created by 周德艺 on 15/7/6.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "HomeViewController.h"
#import "SearchViewController.h"
#import "AdScrollView.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"cpxx-7"] forBarMetrics:UIBarMetricsDefault ];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    //添加左侧的item
    _leftItem = [[UIBarButtonItem alloc] initWithTitle:@"全国"
                                                 style:UIBarButtonItemStyleBordered target:self
                                                action:@selector(changeCity)];
    self.navigationItem.leftBarButtonItem = _leftItem;
    
    //导航条的搜索条
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0.0f,0.0f,SCREEN_WIDTH-120,44.0f)];
    searchBar.backgroundColor = [UIColor clearColor];
    searchBar.backgroundImage = [UIImage imageNamed:@"cpxx-7"];
    searchBar.placeholder = @"请输入关键字";
    UIButton *button = [[UIButton alloc]initWithFrame:searchBar.frame];
    [button addTarget:self action:@selector(pushSearchVC) forControlEvents:UIControlEventTouchUpInside];
    _searchView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-120, 44)];
    _searchView.backgroundColor = [UIColor clearColor];
    [_searchView addSubview:searchBar];
    [_searchView addSubview:button];
    
    self.navigationItem.titleView = _searchView;
    
    //表格
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _dataList = [[NSMutableArray alloc]initWithArray: @[@"男鞋",@"自行车",@"男T恤"]];
}
//选择地点
- (void)changeCity{
    
}
//搜索
- (void)pushSearchVC{
    SearchViewController *searchVC = [[SearchViewController alloc]initWithNibName:@"SearchViewController" bundle:nil];
    UINavigationController *searchNVC = [[UINavigationController alloc]initWithRootViewController:searchVC];
    [self presentViewController:searchNVC animated:NO completion:^{  }];
}



#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataList.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 180;
    }else{
        return 180;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             TableSampleIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:TableSampleIdentifier];
    }
    if (indexPath.row == 0) {
        AdScrollView * scrollView = [[AdScrollView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, 180)];
        scrollView.imageNameArray = @[@"zy-p6",@"zy-p7",@"zy-p12",@"zy-p16",@"zy-p17"];
        [scrollView setAdTitleArray:@[@"zy-p6",@"zy-p7",@"zy-p12",@"zy-p16",@"zy-p17"] withShowStyle:AdTitleShowStyleLeft];
        //如果滚动视图的父视图由导航控制器控制,必须要设置该属性(ps,猜测这是为了正常显示,导航控制器内部设置了UIEdgeInsetsMake(64, 0, 0, 0))
        //scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        scrollView.PageControlShowStyle = UIPageControlShowStyleRight;
        scrollView.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        scrollView.pageControl.currentPageIndicatorTintColor = [UIColor purpleColor];
        [cell addSubview:scrollView];
    }else{
        if (_dataList != nil && _dataList.count >0) {
            NSUInteger row = [indexPath row];
            cell.textLabel.text = [_dataList objectAtIndex:row];
        }
    }
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
