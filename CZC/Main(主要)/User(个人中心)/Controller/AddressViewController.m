//
//  AddressViewController.m
//  CZC
//
//  Created by 张浩 on 15/7/16.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "AddressViewController.h"
#import "AddressTableViewCell.h"
#import "EditAddressViewController.h"
#import "AddressObject.h"
@interface AddressViewController ()

@end

@implementation AddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"地址管理";
    //数组初始化
    self.addressArr = [[NSMutableArray alloc]init];
//    _tableView.rowHeight = UITableViewAutomaticDimension;
//    _tableView.estimatedRowHeight = SCREEN_WIDTH;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];

    [self getAddress];
}
-(void)getAddress{
#pragma mark - 18.收货地址列表
    /** 18.收货地址列表 http://app.czctgw.com/api/address/a465788 */
        //NSString *params = @"a465788";
        [CZCService GETmethod:kAddressList_URL andParameters:kAccountObject.memLoginID andHandle:^(NSDictionary *myresult) {
            if (myresult) {
                NSArray *dataArr = [myresult objectForKey:@"AddressList"];
                NSArray *list = [AddressObject objectArrayWithKeyValuesArray:dataArr];
                NSLog(@"18.收货地址列表 ------%@",list);
                self.addressArr = [[NSMutableArray alloc]initWithArray:list];
                [self.tableView reloadData];
            }
            else{
                NSLog(@"失败");
            }
        }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.addressArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AddressTableViewCell";
    AddressTableViewCell *cell = (AddressTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:CellIdentifier owner:self options:nil];
        cell = (AddressTableViewCell *)[nibArray objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    cell.delegate = self;
    cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //划线
    [PublicObject drawHorizontalLineOnView:cell andX:8 andY:cell.addressLab.frame.origin.y+cell.addressLab.frame.size.height+8 andWidth:SCREEN_WIDTH-16 andColor:[UIColor groupTableViewBackgroundColor]];
    //加载数据
    AddressObject *addressObj = [self.addressArr objectAtIndex:indexPath.row];
    cell.addressObj = addressObj;
    //姓名
    cell.nameLab.text = addressObj.name;
    //电话
    cell.telLab.text = addressObj.mobile;
    //地址
    cell.addressLab.text = addressObj.address;
    //获取是否默认地址
    NSLog(@"%ld",(long)addressObj.isDefault);
    if (addressObj.isDefault == 1) {//是默认地址
        [cell.defaultImgBtn setImage:[UIImage imageNamed:@"chooseYes.png"] forState:UIControlStateNormal];
    }else{
        [cell.defaultImgBtn setImage:[UIImage imageNamed:@"chooseNo.png"] forState:UIControlStateNormal];
    }
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    if (IS_IOS8_OR_ABOVE) {
//        return UITableViewAutomaticDimension;
//    }else{
        return 120;
//    }
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    //    switch (indexPath.section) {
    
}
-(void)setDefaultAddress:(AddressObject *)addressObj{
#pragma mark - 18.设置默认收货地址
    /** 18.设置默认收货地址    http://app.czctgw.com//api/address/del/33e36e94-a2e2-4900-aa2a-58a65af5df91?t=2&MemLoginID=liuxing */
    NSString *melogin = @"liuxing";
    NSString *temp = [NSString stringWithFormat:@"MemLoginID=%@",melogin];
    NSString *params = [NSString stringWithFormat:@"%@?t=2&%@",addressObj.guid,temp];
    [CZCService GETmethod:kAddressDefaultDel_URL andParameters:params andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            NSNumber *temp = [myresult objectForKey:@"return"];
            NSString *status = [NSString stringWithFormat:@"%@",temp];
            NSLog(@"%@",status);
            if ([status isEqualToString:@"201"]) {
                NSLog(@"修改默认收货地址成功");
                [self getAddress];
            }else{
                NSLog(@"修改默认收货地址失败");
            }
        }
        else{
            NSLog(@"失败");
        }
    }];

}
-(void)pushToEditView:(AddressObject *)addressObj{
    EditAddressViewController *editAddressVC = [[EditAddressViewController alloc]initWithNibName:@"EditAddressViewController" bundle:nil];
    [self.navigationController pushViewController:editAddressVC animated:YES];
}
-(void)deleteAddress:(AddressObject *)addressObj{
#pragma mark - 18.删除收货地址
    /** 18.删除收货地址     http://app.czctgw.com//api/address/del/33e36e94-a2e2-4900-aa2a-58a65af5df91?t=1&MemLoginID=liuxing */
    NSString *melogin = @"liuxing";
    NSString *temp = [NSString stringWithFormat:@"MemLoginID=%@",melogin];
    NSString *params = [NSString stringWithFormat:@"%@?t=1&%@",addressObj.guid,temp];
    [CZCService GETmethod:kAddressDefaultDel_URL andParameters:params andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            NSNumber *temp = [myresult objectForKey:@"return"];
            NSString *status = [NSString stringWithFormat:@"%@",temp];
            NSLog(@"%@",status);
            if ([status isEqualToString:@"201"]) {
                NSLog(@"删除收货地址成功");
                [self getAddress];
            }else{
                NSLog(@"删除收货地址失败");
            }
        }
        else{
            NSLog(@"失败");
        }
    }];
}
@end
