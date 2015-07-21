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
#import "UserInfoViewController.h"
#import "ProductCollectViewController.h"
#import "AddressViewController.h"
#import "ShopCollectViewController.h"

@interface SetViewController ()

@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置tableView的cel有内容时显示分割线，无内容时，不显示分割线
    self.tableView.tableFooterView = [[UIView alloc]init];
}
-(void)viewWillAppear:(BOOL)animated{
    self.parentViewController.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.hidden = YES;
}
-(void)viewDidAppear:(BOOL)animated{
    self.parentViewController.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    self.parentViewController.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = NO;
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
                NSBundle *bundle = [NSBundle mainBundle];
                NSArray *nibArray = [bundle loadNibNamed:CellIdentifier1 owner:self options:nil];
                cell1 = (SetTitleTableViewCell *)[nibArray objectAtIndex:0];
                [cell1 setSelectionStyle:UITableViewCellSelectionStyleNone];
                [cell1.setBtn addTarget:self action:@selector(setVC:) forControlEvents:UIControlEventTouchUpInside];
                [cell1.popBtn addTarget:self action:@selector(popVC:) forControlEvents:UIControlEventTouchUpInside];
                [cell1.userInfoBtn addTarget:self action:@selector(userInfoVC:) forControlEvents:UIControlEventTouchUpInside];
                [cell1.proCollectBtn addTarget:self action:@selector(productCollectVC:) forControlEvents:UIControlEventTouchUpInside];
                [cell1.shopCollectBtn addTarget:self action:@selector(shopCollectVC:) forControlEvents:UIControlEventTouchUpInside];
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

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.001;
    }else{
        return 20;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 160;
    }else{
        return 44;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    NSLog(@"%ld",(long)indexPath.section);
    switch (indexPath.section) {
        case 0:
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
            break;
        case 2:
            if(indexPath.row == 1){
                AddressViewController *addressVC = [[AddressViewController alloc]initWithNibName:@"AddressViewController" bundle:nil];
                self.navigationController.navigationBarHidden = NO;
                [self.navigationController pushViewController:addressVC animated:YES];

            }
            break;
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)popVC:(id)sender{
    
}
- (IBAction)setVC:(id)sender{
    
}
- (IBAction)userInfoVC:(id)sender{
    UserInfoViewController *newVC = [[UserInfoViewController alloc]initWithNibName:@"UserInfoViewController" bundle:nil];
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController pushViewController:newVC animated:YES];
}
- (IBAction)productCollectVC:(id)sender{
    ProductCollectViewController *newVC = [[ProductCollectViewController alloc]initWithNibName:@"ProductCollectViewController" bundle:nil];
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController pushViewController:newVC animated:YES];
    
}
- (IBAction)shopCollectVC:(id)sender{
    ShopCollectViewController *newVC = [[ShopCollectViewController alloc]initWithNibName:@"ShopCollectViewController" bundle:nil];
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController pushViewController:newVC animated:YES];
}

@end
