//
//  ShopTableViewController.h
//  CZC
//
//  Created by 周德艺 on 15/7/15.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "PublicViewController.h"

@interface ShopTableViewController : PublicViewController<UITableViewDelegate,UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView      *tableHeadView;
@property (weak, nonatomic) IBOutlet UIButton    *integrateBtn;
@property (weak, nonatomic) IBOutlet UIButton    *salesBtn;
@property (weak, nonatomic) IBOutlet UIButton    *commentBtn;
@property (weak, nonatomic) IBOutlet UIButton    *priceBtn;

@property (nonatomic, strong) NSMutableArray *shopList;/**< 店铺数据 */

@end
