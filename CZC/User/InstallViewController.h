//
//  InstallViewController.h
//  CZC
//
//  Created by 张浩 on 15/7/22.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeView.h"
@interface InstallViewController : PublicViewController<UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong)UISwitch *newsSwitch;
@property (nonatomic,strong)UISwitch *logisticsSwitch;
@property (nonatomic,strong)UISwitch *promotionSwitch;
@property (nonatomic,strong)UISwitch *systemSwitch;
@property (nonatomic,strong)UILabel *timeLab;

@property (nonatomic,strong) NSArray *timeArr;
@end
