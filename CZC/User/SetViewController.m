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
#import "NewsViewController.h"
#import "InstallViewController.h"
#import "OrderViewController.h"
#import "CollectProductObject.h"
#import "CollectShopObject.h"
@interface SetViewController ()

@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置tableView的cel有内容时显示分割线，无内容时，不显示分割线
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self getUserInfo];
    [self getProCollectNum];
    [self getshopCollectNum];
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

#pragma mark - 20.用户信息
-(void)getUserInfo{
    //从缓存登录数据中获取用户 MemLoginID
    //
        NSString *params = @"a465788";
        [CZCService GETmethod:kAccountInfo_URL andParameters:params andHandle:^(NSDictionary *myresult) {
            if (myresult) {
                NSDictionary *dic = [myresult objectForKey:@"AccoutInfo"];
                self.object = [AccoutObject objectWithKeyValues:dic];
                NSLog(@"20.用户信息 ------%@",self.object);
                [self.tableView reloadData];
            }
            else{
                NSLog(@"失败");
            }
        }];
}
#pragma mark - 23.产品收藏列表
-(void)getProCollectNum{
/** 23.产品收藏列表 http://app.czctgw.com/api/CollectList?MemLoginID=zh010101&pageIndex=1&pageCount=5 */
    NSString *params = @"MemLoginID=zh010101&pageIndex=1&pageCount=5 ";
    [CZCService GETmethod:kProCollectList_URL andParameters:params andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            NSInteger count = [[myresult objectForKey:@"Count"]integerValue];
//            NSArray *dataArr = [myresult objectForKey:@"Data"];
//            NSArray *list = [CollectProductObject objectArrayWithKeyValuesArray:dataArr];
//            NSLog(@"23.产品收藏列表 ------%@",list);
            self.proCollectNum = (int)count;
            [self.tableView reloadData];
        }
        else{
            NSLog(@"失败");
        }
    }];
}
-(void)getshopCollectNum{
#pragma mark - 25.店铺收藏列表
/** 25.店铺收藏列表 http://app.czctgw.com/api/ShopCollectList?MemLoginID=s1886&pageIndex=1&pageCount=5 */
    NSString *params = @"MemLoginID=s1886&pageIndex=1&pageCount=5";
    [CZCService GETmethod:kShopCollectList_URL andParameters:params andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            NSInteger count = [[myresult objectForKey:@"Count"]integerValue];
//            NSArray *dataArr = [myresult objectForKey:@"Data"];
//            NSArray *list = [CollectShopObject objectArrayWithKeyValuesArray:dataArr];
//            NSLog(@"25.店铺收藏列表  ------%@",list);
            self.shopCollectNum = (int)count;
            [self.tableView reloadData];
        }
        else{
            NSLog(@"失败");
        }
    }];
}

#pragma mark - tableView
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
            //加载数据
            cell1.vipTypeLab.font = [UIFont systemFontOfSize:12];
            cell1.vipTypeLab.text = [NSString stringWithFormat:@"%ld",(long)self.object.memberRank];
            cell1.vipNumLab.hidden = YES;
            cell1.nameLab.text = [NSString stringWithFormat:@"%@",self.object.realName];
            cell1.proCollectNumLab.text = [NSString stringWithFormat:@"%d",self.proCollectNum];
            cell1.shopCollectNumLab.text = [NSString stringWithFormat:@"%d",self.shopCollectNum];
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
                NSString *advancePayment = [NSString stringWithFormat:@"%f",self.object.advancePayment];
                NSRange range = [advancePayment rangeOfString:@"."];
                NSInteger location = range.location;
                advancePayment = [advancePayment substringToIndex:location+3];
                cell2.balanceLab.text = [NSString stringWithFormat:@"%@",advancePayment];
            }
            if (indexPath.row == 1){
                //积分余额
                [cell2.titleImg setImage:[UIImage imageNamed:@"mid_tb2"]];
                cell2.titileLab.text = @"积分余额";
                cell2.balanceLab.text = [NSString stringWithFormat:@"%ld",(long)self.object.score];
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
            if(indexPath.row == 0){
                OrderViewController *orderDetailsVC = [[OrderViewController alloc]initWithNibName:@"OrderViewController" bundle:nil];
                self.navigationController.navigationBarHidden = NO;
                [self.navigationController pushViewController:orderDetailsVC animated:YES];
            }
            else if(indexPath.row == 1){
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
    NewsViewController *newsVC = [[NewsViewController alloc]initWithNibName:@"NewsViewController" bundle:nil];
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController pushViewController:newsVC animated:YES];

}
- (IBAction)setVC:(id)sender{
    InstallViewController *installVC = [[InstallViewController alloc]initWithNibName:@"InstallViewController" bundle:nil];
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController pushViewController:installVC animated:YES];
}
- (IBAction)userInfoVC:(id)sender{
    UserInfoViewController *userVC = [[UserInfoViewController alloc]initWithNibName:@"UserInfoViewController" bundle:nil];
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController pushViewController:userVC animated:YES];
}
- (IBAction)productCollectVC:(id)sender{
    ProductCollectViewController *proVC = [[ProductCollectViewController alloc]initWithNibName:@"ProductCollectViewController" bundle:nil];
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController pushViewController:proVC animated:YES];
    
}
- (IBAction)shopCollectVC:(id)sender{
    ShopCollectViewController *shopVC = [[ShopCollectViewController alloc]initWithNibName:@"ShopCollectViewController" bundle:nil];
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController pushViewController:shopVC animated:YES];
}

@end
