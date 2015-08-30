//
//  BillingDetailsViewController.m
//  CZC
//
//  Created by 张浩 on 15/8/27.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "BillingDetailsViewController.h"
#import "BillingDetailsTableViewCell.h"
#import "BillingReportsTableViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "BillingReportsDetailsViewController.h"
#import "BillingOrdersDetailsViewController.h"
@interface BillingDetailsViewController ()

@end

@implementation BillingDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"账单明细";

    self.dateStr = @"2015年06月";
    self.segmentBtn.selectedSegmentIndex = 0;
    self.isOrderForms = YES;
    [self.segmentBtn addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
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
    static NSString *CellIdentifier1 = @"BillingDetailsTableViewCell";
    BillingDetailsTableViewCell *cell1 = (BillingDetailsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
    
    static NSString *CellIdentifier2 = @"BillingReportsTableViewCell";
    BillingReportsTableViewCell *cell2 = (BillingReportsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier2];
    
    if (self.isOrderForms) {//明细cell
        if (cell1 == nil) {
            NSBundle *bundle = [NSBundle mainBundle];
            NSArray *nibArray = [bundle loadNibNamed:CellIdentifier1 owner:self options:nil];
            cell1 = (BillingDetailsTableViewCell *)[nibArray objectAtIndex:0];
            [cell1 setSelectionStyle:UITableViewCellSelectionStyleNone];
            cell1.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        return cell1;
    }else{
        if (cell2 == nil) {
            NSBundle *bundle = [NSBundle mainBundle];
            NSArray *nibArray = [bundle loadNibNamed:CellIdentifier2 owner:self options:nil];
            cell2 = (BillingReportsTableViewCell *)[nibArray objectAtIndex:0];
            [cell2 setSelectionStyle:UITableViewCellSelectionStyleNone];
            cell2.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        cell2.progressImg.layer.cornerRadius= 5;
        cell2.progressImg.layer.masksToBounds= YES;
        return cell2;
    }
    return cell1;
    return cell2;
}
#pragma tableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.isOrderForms) {
        BillingOrdersDetailsViewController *billingOrdersDetailsVC = [[BillingOrdersDetailsViewController alloc]initWithNibName:@"BillingOrdersDetailsViewController" bundle:nil];
        [self.navigationController pushViewController:billingOrdersDetailsVC animated:YES];
    }else{
        BillingReportsDetailsViewController *billingReportsDetailsVC = [[BillingReportsDetailsViewController alloc]initWithNibName:@"BillingReportsDetailsViewController" bundle:nil];
        [self.navigationController pushViewController:billingReportsDetailsVC animated:YES];
    }
}
- (IBAction)chooseTimeClick:(id)sender {
    [_pickview remove];
    //获取当前年份
    NSDate *now = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    NSString *destDateString = [dateFormatter stringFromDate:now];
    NSString *yearStr = [destDateString substringToIndex:4];
    
    int yearInt = [yearStr intValue];
    NSMutableArray *yearArr = [[NSMutableArray alloc]init];
    int temp =2013; //用户注册年份;
    for (int i = temp; i<yearInt+1+50; i++) {
        NSString *year = [NSString stringWithFormat:@"%d年",i];
        [yearArr addObject:year];
    }
    NSLog(@"%@",yearArr);
    NSArray *array=@[yearArr,@[@"1月",@"2月",@"3月",@"4月",@"5月",@"6月",@"7月",@"8月",@"9月",@"10月",@"11月",@"12月"]];
    _pickview=[[ZHPickView alloc] initPickviewWithArray:array isHaveNavControler:NO];
    _pickview.delegate=self;
    [_pickview show];
}
- (void)changeDate{
    //修改
    NSString *year = [self.dateStr substringToIndex:5];
    NSString *month = [self.dateStr substringFromIndex:5];
    [self.yearBtn setTitle:year forState:UIControlStateNormal];
    [self.monthBtn setTitle:month forState:UIControlStateNormal];
}
-(void)toobarDonBtnHaveClick:(ZHPickView *)pickView resultString:(NSString *)resultString{
    //修改
    self.dateStr = resultString;
    [self performSelector:@selector(changeDate) withObject:nil afterDelay:0.1];
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
//segment
-(void)segmentAction:(UISegmentedControl *)seg{
    NSInteger index = seg.selectedSegmentIndex;
    switch (index) {
        case 0:
            self.isOrderForms = YES;
            break;
        case 1:
            self.isOrderForms = NO;
            break;
        default:
            break;
    }
    [self.tableView reloadData];
}
@end
