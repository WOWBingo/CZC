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
#import "HundredYuanCell.h"
#import "CityListViewController.h"
#import "ProductInfoViewController.h"
#import "HundredViewController.h"
#import "ShopTableViewController.h"
#import "TestObject.h"
#import "ZDYScrollView.h"

#define ScrollViewHight (SCREEN_WIDTH*0.5)

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加左侧的item
    if (_isHomePage) {
        _leftItem = [[UIBarButtonItem alloc] init];
        [_leftItem setTitle:@"全国"];
    }else{
        _leftItem = [[UIBarButtonItem alloc] initWithTitle:@"济南"
                                                     style:UIBarButtonItemStyleBordered target:self
                                                    action:@selector(changeCity)];
    }
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
    
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = SCREEN_WIDTH;
    
    //轮播视图
    _headView = [[ZDYScrollView alloc]initWithFrame:CGRectZero];
    self.tableView.contentInset = UIEdgeInsetsMake(ScrollViewHight, 0, 0, 0);
    __weak typeof(self) weakSelf = self;
    _headView.clickBlock = ^(NSInteger index){
        HomeImageObject *object = [weakSelf.homeImagesArray objectAtIndex:index];
        NSLog(@"跳转的controller为=========%ld",(long)object.homeImageID);
    };
    [self.tableView addSubview:_headView];
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setShadowImage:nil];
    self.parentViewController.tabBarController.tabBar.hidden = NO;
    _headView.frame = CGRectMake(0, -ScrollViewHight, SCREEN_WIDTH, ScrollViewHight);
    
    [self getHomeImagesData];
}
-(void)viewDidAppear:(BOOL)animated{
    [self.navigationController.navigationBar setShadowImage:nil];
    self.parentViewController.tabBarController.tabBar.hidden = NO;
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"cpxx-8"]];
    self.parentViewController.tabBarController.tabBar.hidden = YES;
}


#pragma mark - 获取数据.首页图片
/**  59.首页图片 http://app.czctgw.com/api/ShopGGlistIndex/?CityDomianName=chengdu*/
- (void)getHomeImagesData{
    NSString *params = @"CityDomianName=chengdu";
    [CZCService GETmethod:kShopGGlistIndex_URL andParameters:params andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            NSArray *dataArr = [myresult objectForKey:@"ImageList"];
            NSArray *list = [HomeImageObject objectArrayWithKeyValuesArray:dataArr];
            if (list.count > 0) {
                _homeImagesArray = list;
                NSMutableArray *homeImages = [[NSMutableArray alloc]init];
                for (int i = 0; i<list.count; i++) {
                    HomeImageObject *object = [list objectAtIndex:i];
                    [homeImages addObject:object.value];
                }
                if (homeImages) {
                    [_headView loadImageData:homeImages];
                }
            }
            NSLog(@" 59.首页图片 ------%@",list);
        }
        else{
            NSLog(@"失败");
        }
    }];
}

//选择地点
- (void)changeCity{
    CityListViewController *cityVC = [[CityListViewController alloc]initWithNibName:@"CityListViewController" bundle:nil];
    [self presentViewController:cityVC animated:YES completion:^{  }];
    
}
//搜索
- (void)pushSearchVC{
    SearchViewController *searchVC = [[SearchViewController alloc]initWithNibName:@"SearchViewController" bundle:nil];
    UINavigationController *searchNVC = [[UINavigationController alloc]initWithRootViewController:searchVC];
    [self presentViewController:searchNVC animated:YES completion:^{  }];
}

