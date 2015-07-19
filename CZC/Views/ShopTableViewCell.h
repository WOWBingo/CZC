//
//  ShopTableViewCell.h
//  CZC
//
//  Created by 周德艺 on 15/7/16.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *boxView;
@property (weak, nonatomic) IBOutlet UIImageView *shopImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *discountLable;
@property (weak, nonatomic) IBOutlet UIButton *collectBtn;
@property (weak, nonatomic) IBOutlet UILabel *distanceLable;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
- (IBAction)collect:(id)sender;
- (IBAction)deleteShop:(id)sender;

@end
