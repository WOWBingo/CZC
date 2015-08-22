//
//  NewsViewController.m
//  CZC
//
//  Created by 张浩 on 15/7/21.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "NewsViewController.h"
#import "PersonNewsViewController.h"
#import "LogisticsAssistantViewController.h"
#import "DiscountPromotionViewController.h"
@interface NewsViewController ()

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息盒子";
    //设置导航栏按钮
    
    UIButton *setBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    [setBtn setImage:[UIImage imageNamed:@"head_tb1"] forState:UIControlStateNormal];
    [setBtn addTarget:self action:@selector(setClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:setBtn];

    
    self.imageArr = [[NSArray alloc]initWithObjects:@"new_1",@"new_2",@"new_3",@"new_4", nil];
    self.titleArr = [[NSArray alloc]initWithObjects:@"个人消息",@"物流助手",@"优惠促销",@"签到", nil];
    //设置tableView的cel有内容时显示分割线，无内容时，不显示分割线
    self.tableView.tableFooterView = [[UIView alloc]init];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
        cell.backgroundColor = [UIColor clearColor];
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell.textLabel setTextColor:[UIColor blackColor]];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
    }
    NSString *imageStr = [self.imageArr objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:imageStr];
    cell.textLabel.text = [self.titleArr objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    switch (indexPath.row) {
        case 0:{
            PersonNewsViewController *personNewsVC = [[PersonNewsViewController alloc]initWithNibName:@"PersonNewsViewController" bundle:nil];
            [self.navigationController pushViewController:personNewsVC animated:YES];
        }
            break;
        case 1:{
            LogisticsAssistantViewController *logisticsAssistantVC = [[LogisticsAssistantViewController alloc]initWithNibName:@"LogisticsAssistantViewController" bundle:nil];
            [self.navigationController pushViewController:logisticsAssistantVC animated:YES];
        }
            break;
        case 2:{
            DiscountPromotionViewController *DiscountPromotionVC = [[DiscountPromotionViewController alloc]initWithNibName:@"DiscountPromotionViewController" bundle:nil];
            [self.navigationController pushViewController:DiscountPromotionVC animated:YES];
        }
            break;
        default:
            break;
    }
    //    switch (indexPath.section) {
    
}

@end