#pragma mark ----scrollView滚动代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat yOffset  = scrollView.contentOffset.y;
    if (yOffset < -ScrollViewHight) {
        CGRect f = _headView.frame;
        f.origin.y = yOffset;
        f.size.height =  -yOffset;
        _headView.frame = f;
        [_headView reloadSize];
    }
}
#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_isHomePage) {
        return _dataList.count + 1;
    }
    return _dataList.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (IS_IOS8_OR_ABOVE) {
        return UITableViewAutomaticDimension;
    }else{
        return SCREEN_WIDTH/3*2+28;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    if (_isHomePage) {
        if (indexPath.row == 0) {
            static NSString *cellIdentifier = @"HundredYuanCell";
            HundredYuanCell *cell = (HundredYuanCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (cell == nil) {
                NSBundle *bundle = [NSBundle mainBundle];
                NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
                cell = (HundredYuanCell *)[nibArray objectAtIndex:0];
                cell.moreBtn.tag = indexPath.row;
                [cell.moreBtn addTarget:self action:@selector(getMore:) forControlEvents:UIControlEventTouchUpInside];
                [cell.leftBtn addTarget:self action:@selector(productInfo:) forControlEvents:UIControlEventTouchUpInside];
                [cell.topRightBtn addTarget:self action:@selector(productInfo:) forControlEvents:UIControlEventTouchUpInside];
                [cell.bottomMidBtn addTarget:self action:@selector(productInfo:) forControlEvents:UIControlEventTouchUpInside];
                [cell.bottomRightBtn addTarget:self action:@selector(productInfo:) forControlEvents:UIControlEventTouchUpInside];
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
                [cell.moreBtn addTarget:self action:@selector(getMore:) forControlEvents:UIControlEventTouchUpInside];
                [cell.topLeftBtn addTarget:self action:@selector(shopInfo:) forControlEvents:UIControlEventTouchUpInside];
                [cell.topRightBtn addTarget:self action:@selector(shopInfo:) forControlEvents:UIControlEventTouchUpInside];
                [cell.bottomLeftBtn addTarget:self action:@selector(shopInfo:) forControlEvents:UIControlEventTouchUpInside];
                [cell.bottomMidBtn addTarget:self action:@selector(shopInfo:) forControlEvents:UIControlEventTouchUpInside];
                [cell.bottomRightBtn addTarget:self action:@selector(shopInfo:) forControlEvents:UIControlEventTouchUpInside];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            }
            //设置cell上button标识符
            [cell buttonAddCellNum:indexPath.row];
            cell.numLabel.text = [NSString stringWithFormat:@"%ldF",row];
            cell.titleLabel.text = [_dataList objectAtIndex:row-1];
            return cell;
        }
    }else{
        static NSString *cellIdentifier = @"HomeViewCell";
        HomeViewCell *cell = (HomeViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            NSBundle *bundle = [NSBundle mainBundle];
            NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
            cell = (HomeViewCell *)[nibArray objectAtIndex:0];
            [cell.moreBtn addTarget:self action:@selector(getMore:) forControlEvents:UIControlEventTouchUpInside];
            [cell.topLeftBtn addTarget:self action:@selector(shopInfo:) forControlEvents:UIControlEventTouchUpInside];
            [cell.topRightBtn addTarget:self action:@selector(shopInfo:) forControlEvents:UIControlEventTouchUpInside];
            [cell.bottomLeftBtn addTarget:self action:@selector(shopInfo:) forControlEvents:UIControlEventTouchUpInside];
            [cell.bottomMidBtn addTarget:self action:@selector(shopInfo:) forControlEvents:UIControlEventTouchUpInside];
            [cell.bottomRightBtn addTarget:self action:@selector(shopInfo:) forControlEvents:UIControlEventTouchUpInside];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        [cell buttonAddCellNum:indexPath.row];
        cell.numLabel.text = [NSString stringWithFormat:@"%ldF",(long)row+1];
        cell.titleLabel.text = [_dataList objectAtIndex:row];
        return cell;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *	更多按钮
 */
- (IBAction)getMore:(id)sender{
    
    UIButton *btn = (UIButton*)sender;
    if (_isHomePage && btn.tag == 0) {
        HundredViewController *hundredVC = [[HundredViewController alloc]initWithNibName:@"HundredViewController" bundle:nil];
        hundredVC.productCatagory = @"004001001";
        [self.navigationController pushViewController:hundredVC animated:YES];
    }else{
        ShopTableViewController *shopVC = [[ShopTableViewController alloc]initWithNibName:@"ShopTableViewController" bundle:nil];
        [self.navigationController pushViewController:shopVC animated:YES];
        
    }
    
}

/**
 *	产品详情跳转
 */
- (IBAction)productInfo:(id)sender{
    
    UIButton *btn = (UIButton*)sender;
    ProductInfoViewController *productInfoVC = [[ProductInfoViewController alloc]initWithNibName:@"ProductInfoViewController" bundle:nil];
    switch (btn.tag) {
        case 0:{
            NSLog(@"0000");
            //715b0edf-1a41-4439-ab4e-0738da284946  连衣裙
            ProductsObject *product = [[ProductsObject alloc]init];
            product.guid = @"715b0edf-1a41-4439-ab4e-0738da284946";
            productInfoVC.product = product;
        }
            break;
        case 1:{
            NSLog(@"1111");
            ProductsObject *product = [[ProductsObject alloc]init];
            product.guid = @"8bf39849-c3b8-4529-abe6-6d3e1da5227d";
            productInfoVC.product = product;
        }
            break;
        case 2:{
            NSLog(@"2222");
            ProductsObject *product = [[ProductsObject alloc]init];
            product.guid = @"86618022-2967-45c2-8879-5175d2fd0b04";
            productInfoVC.product = product;
        }
            break;
        case 3:{
            NSLog(@"3333");
            ProductsObject *product = [[ProductsObject alloc]init];
            product.guid = @"eed39973-32e6-49e9-9623-9cf6e6f23ba6";
            productInfoVC.product = product;
        }
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:productInfoVC animated:YES];
    
}

/**
 *	店铺详情跳转
 */
- (IBAction)shopInfo:(id)sender{
    HomeViewButton *button = (HomeViewButton*)sender;
    NSLog(@"%ld-----%ld",(long)button.tag,(long)button.indexOfCell);
    
}

@end
