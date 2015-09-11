//
//  OrderDetailViewController.h
//  CZC
//
//  Created by 张浩 on 15/8/19.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderObject.h"
#import "OrderProductObject.h"
#import "OrderDetailHeadView.h"
#import "OrderDetailFootView.h"
@interface OrderDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong)OrderObject *orderObj;
@property(nonatomic,strong)OrderDetailHeadView *headView;
@property(nonatomic,strong)OrderDetailFootView *footView;

@end
