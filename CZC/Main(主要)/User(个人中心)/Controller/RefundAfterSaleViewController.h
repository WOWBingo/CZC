//
//  RefundAfterSaleViewController.h
//  CZC
//
//  Created by 张浩 on 15/10/12.
//  Copyright © 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderFootView.h"

@interface RefundAfterSaleViewController : PublicViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *orderListArray;//所有订单的数组

@end
