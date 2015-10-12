//
//  LogisticsTrackingViewController.h
//  CZC
//
//  Created by 张浩 on 15/10/12.
//  Copyright © 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogisticsTrackingViewController : PublicViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *logisticsArr;
@end
