//
//  AccountBalanceViewController.m
//  CZC
//
//  Created by 张浩 on 15/8/27.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "AccountBalanceViewController.h"
#import "AccountBalanceTableViewCell.h"
#import "BillingDetailsViewController.h"
#import "AccountRechargeViewController.h"
@interface AccountBalanceViewController ()

@end

@implementation AccountBalanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"账户余额";
    //tableView多余不显示
    self.tableView.tableFooterView = [[UIView alloc]init];
//    [self getUserInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//#pragma mark - 20.用户信息
//-(void)getUserInfo{
//    //从缓存登录数据中获取用户 MemLoginID
//   // NSString *params = @"a465788";
//    [CZCService GETmethod:kAccountInfo_URL andParameters:kAccountObject.memLoginID andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            NSDictionary *dic = [myresult objectForKey:@"AccoutInfo"];
//            self.object = [AccoutObject objectWithKeyValues:dic];
//            NSLog(@"20.用户信息 ------%@",self.object);
//            [self.tableView reloadData];
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
//}
#pragma tableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"AccountBalanceTableViewCell";
    AccountBalanceTableViewCell *cell = (AccountBalanceTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:CellIdentifier owner:self options:nil];
        cell = (AccountBalanceTableViewCell *)[nibArray objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    switch (indexPath.row) {
        case 0:
        {
            cell.titleLab.text = @"账户余额";
            cell.infoLab.hidden = NO;
            NSString *advancePayment = [NSString stringWithFormat:@"%f",kAccountObject.advancePayment];
            NSRange range = [advancePayment rangeOfString:@"."];
            NSInteger location = range.location;
            advancePayment = [advancePayment substringToIndex:location+3];
            cell.infoLab.text = [NSString stringWithFormat:@"%@",advancePayment];
        }
            break;
        case 1:
        {
            cell.titleLab.text = @"账单明细";
            cell.infoLab.hidden = YES;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
            break;
        case 2:
        {
            cell.titleLab.text = @"充值";
            cell.infoLab.hidden = YES;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
            break;
        default:
            break;
    }
    return cell;
}
#pragma tableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
//        case 0:
//            <#statements#>
//            break;
        case 1:{
            BillingDetailsViewController *billingDetailsVC = [[BillingDetailsViewController alloc]initWithNibName:@"BillingDetailsViewController" bundle:nil];
            [self.navigationController pushViewController:billingDetailsVC animated:YES];
        }
            break;
        case 2:{
            AccountRechargeViewController *accountRechargeVC = [[AccountRechargeViewController alloc]initWithNibName:@"AccountRechargeViewController" bundle:nil];
            [self.navigationController pushViewController:accountRechargeVC animated:YES];
        }
            break;
        default:
            break;
    }
}
@end
