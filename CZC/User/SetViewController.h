//
//  SetViewController.h
//  CZC
//
//  Created by 张浩 on 15/7/6.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccoutObject.h"
@interface SetViewController :PublicViewController <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) BOOL isHomePage;
@property (nonatomic,strong)AccoutObject *object;
@property(nonatomic)int proCollectNum;
@property(nonatomic)int shopCollectNum;
@end
