//
//  ShoppingCarViewController.m
//  CZC
//
//  Created by 张浩 on 15/7/15.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ShoppingCarViewController.h"
#import "ShoppingCarTableViewCell.h"
#import "PayViewController.h"
#import "ShopCarObject.h"
#import "ShopCarProductObject.h"
#import "ShoppingCarHeadView.h"
#import "Masonry.h"
@interface ShoppingCarViewController ()

@end

@implementation ShoppingCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购物车";
    self.navigationItem.leftBarButtonItem = nil;
    
    //数组初始化
    self.shopCarObjectArr = [[NSMutableArray alloc]init];
    
    //表格
    _tableView.dataSource = self;
    _tableView.delegate = self;
    //[_tableView setSeparatorColor:[UIColor clearColor]];
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];    
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = SCREEN_WIDTH;

}

-(void)viewWillAppear:(BOOL)animated{
    self.parentViewController.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.hidden = NO;
    [self getShoppingCarData];
}
-(void)viewDidAppear:(BOOL)animated{
    self.parentViewController.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.hidden = NO;
}

-(void)viewWillDisappear:(BOOL)animated{
    self.parentViewController.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = NO;
}
#pragma mark - 11. 购物车列表
/**11. 购物车列表  http://app.czctgw.com/api/shoppingcart2/a */
- (void)getShoppingCarData{

    NSString *params = @"111111";
    [CZCService GETmethod:kShoppingCartList_URL andParameters:params andHandle:^(NSDictionary *myresult) {
        NSDictionary *result = myresult;
        if (result) {
            NSArray *dataArr = [result objectForKey:@"DATA"];
            NSArray *list = [ShopCarObject objectArrayWithKeyValuesArray:dataArr];
            NSLog(@"11. 购物车列表 ------%@",list);
            _shopCarObjectArr = [NSMutableArray arrayWithArray:list];
        }
        else{
            NSLog(@"失败");
        }
    }];
}

#pragma mark - table
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 48)];
    [view setBackgroundColor:[UIColor lightGrayColor]];
    ShoppingCarHeadView *headView = [ShoppingCarHeadView instanceView];
    headView.frame = CGRectMake(0, 8, headView.frame.size.width, headView.frame.size.height);
    [view addSubview:headView];
//    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(view).offset(8);
//        make.left.right.and.bottom.equalTo(view);
//    }];
    return headView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 48;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;//_shopCarObjectArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
  //  ShopCarObject *carObject = [_shopCarObjectArr objectAtIndex:row];
//    ShopCarProductObject *proObject = [carObject.productList objectAtIndex:0];
    static NSString *CellIdentifier = @"ShoppingCarTableViewCell";
    ShoppingCarTableViewCell *cell = (ShoppingCarTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:CellIdentifier owner:self options:nil];
        cell = (ShoppingCarTableViewCell *)[nibArray objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    //    switch (indexPath.section) {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)accountClick:(id)sender {
    PayViewController *payVC = [[PayViewController alloc]initWithNibName:@"PayViewController" bundle:nil];
    [self.navigationController pushViewController:payVC animated:YES];
}
@end
