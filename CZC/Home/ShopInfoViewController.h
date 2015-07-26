//
//  ShopInfoViewController.h
//  CZC
//
//  Created by 周德艺 on 15/7/21.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "PublicViewController.h"
#import "LGtitleBarView.h"

@interface ShopInfoViewController : PublicViewController<UITableViewDataSource,UITableViewDelegate,LGtitleBarViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *centerView;
@property (weak, nonatomic) IBOutlet UILabel *shopNameLab;
@property (weak, nonatomic) IBOutlet UILabel *locationLab;
@property (weak, nonatomic) IBOutlet UILabel *distanceLab;
@property (weak, nonatomic) IBOutlet UIButton *telBtn;

- (IBAction)callShop:(id)sender;

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) LGtitleBarView *titleBar;
@property (nonatomic) CGRect oldFrame;

@end
