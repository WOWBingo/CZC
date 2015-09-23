//
//  InstallViewController.m
//  CZC
//
//  Created by 张浩 on 15/7/22.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "InstallViewController.h"
#import "InstallTimeTableViewCell.h"
#import "TimeView.h"
#import "AppDelegate.h"
@interface InstallViewController ()

@end

@implementation InstallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息设置";
    //设置tableView的cel有内容时显示分割线，无内容时，不显示分割线
    self.tableView.tableFooterView = [[UIView alloc]init];
    
    self.startTimeStr = @"3";
    self.endTimeStr = @"9";
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(submitTime:)
                                                 name:@"submitTime"
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(cancelTime:)
                                                 name:@"cancelTime"
                                               object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 4;
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
        case 3:
            return 1;
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
                    [cell1.contentView addSubview:self.logisticsSwitch];
                }
                    break;
                case 1:{
                    cell1.textLabel.text = @"促销通知";
                    self.promotionSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-80, 6, 20, 15)];
                    [cell1.contentView addSubview:self.promotionSwitch];
                }
                case 2:{
                    cell1.textLabel.text = @"系统通知";
                    self.systemSwitch = [[UISwitch alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-80, 6, 20, 15)];
                    [cell1.contentView addSubview:self.systemSwitch];
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
                    cell2.startTimeLab.text = [NSString stringWithFormat:@"%@:00",self.startTimeStr];
                    cell2.endTimeLab.text = [NSString stringWithFormat:@"%@:00",self.endTimeStr];
                    cell2.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                    self.installTimeCell = cell2;
                    return cell2;
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 3:{
            if (cell1 == nil) {
                cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1] ;
                cell1.backgroundColor = [UIColor whiteColor];
                cell1.contentView.backgroundColor = [UIColor clearColor];
                cell1.selectionStyle = UITableViewCellSelectionStyleNone;
                
                [cell1.textLabel setTextColor:[UIColor blackColor]];
                cell1.textLabel.font = [UIFont systemFontOfSize:14];
            }
            UIButton *quitBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 7, SCREEN_WIDTH-40, 30)];
            [quitBtn setBackgroundColor:[UIColor redColor]];
            [quitBtn setTintColor:[UIColor whiteColor]];
            [quitBtn setTitle:@"退  出" forState:UIControlStateNormal];
            [quitBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
            quitBtn.layer.cornerRadius = quitBtn.frame.size.height / 2;
            [quitBtn addTarget:self action:@selector(quitClick) forControlEvents:UIControlEventTouchUpInside];
            [cell1.contentView addSubview:quitBtn];
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
        self.timeView = [TimeView instanceTimeView];
        self.timeView.backgroundColor = [UIColor clearColor];
        self.timeView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.timeView.pickView.delegate = self;
        self.timeView.pickView.dataSource = self;
        self.timeArr = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24", nil];
        self.timeView.titleLab.text = [NSString stringWithFormat:@"每日%@:00-次日%@:00",self.startTimeStr,self.endTimeStr];
        int startIndex = [self.startTimeStr intValue]-1;
        int endIndex = [self.endTimeStr intValue]-1;
        [self.timeView.pickView selectRow:startIndex inComponent:0 animated:YES];
        [self.timeView.pickView selectRow:endIndex inComponent:1 animated:YES];
        [self.view addSubview:self.timeView];
    }
}
#pragma mark - Pick view delegate
//实现datasouce协议必须实现的方法，此方法用于返回选择器格式(起始时间，结束时间共计2个)
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 2;
}
//实现datasouce协议必须实现的方法，此方法用于返回某个选择器的选择个数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return self.timeArr.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (component == 0) {
        return [self.timeArr objectAtIndex:row];
    }else{
        return [self.timeArr objectAtIndex:row];
    }
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component==0)
    {
        NSLog(@"%@",[self.timeArr objectAtIndex:row]);
        self.startTimeStr = [self.timeArr objectAtIndex:row];
        self.timeView.titleLab.text = [NSString stringWithFormat:@"每日%@:00-次日%@:00",self.startTimeStr,self.endTimeStr];
    }
    else if(component==1)
    {
        NSLog(@"%@",[self.timeArr objectAtIndex:row]);
        self.endTimeStr = [self.timeArr objectAtIndex:row];
        self.timeView.titleLab.text = [NSString stringWithFormat:@"每日%@:00-次日%@:00",self.startTimeStr,self.endTimeStr];
        
    }
}
- (void)submitTime:(NSNotification *)notification {
    self.installTimeCell.startTimeLab.text = [NSString stringWithFormat:@"%@:00",self.startTimeStr];
    self.installTimeCell.endTimeLab.text = [NSString stringWithFormat:@"%@:00",self.endTimeStr];
    self.timeView.hidden  = YES;
    [self.tableView reloadData];
}
- (void)cancelTime:(NSNotification *)notification {
    self.timeView.hidden = YES;
}
-(void)quitClick{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:kAccoutInfo_Default];
    [defaults synchronize];
    kAccountObject  = [PublicObject getAccoutInfoDefault];
    [self showHUDViewTitle:@"退出成功" info:@"" andCodes:^{
        
    }];
    [self dismissViewControllerAnimated:YES completion:^{}];
//    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    [appDelegate.window.rootViewController.tabBarController setSelectedIndex:4];
}
@end
