//
//  BillingReportsDetailsViewController.m
//  CZC
//
//  Created by 张浩 on 15/8/30.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "BillingReportsDetailsViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "BillingReportsDetailsTableViewCell.h"
@interface BillingReportsDetailsViewController ()

@end

@implementation BillingReportsDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"类别详情";
    self.progressImg.layer.cornerRadius= 5;
    self.progressImg.layer.masksToBounds= YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma tableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 21;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 300.0, 44.0)];
    customView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.opaque = NO;
    headerLabel.textColor = [UIColor lightGrayColor];
    headerLabel.highlightedTextColor = [UIColor whiteColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:14];
    headerLabel.frame = CGRectMake(10.0,-10, 300.0, 44.0);
    
    headerLabel.text =  @"16号-周一";
    
    [customView addSubview:headerLabel];
    
    return customView;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"BillingReportsDetailsTableViewCell";
    BillingReportsDetailsTableViewCell *cell = (BillingReportsDetailsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:CellIdentifier owner:self options:nil];
        cell = (BillingReportsDetailsTableViewCell *)[nibArray objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}
#pragma tableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BillingOrdersDetailsViewController *billingOrdersDetailsVC = [[BillingOrdersDetailsViewController alloc]initWithNibName:@"BillingOrdersDetailsViewController" bundle:nil];
    [self.navigationController pushViewController:billingOrdersDetailsVC animated:YES];
}
// 去掉UItableview headerview黏性(sticky)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat sectionHeaderHeight = 40;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }
    else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}


@end
