//
//  AccountSecurityViewController.h
//  CZC
//
//  Created by 张浩 on 15/7/31.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountSecurityViewController : PublicViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
