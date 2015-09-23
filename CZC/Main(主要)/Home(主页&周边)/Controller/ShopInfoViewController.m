//
//  ShopInfoViewController.m
//  CZC
//
//  Created by 周德艺 on 15/7/21.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ShopInfoViewController.h"
#import "AdScrollView.h"
#import "Masonry.h"
#import "ProductTableInfoCell.h"

@interface ShopInfoViewController ()

@end

@implementation ShopInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"店铺详情";
    
    AdScrollView * scrollView = [[AdScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.45-8)];
    scrollView.imageNameArray = @[@"zy-p6",@"zy-p7",@"zy-p12",@"zy-p16",@"zy-p17"];
    [scrollView setAdTitleArray:@[@"zy-p6",@"zy-p7",@"zy-p12",@"zy-p16",@"zy-p17"] withShowStyle:AdTitleShowStyleLeft];
    //如果滚动视图的父视图由导航控制器控制,必须要设置该属性(ps,猜测这是为了正常显示,导航控制器内部设置了UIEdgeInsetsMake(64, 0, 0, 0))
    //scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    scrollView.PageControlShowStyle = UIPageControlShowStyleCenter;
    scrollView.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    scrollView.pageControl.currentPageIndicatorTintColor = [UIColor grayColor];
    [_titleView addSubview:scrollView];
    
    _titleBar = [[LGtitleBarView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 36)];
    self.titles = @[@"店铺首页", @"精品推荐", @"最新上架", @"热门商品", @"促销商品", @"最后疯抢", @"即将上架"];
    _titleBar.titles = self.titles;
    _titleBar.delegate = self;
    [_centerView addSubview:_titleBar];
    [PublicObject drawHorizontalLineOnView:_centerView andX:0 andY:0 andWidth:SCREEN_WIDTH andColor:[UIColor lightGrayColor]];
    [PublicObject drawHorizontalLineOnView:_centerView andX:0 andY:36 andWidth:SCREEN_WIDTH andColor:[UIColor lightGrayColor]];
    _oldFrame = _centerView.frame;
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView setTableFooterView:[[UIView alloc]init]];
    [_tableView setSeparatorColor:[UIColor clearColor]];
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 160;
}

- (void)viewWillAppear:(BOOL)animated{
    [self getShopInfo];
}

#pragma mark - 9.店铺详细信息
/**
 *9.店铺详细信息
 *http://app.czctgw.com/api/shopsinfo/100001058
 */
- (void)getShopInfo{
    [CZCService GETmethod:kShopsInfo_URL andParameters:_shopId andHandle:^(NSDictionary *myresult) {
        NSDictionary *result = myresult;
        if (result) {
            NSDictionary *dic = [result objectForKey:@"Shop"];
            _shop = [ShopObject objectWithKeyValues:dic];
            NSLog(@"9.店铺详细信息 ------%@",_shop);
            [self showData];
        }
        else{
            NSLog(@"失败");
        }
    }];
}
/**
 *	显示数据
 */
- (void)showData{
    [_shopNameLab setText:_shop.shopName];
    [_locationLab setText:_shop.address];
}


/** titlebar代理方法 */
-(void)LGtitleBarView:(LGtitleBarView *)titleBarView didSelectedItem:(int)index
{
    NSLog(@"%d", index);

}

#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 12;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (IS_IOS8_OR_ABOVE) {
        return UITableViewAutomaticDimension;
    }else{
        return 160;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //NSInteger row = indexPath.row;
    static NSString *cellIdentifier = @"ProductTableInfoCell";
    ProductTableInfoCell *cell = (ProductTableInfoCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
        cell = (ProductTableInfoCell *)[nibArray objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.tableView) {
        if (self.tableView.contentOffset.y > 30) {
            [UIView beginAnimations:@"upcenter" context:(__bridge void *)(_centerView)];
            [UIView setAnimationDuration:0.5f];
            [UIView setAnimationDelegate:self];
            [_centerView setFrame:CGRectMake(0,0, _centerView.frame.size.width, _centerView.frame.size.height)];
            [UIView commitAnimations];
            [_tableView setFrame:CGRectMake(0,30, _tableView.frame.size.width, SCREEN_HEIGHT-100)];

        }else if(self.tableView.contentOffset.y < 5){
            [UIView beginAnimations:@"downcenter" context:(__bridge void *)(_centerView)];
            [UIView setAnimationDuration:0.5f];
            [UIView setAnimationDelegate:self];
            [_centerView setFrame:CGRectMake(0, _titleView.frame.size.height, _centerView.frame.size.width, _centerView.frame.size.height)];
            [UIView commitAnimations];
            [_tableView setFrame:CGRectMake(0, _centerView.frame.origin.y + 36, _tableView.frame.size.width, _tableView.frame.size.height)];
        }
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)callShop:(id)sender {
}
@end
