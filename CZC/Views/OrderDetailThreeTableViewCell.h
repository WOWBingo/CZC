//
//  OrderDetailThreeTableViewCell.h
//  CZC
//
//  Created by 张浩 on 15/8/19.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderDetailThreeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *infoLab;
@property (weak, nonatomic) IBOutlet UILabel *otherInfoLab;
@property (weak, nonatomic) IBOutlet UILabel *moneyLab;
@property (weak, nonatomic) IBOutlet UILabel *numLab;
@property (weak, nonatomic) IBOutlet UIButton *refuBtn;
@property (weak, nonatomic) IBOutlet UILabel *freightLab;
@property (weak, nonatomic) IBOutlet UILabel *payForLab;
@property (weak, nonatomic) IBOutlet UIButton *telBtn;
@property (weak, nonatomic) IBOutlet UIButton *selerBtn;
- (IBAction)freightClick:(id)sender;
- (IBAction)telClick:(id)sender;
- (IBAction)selerClick:(id)sender;
@end
