//
//  PointsBalanceViewController.m
//  CZC
//
//  Created by 张浩 on 15/8/30.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "PointsBalanceViewController.h"
#import "AccountBalanceTableViewCell.h"
#import "PotintsDetailsViewController.h"

@interface PointsBalanceViewController ()

@end

@implementation PointsBalanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"积分余额";
    //tableView多余不显示
    self.tablewView.tableFooterView = [[UIView alloc]init];
  //  [self getUserInfo];
}
//#pragma mark - 20.用户信息
//-(void)getUserInfo{
//    //从缓存登录数据中获取用户 MemLoginID
//    //
//    NSString *params = @"a465788";
//    [CZCService GETmethod:kAccountInfo_URL andParameters:params andHandle:^(NSDictionary *myresult) {
//        if (myresult) {
//            NSDictionary *dic = [myresult objectForKey:@"AccoutInfo"];
//            self.object = [AccoutObject objectWithKeyValues:dic];
//            NSLog(@"20.用户信息 ------%@",self.object);
//            [self.tablewView reloadData];
//        }
//        else{
//            NSLog(@"失败");
//        }
//    }];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma tableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"AccountBalanceTableViewCell";
    AccountBalanceTableViewCell *cell = (AccountBalanceTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:CellIdentifier owner:self options:nil];
        cell = (AccountBalanceTableViewCell *)[nibArray objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    switch (indexPath.row) {
        case 0:
        {
            cell.titleLab.text = @"积分余额";
            cell.infoLab.hidden = NO;
            cell.infoLab.text = [NSString stringWithFormat:@"%ld",(long)kAccountObject.score];
        }
            break;
        case 1:
        {
            cell.titleLab.text = @"积分明细";
            cell.infoLab.hidden = YES;
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
            PotintsDetailsViewController *pointsDetailsVC = [[PotintsDetailsViewController alloc]initWithNibName:@"PotintsDetailsViewController" bundle:nil];
            [self.navigationController pushViewController:pointsDetailsVC animated:YES];
        }
            break;
        default:
            break;
    }
}


@end
