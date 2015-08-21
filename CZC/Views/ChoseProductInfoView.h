//
//  ChoseProductInfoView.h
//  CZC
//
//  Created by 周德艺 on 15/8/20.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChoseProductInfoView : UIView<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UIView *imgBackView;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *stockLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)disView:(id)sender;
- (IBAction)define:(id)sender;

+(ChoseProductInfoView *)instanceView;

@property (strong, nonatomic) void (^dismissView)();

@end
