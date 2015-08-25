//
//  PersonNewsViewController.h
//  CZC
//
//  Created by 张浩 on 15/7/21.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonNewsTableViewCell.h"
@interface PersonNewsViewController : PublicViewController<UITableViewDelegate,UITableViewDataSource,PersonNewsCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *newsArr;
@property (nonatomic)int pageIndex;
@property (nonatomic)int allPageNum;
@end
