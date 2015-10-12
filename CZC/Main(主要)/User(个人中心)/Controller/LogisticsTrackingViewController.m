//
//  LogisticsTrackingViewController.m
//  CZC
//
//  Created by 张浩 on 15/10/12.
//  Copyright © 2015年 周德艺. All rights reserved.
//

#import "LogisticsTrackingViewController.h"
#import "LogisticsTrackingTitleTableViewCell.h"
#import "LogisticsTrackingContentTableViewCell.h"
@interface LogisticsTrackingViewController ()

@end

@implementation LogisticsTrackingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSDictionary *regionTemp = [[NSDictionary alloc]initWithObjectsAndKeys:@"快件离开 上海浦东中心 已发往 潍坊中转部" ,@"region",@"2015-06-04 20:00:12",@"time",nil];
    for (int i = 0 ; i<5; i++) {
        [self.logisticsArr addObject:regionTemp];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    int num = 0;
    switch (section) {
        case 0:
            num = 1;
            break;
        case 1:
            num = (int)self.logisticsArr.count;
            break;
        default:
            break;
    }
    return num;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        static NSString *CellIdentifier = @"LogisticsTrackingTitleTableViewCell";
        LogisticsTrackingTitleTableViewCell *cell = (LogisticsTrackingTitleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            NSBundle *bundle = [NSBundle mainBundle];
            NSArray *nibArray = [bundle loadNibNamed:CellIdentifier owner:self options:nil];
            cell = (LogisticsTrackingTitleTableViewCell *)[nibArray objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        return cell;
    }
    else{
        static NSString *CellIdentifier = @"LogisticsTrackingContentTableViewCell";
        LogisticsTrackingContentTableViewCell *cell = (LogisticsTrackingContentTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            NSBundle *bundle = [NSBundle mainBundle];
            NSArray *nibArray = [bundle loadNibNamed:CellIdentifier owner:self options:nil];
            cell = (LogisticsTrackingContentTableViewCell *)[nibArray objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    int hight = 0;
    switch (indexPath.section) {
        case 0:
            hight = 100;
            break;
        case 1:
            hight = 60;
            break;
        default:
            break;
    }
    return hight;
}
@end
