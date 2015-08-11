//
//  ShopCollectViewController.h
//  CZC
//
//  Created by 周德艺 on 15/7/20.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "PublicViewController.h"
#import "ShopCollectTableViewCell.h"
@interface ShopCollectViewController : PublicViewController<UITableViewDelegate,UITableViewDataSource,ShopCollectCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
