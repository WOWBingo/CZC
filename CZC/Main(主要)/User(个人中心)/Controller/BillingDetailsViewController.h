//
//  BillingDetailsViewController.h
//  CZC
//
//  Created by 张浩 on 15/8/27.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHPickView.h"

@interface BillingDetailsViewController : PublicViewController<UITableViewDataSource,UITableViewDelegate,ZHPickViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UIButton *yearBtn;
@property (weak, nonatomic) IBOutlet UIButton *monthBtn;

@property (weak, nonatomic) IBOutlet UILabel *expendTitleLab;
@property (weak, nonatomic) IBOutlet UILabel *incomeTitleLab;
@property (weak, nonatomic) IBOutlet UILabel *expendLab;
@property (weak, nonatomic) IBOutlet UILabel *incomeLab;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

//pickView
@property(nonatomic,strong)ZHPickView *pickview;
@property(nonatomic,strong)NSIndexPath *indexPath;
@property (nonatomic,strong)NSString *dateStr;

- (IBAction)chooseTimeClick:(id)sender;
@end
