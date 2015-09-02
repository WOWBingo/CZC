//
//  PotintsDetailsViewController.h
//  CZC
//
//  Created by 张浩 on 15/8/30.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PotintsDetailsViewController : PublicViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) int typeTag;
@property(nonatomic,strong)NSMutableArray *typeArray;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UIImageView *titleImg;
@end
