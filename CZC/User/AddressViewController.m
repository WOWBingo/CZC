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
    static NSString *CellIdentifier = @"AddressTableViewCell";
    AddressTableViewCell *cell = (AddressTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:CellIdentifier owner:self options:nil];
        cell = (AddressTableViewCell *)[nibArray objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    cell.delegate = self;
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    if (IS_IOS8_OR_ABOVE) {
//        return UITableViewAutomaticDimension;
//    }else{
        return SCREEN_WIDTH/3-10;
//    }
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    //    switch (indexPath.section) {
    
}
-(void)setDefaultAddress{
}
-(void)pushToEditView{
    EditAddressViewController *editAddressVC = [[EditAddressViewController alloc]initWithNibName:@"EditAddressViewController" bundle:nil];
    [self.navigationController pushViewController:editAddressVC animated:YES];
}
-(void)deleteAddress{
}
@end
