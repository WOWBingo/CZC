//
//  ShoppingCarViewController.m
//  CZC
//
//  Created by 张浩 on 15/7/15.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ShoppingCarViewController.h"
#import "ShoppingCarTableViewCell.h"
@interface ShoppingCarViewController ()

@end

@implementation ShoppingCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购物车";
    self.navigationItem.leftBarButtonItem = self.backMenuItem;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"head_pic"] forBarMetrics:UIBarMetricsDefault ];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //设置tableView的cel有内容时显示分割线，无内容时，不显示分割线
    self.tableView.tableFooterView = [[UIView alloc]init];
    //数组初始化
    self.productsArr = [[NSMutableArray alloc]init];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
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
}
@end
