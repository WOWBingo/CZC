//
//  InstallViewController.m
//  CZC
//
//  Created by 张浩 on 15/7/22.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "InstallViewController.h"
#import "InstallTimeTableViewCell.h"
#import "InstallTimeViewController.h"
@interface InstallViewController ()

@end

@implementation InstallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息设置";
    //设置tableView的cel有内容时显示分割线，无内容时，不显示分割线
    self.tableView.tableFooterView = [[UIView alloc]init];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 3;
            break;
        case 2:
            return 2;
            break;
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier1 = @"Cell";
    static NSString *CellIdentifier2 = @"InstallTimeTableViewCell";
    UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
    InstallTimeTableViewCell *cell2 = (InstallTimeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier2];
    switch (indexPath.section) {
        case 0:{
            if (cell1 == nil) {
                cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1] ;
                cell1.backgroundColor = [UIColor whiteColor];
                cell1.contentView.backgroundColor = [UIColor clearColor];
                cell1.selectionStyle = UITableViewCellSelectionStyleNone;
                
                [cell1.textLabel setTextColor:[UIColor blackColor]];
                cell1.textLabel.font = [UIFont systemFontOfSize:14];
            }
            cell1.textLabel.text = @"接收消息通知";
            self.newsSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-80, 6, 20, 15)];
            [cell1.contentView addSubview:self.newsSwitch];
        }
            break;
        case 1:{
            if (cell1 == nil) {
                cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1] ;
                cell1.backgroundColor = [UIColor whiteColor];
                cell1.contentView.backgroundColor = [UIColor clearColor];
                cell1.selectionStyle = UITableViewCellSelectionStyleNone;
                
                [cell1.textLabel setTextColor:[UIColor blackColor]];
                cell1.textLabel.font = [UIFont systemFontOfSize:14];
            }
            switch (indexPath.row) {
                case 0:{
                    cell1.textLabel.text = @"物流通知";
                    self.logisticsSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-80, 6, 20, 15)];
                }
                    break;
                case 1:{
                    cell1.textLabel.text = @"促销通知";
                    self.promotionSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-80, 6, 20, 15)];
                }
                case 2:{
                    cell1.textLabel.text = @"系统通知";
                    self.systemSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-80, 6, 20, 15)];
                }
                default:
                    break;
            }
        }
            break;
        case 2:{
            switch (indexPath.row) {
                case 0:
                    if (cell1 == nil) {
                        cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1] ;
                        cell1.backgroundColor = [UIColor whiteColor];
                        cell1.contentView.backgroundColor = [UIColor clearColor];
                        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
                        
                        [cell1.textLabel setTextColor:[UIColor blackColor]];
                        cell1.textLabel.font = [UIFont systemFontOfSize:14];
                    }
                    cell1.textLabel.text = @"静音免打扰时段";
                    break;
                case 1:{
                    if (cell2 == nil) {
                        NSBundle *bundle = [NSBundle mainBundle];
                        NSArray *nibArray = [bundle loadNibNamed:CellIdentifier2 owner:self options:nil];
                        cell2 = (InstallTimeTableViewCell *)[nibArray objectAtIndex:0];
                        cell2.backgroundColor = [UIColor whiteColor];
                        [cell2 setSelectionStyle:UITableViewCellSelectionStyleNone];
                    }
                    cell2.startTimeLab.text = @"22:00";
                    cell2.endTimeLab.text = @"6:00";
                    cell2.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                    return cell2;
                }
                    break;
                default:
                    break;
            }
        }
            break;
        default:
            break;
    }
    return cell1;
    return cell2;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

        return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    NSLog(@"%ld",(long)indexPath.section);
    if(indexPath.section == 2 && indexPath.row == 1){
        InstallTimeViewController *installTimeVC = [[InstallTimeViewController alloc]initWithNibName:@"InstallTimeViewController" bundle:nil];
        [self presentViewController:installTimeVC animated:YES completion:^{
        }];
    }
}

@end
