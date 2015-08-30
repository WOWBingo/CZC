//
//  BillingReportsTableViewCell.h
//  CZC
//
//  Created by 张浩 on 15/8/30.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BillingReportsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *proImgHorizontal;
@property (weak, nonatomic) IBOutlet UIImageView *titleImg;
@property (weak, nonatomic) IBOutlet UIImageView *progressImg;
@property (weak, nonatomic) IBOutlet UILabel *infoLab;
@property (weak, nonatomic) IBOutlet UILabel *amountLab;

@end
