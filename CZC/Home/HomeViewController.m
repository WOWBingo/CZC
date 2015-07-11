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
#import "HomeViewCell.h"


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
    [_tableView setSeparatorColor:[UIColor clearColor]];
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _dataList = [[NSMutableArray alloc]initWithArray: @[@"零食小吃",@"男女服饰",@"户外运动",@"箱包",@"书籍"]];
    
    _isHomePage = YES;
//划线
//    SvGridView *gridView = [[SvGridView alloc] initWithFrame:self.view.bounds];
//    gridView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    gridView.alpha = 0.6;
//    gridView.gridColor = [UIColor greenColor];
//    [self.view addSubview:gridView];
    

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
    if (_isHomePage) {
        return _dataList.count + 2;
    }
    return _dataList.count + 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 180;
    }else{
        return 180;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        static NSString *TableSampleIdentifier = @"HomeHeadView";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                                 TableSampleIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:TableSampleIdentifier];
        }
        AdScrollView * scrollView = [[AdScrollView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, 180)];
        scrollView.imageNameArray = @[@"zy-p6",@"zy-p7",@"zy-p12",@"zy-p16",@"zy-p17"];
        [scrollView setAdTitleArray:@[@"zy-p6",@"zy-p7",@"zy-p12",@"zy-p16",@"zy-p17"] withShowStyle:AdTitleShowStyleLeft];
        //如果滚动视图的父视图由导航控制器控制,必须要设置该属性(ps,猜测这是为了正常显示,导航控制器内部设置了UIEdgeInsetsMake(64, 0, 0, 0))
        //scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        scrollView.PageControlShowStyle = UIPageControlShowStyleRight;
        scrollView.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        scrollView.pageControl.currentPageIndicatorTintColor = [UIColor purpleColor];
        [cell addSubview:scrollView];
        return cell;
    }else{
        if (_isHomePage) {
            if (indexPath.row == 1) {
                static NSString *cellIdentifier = @"HomeViewCell";
                HomeViewCell *cell = (HomeViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
                if (cell == nil) {
                    NSBundle *bundle = [NSBundle mainBundle];
                    NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
                    cell = (HomeViewCell *)[nibArray objectAtIndex:0];
                    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                }
                
                return cell;
            }else{
                static NSString *cellIdentifier = @"HomeViewCell";
                HomeViewCell *cell = (HomeViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
                if (cell == nil) {
                    NSBundle *bundle = [NSBundle mainBundle];
                    NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
                    cell = (HomeViewCell *)[nibArray objectAtIndex:0];
                    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                }
                cell.numLabel.text = [NSString stringWithFormat:@"%ldF",indexPath.row-1];
                cell.titleLabel.text = [_dataList objectAtIndex:indexPath.row-2];
                return cell;
            }
        }else{
            static NSString *cellIdentifier = @"HomeViewCell";
            HomeViewCell *cell = (HomeViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (cell == nil) {
                NSBundle *bundle = [NSBundle mainBundle];
                NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
                cell = (HomeViewCell *)[nibArray objectAtIndex:0];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            }
            cell.numLabel.text = [NSString stringWithFormat:@"%ldF",indexPath.row];
            cell.titleLabel.text = [_dataList objectAtIndex:indexPath.row-1];
            return cell;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
