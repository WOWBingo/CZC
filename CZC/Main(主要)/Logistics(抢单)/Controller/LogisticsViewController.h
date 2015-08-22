//
//  LogisticsViewController.h
//  CZC
//
//  Created by 张浩 on 15/7/15.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogisticsViewController : PublicViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic) BOOL isHomePage;

@property (weak, nonatomic) IBOutlet UIButton *checkLabBtn;
@property (weak, nonatomic) IBOutlet UIButton *historyLabBtn;
@property (weak, nonatomic) IBOutlet UIImageView *checkTriangleImg;
@property (weak, nonatomic) IBOutlet UIImageView *historyTriangleImg;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UIButton *endBtn;
@property (weak, nonatomic) IBOutlet UIButton *placeBtn;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *checkView;

@property (nonatomic,strong)NSMutableArray *historyArr;

- (IBAction)seachClick:(id)sender;
- (IBAction)checkClick:(id)sender;
- (IBAction)historyClick:(id)sender;
@end
