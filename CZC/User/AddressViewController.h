//
//  AddressViewController.h
//  CZC
//
//  Created by 张浩 on 15/7/16.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressViewController : PublicViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSMutableArray *addressArr;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
