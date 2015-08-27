//
//  AccountSecurityViewController.m
//  CZC
//
//  Created by 张浩 on 15/7/31.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "AccountSecurityViewController.h"
#import "AccountSecurityTableViewCell.h"
#import "ChangePwdViewController.h"
#import "ChangePhoneValidateOneViewController.h"
#import "ChangePayPwdOneViewController.h"
@interface AccountSecurityViewController ()

@end

@implementation AccountSecurityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"账户安全";
    //设置tableView的cel有内容时显示分割线，无内容时，不显示分割线
    self.tableView.tableFooterView = [[UIView alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier1 = @"cellId";
    static NSString *CellIdentifier2 = @"AccountSecurityTableViewCell";
    UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1];
    AccountSecurityTableViewCell *cell2 = (AccountSecurityTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier2];
    switch (indexPath.row) {
        case 0:
        {
            if (cell2 == nil) {
                NSBundle *bundle = [NSBundle mainBundle];
                NSArray *nibArray = [bundle loadNibNamed:CellIdentifier2 owner:self options:nil];
                cell2 = (AccountSecurityTableViewCell *)[nibArray objectAtIndex:0];
                [cell2 setSelectionStyle:UITableViewCellSelectionStyleNone];
            }
            cell2.oneLab.text = @"登录密码";
            cell2.twoLab.text = @"*建议您定期修改密码以保护战虎安全";
            cell2.otherLab.hidden = YES;
            cell2.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell2;
        }
            break;
        case 1:
        {
            if (cell2 == nil) {
                NSBundle *bundle = [NSBundle mainBundle];
                NSArray *nibArray = [bundle loadNibNamed:CellIdentifier2 owner:self options:nil];
                cell2 = (AccountSecurityTableViewCell *)[nibArray objectAtIndex:0];
                [cell2 setSelectionStyle:UITableViewCellSelectionStyleNone];
            }
            cell2.oneLab.text = @"手机验证";
            cell2.twoLab.text = @"*若您的验证手机已丢失或停用请立即修改更换";
            cell2.otherLab.text = @"156***8532";
            cell2.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell2;
        }
            break;
        case 2:
        {
            if (cell1 == nil) {
                cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier1];
                [cell1.textLabel setTextColor:[UIColor blackColor]];
                cell1.textLabel.font = [UIFont systemFontOfSize:14];
            }
            cell1.textLabel.text = @"支付密码";
            int labW = SCREEN_WIDTH/3.5;
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-labW-30, 8, labW, 21)];
            lab.font = [UIFont systemFontOfSize:14];
            lab.text = @"安全程度:高";
            [cell1 addSubview:lab];
            cell1.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            return cell1;
        }
            break;
        default:
            break;
    }
    return cell1;
    return cell2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    switch (indexPath.row) {
        case 0:{
            ChangePwdViewController *changePwdVC = [[ChangePwdViewController alloc]initWithNibName:@"ChangePwdViewController" bundle:nil];
            [self.navigationController pushViewController:changePwdVC animated:YES];
        }
            break;
        case 1:{
            ChangePhoneValidateOneViewController *changePhoneVC = [[ChangePhoneValidateOneViewController alloc]initWithNibName:@"ChangePhoneValidateOneViewController" bundle:nil];
            [self.navigationController pushViewController:changePhoneVC animated:YES];
        }
            break;
        case 2:{
            ChangePayPwdOneViewController *changePayPwdVC = [[ChangePayPwdOneViewController alloc]initWithNibName:@"ChangePayPwdOneViewController" bundle:nil];
            [self.navigationController pushViewController:changePayPwdVC animated:YES];
        }
            break;
        default:
            break;
    }
    
}

@end
