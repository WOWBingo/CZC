//
//  PotintsDetailsViewController.m
//  CZC
//
//  Created by 张浩 on 15/8/30.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "PotintsDetailsViewController.h"
#import "PotintsDetailsTableViewCell.h"
@interface PotintsDetailsViewController ()

@end

@implementation PotintsDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"积分明细";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma tableviewdatesource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"PotintsDetailsTableViewCell";
    PotintsDetailsTableViewCell *cell = (PotintsDetailsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:CellIdentifier owner:self options:nil];
        cell = (PotintsDetailsTableViewCell *)[nibArray objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
#pragma tableviewdelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
