//
//  SetTitleTableViewCell.h
//  CZC
//
//  Created by 张浩 on 15/7/7.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetTitleTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *popBtn;
@property (weak, nonatomic) IBOutlet UIButton *popNewsBtn;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *vipTypeLab;
@property (weak, nonatomic) IBOutlet UILabel *vipNumLab;
@property (weak, nonatomic) IBOutlet UILabel *proCollectNumLab;
@property (weak, nonatomic) IBOutlet UILabel *shopCollectNumLab;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIButton *userInfoBtn;
@property (weak, nonatomic) IBOutlet UIButton *proCollectBtn;
@property (weak, nonatomic) IBOutlet UIButton *shopCollectBtn;
@property (weak, nonatomic) IBOutlet UIButton *setBtn;

@end
