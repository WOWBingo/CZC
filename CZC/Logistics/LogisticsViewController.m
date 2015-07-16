//
//  LogisticsViewController.m
//  CZC
//
//  Created by 张浩 on 15/7/15.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "LogisticsViewController.h"
#import "LogisticsTableViewCell.h"
#import "MyLogisticsViewController.h"
@interface LogisticsViewController ()

@end

@implementation LogisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"人人物流";
    self.navigationItem.leftBarButtonItem = self.backMenuItem;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"head_pic"] forBarMetrics:UIBarMetricsDefault ];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //数组初始化
    self.historyArr = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)seachClick:(id)sender {
    MyLogisticsViewController *myLogisticsVC = [[MyLogisticsViewController alloc]initWithNibName:@"MyLogisticsViewController" bundle:nil];
    [self.navigationController pushViewController:myLogisticsVC animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        static NSString *CellIdentifier = @"LogisticsTableViewCell";
        LogisticsTableViewCell *cell = (LogisticsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            NSBundle *bundle = [NSBundle mainBundle];
            NSArray *nibArray = [bundle loadNibNamed:CellIdentifier owner:self options:nil];
            cell = (LogisticsTableViewCell *)[nibArray objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        
        return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    //    switch (indexPath.section) {
    
}
- (IBAction)checkClick:(id)sender {
    self.tableView.hidden = YES;
    self.checkTriangleImg.hidden = NO;
    self.historyTriangleImg.hidden = YES;
}
- (IBAction)historyClick:(id)sender {
    self.tableView.hidden = NO;
    self.checkTriangleImg.hidden = YES;
    self.historyTriangleImg.hidden = NO;
}
@end
