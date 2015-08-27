//
//  BillingDetailsViewController.m
//  CZC
//
//  Created by 张浩 on 15/8/27.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "BillingDetailsViewController.h"
#import "BillingDetailsTableViewCell.h"
@interface BillingDetailsViewController ()

@end

@implementation BillingDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"账单明细";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeDate:) name:@"date"object:nil];
    self.dateStr = @"2015年06月";

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
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"16日-周一";
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"BillingDetailsTableViewCell";
    BillingDetailsTableViewCell *cell = (BillingDetailsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:CellIdentifier owner:self options:nil];
        cell = (BillingDetailsTableViewCell *)[nibArray objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
//    cell.titleLab.text = @"账户余额";
//    cell.infoLab.hidden = NO;
//    NSString *advancePayment = [NSString stringWithFormat:@"%f",self.object.advancePayment];
//    NSRange range = [advancePayment rangeOfString:@"."];
//    NSInteger location = range.location;
//    advancePayment = [advancePayment substringToIndex:location+3];
//    cell.infoLab.text = [NSString stringWithFormat:@"%@",advancePayment];
    return cell;
}
#pragma tableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    switch (indexPath.row) {
    //        case 0:
    //            <#statements#>
    //            break;
    //        case 1:
    //            break;
    //        case 2:
    //            <#statements#>
    //            break;
    //        default:
    //            break;
    //    }
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
    for (int i = temp; i<yearInt+1; i++) {
        NSString *year = [NSString stringWithFormat:@"%d年",i];
        [yearArr addObject:year];
    }
    NSLog(@"%@",yearArr);
    NSArray *array=@[yearArr,@[@"1月",@"2月",@"3月",@"4月",@"5月",@"6月",@"7月",@"8月",@"9月",@"10月",@"11月",@"12月"]];
    _pickview=[[ZHPickView alloc] initPickviewWithArray:array isHaveNavControler:NO];
    _pickview.delegate=self;
    [_pickview show];
}
- (void) changeDate:(NSNotification*) notification
{
    self.dateStr = [notification object];//获取到传递的对象
    [self.tableView reloadData];
}
@end
