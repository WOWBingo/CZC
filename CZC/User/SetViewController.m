//
//  SetViewController.m
//  CZC
//
//  Created by 张浩 on 15/7/6.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "SetViewController.h"
#import "SetTitleTableViewCell.h"
#import "SetUpTableViewCell.h"
@interface SetViewController ()

@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置tableView的cel有内容时显示分割线，无内容时，不显示分割线
    self.tableView.tableFooterView = [[UIView alloc]init];
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
            return 4;
            break;
        case 2:
            return 3;
            break;
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier1 = @"SetTitleTableViewCell";
    static NSString *CellIdentifier2 = @"SetUpTableViewCell";
    SetTitleTableViewCell *cell1 = (SetTitleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
    SetUpTableViewCell *cell2 = (SetUpTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier2];

    switch (indexPath.section) {
        case 0:{
            if (cell1 == nil) {
                cell1 = [[SetTitleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1];
                [cell1 setSelectionStyle:UITableViewCellSelectionStyleNone];
            }
        }
            return cell1;
            break;
        case 1:{
            if (cell2 == nil) {
                cell2 = [[[NSBundle mainBundle]loadNibNamed:@"SetUpTableViewCell" owner:self options:nil]firstObject];
                [cell2 setSelectionStyle:UITableViewCellSelectionStyleNone];
            }
            if (indexPath.row == 0) {
                //账户余额
                [cell2.titleImg setImage:[UIImage imageNamed:@"mid_tb1"]];
                cell2.titileLab.text = @"账户余额";
                cell2.balanceLab.text = @"1900.00";
            }
            if (indexPath.row == 1){
                //积分余额
                [cell2.titleImg setImage:[UIImage imageNamed:@"mid_tb2"]];
                cell2.titileLab.text = @"积分余额";
                cell2.balanceLab.text = @"519";
            }
            if (indexPath.row == 2) {
                //积分充值
                [cell2.titleImg setImage:[UIImage imageNamed:@"mid_tb3"]];
                cell2.titileLab.text = @"积分充值";
                cell2.balanceLab.hidden = YES;
            }
            if (indexPath.row == 3) {
                //积分转账
                [cell2.titleImg setImage:[UIImage imageNamed:@"mid_tb4"]];
                cell2.titileLab.text = @"积分转账";
                cell2.balanceLab.hidden = YES;
            }
        }
            return cell2;
            break;
        case 2:{
            if (cell2 == nil) {
                cell2 = [[[NSBundle mainBundle]loadNibNamed:@"SetUpTableViewCell" owner:self options:nil]firstObject];
                [cell2 setSelectionStyle:UITableViewCellSelectionStyleNone];
            }
            if (indexPath.row == 0) {
                //订单明细
                [cell2.titleImg setImage:[UIImage imageNamed:@"mid_tb5"]];
                cell2.titileLab.text = @"订单明细";
                cell2.balanceLab.hidden = YES;
            }
            if (indexPath.row == 1){
                //地址管理
                [cell2.titleImg setImage:[UIImage imageNamed:@"mid_tb6"]];
                cell2.titileLab.text = @"地址管理";
                cell2.balanceLab.hidden = YES;
            }
            if (indexPath.row == 2) {
                //退款与售后
                [cell2.titleImg setImage:[UIImage imageNamed:@"mid_tb7"]];
                cell2.titileLab.text = @"退款/售后";
                cell2.balanceLab.hidden = YES;
            }
        }
            return cell2;
            break;
        default:
            break;
    }
    return cell1;
    return cell2;
    
}

//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    NSString *groupName = [[NSString alloc]init];
//    switch (section) {
//        case 1:
//            groupName = @"其他资料";
//            return groupName;
//            break;
//
//        default:
//            return nil;
//            break;
//    }
//
//}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.0001;
    }
    if (section == 1) {
        return 13;
    }
    else{
        return 23;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                return 160;
            }
            else{
                return  44;
            }
            break;
        case 1:
            return 44;
            break;
        case 2:
            return 44;
            break;
        default:
            return 44;
            break;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}

#pragma mark - Table view delegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"%ld",(long)indexPath.row);
//    switch (indexPath.section) {
//        case 0:
//            if(indexPath.row == 1){
//                ChangeUseInfoViewController *changeInfoVC = [[ChangeUseInfoViewController alloc]initWithNibName:@"ChangeUseInfoViewController" bundle:nil];
//                changeInfoVC.title = @"昵称";
//                changeInfoVC.infoStr = self.user.truename;
//                changeInfoVC.isTrueName = YES;
//                changeInfoVC.isSex = NO;
//                changeInfoVC.isAge = NO;
//                changeInfoVC.isTel = NO;
//                [self.navigationController pushViewController:changeInfoVC animated:YES];
//            }
//            break;
//        case 1:
//            if (indexPath.row == 0) {
//                ChangeUseInfoViewController *changeInfoVC = [[ChangeUseInfoViewController alloc]initWithNibName:@"ChangeUseInfoViewController" bundle:nil];
//                changeInfoVC.title = @"性别";
//                changeInfoVC.infoStr = self.user.sex;
//                changeInfoVC.isTrueName = NO;
//                changeInfoVC.isSex = YES;
//                changeInfoVC.isAge = NO;
//                changeInfoVC.isTel = NO;
//                [self.navigationController pushViewController:changeInfoVC animated:YES];
//            }
//            if (indexPath.row == 1) {
//                ChangeUseInfoViewController *changeInfoVC = [[ChangeUseInfoViewController alloc]initWithNibName:@"ChangeUseInfoViewController" bundle:nil];
//                changeInfoVC.title = @"年龄";
//                changeInfoVC.infoStr = [NSString stringWithFormat:@"%i",self.user.age];
//                changeInfoVC.isTrueName = NO;
//                changeInfoVC.isSex = NO;
//                changeInfoVC.isAge = YES;
//                changeInfoVC.isTel = NO;
//                [self.navigationController pushViewController:changeInfoVC animated:YES];
//            }
//            if (indexPath.row == 2) {
//                ChangeUseInfoViewController *changeInfoVC = [[ChangeUseInfoViewController alloc]initWithNibName:@"ChangeUseInfoViewController" bundle:nil];
//                changeInfoVC.title = @"电话";
//                changeInfoVC.infoStr = self.user.tel;
//                changeInfoVC.isTrueName = NO;
//                changeInfoVC.isSex = NO;
//                changeInfoVC.isAge = NO;
//                changeInfoVC.isTel = YES;
//                [self.navigationController pushViewController:changeInfoVC animated:YES];
//            }
//            break;
//        case 3:
//            if(indexPath.row == 0){
//                AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//                LoginViewController *loginVC = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
//                UINavigationController *loginNavi = [[UINavigationController alloc] initWithRootViewController:loginVC];
//
//
//                appDelegate.window.rootViewController = loginNavi;
//
//            }
//            break;
//        default:
//            break;
//    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
