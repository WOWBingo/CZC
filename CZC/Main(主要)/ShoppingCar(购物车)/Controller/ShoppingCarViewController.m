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
@interface ShoppingCarViewController ()

@end

@implementation ShoppingCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购物车";
    
    //设置tableView的cel有内容时显示分割线，无内容时，不显示分割线
    self.tableView.tableFooterView = [[UIView alloc]init];
    //数组初始化
    self.shopCarObjectArr = [[NSMutableArray alloc]init];
    
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;//_shopCarObjectArr.count;
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
