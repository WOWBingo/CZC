//
//  OrderDetailsViewController.h
//  CZC
//
//  Created by 张浩 on 15/8/16.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LjjUISegmentedControl.h"
@interface OrderViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,LjjUISegmentedControlDelegate>

@property (strong, nonatomic)UITableView *tableView;

@property(nonatomic,strong)NSMutableArray *orderListArray;//所有订单的数组

@end
