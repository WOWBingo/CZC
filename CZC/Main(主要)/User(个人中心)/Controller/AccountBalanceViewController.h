//
//  AccountBalanceViewController.h
//  CZC
//
//  Created by 张浩 on 15/8/27.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface AccountBalanceViewController : PublicViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
//@property (nonatomic,strong)AccoutObject *object;

@end
