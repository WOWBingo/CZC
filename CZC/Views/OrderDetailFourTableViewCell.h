//
//  OrderDetailFourTableViewCell.h
//  CZC
//
//  Created by 张浩 on 15/8/19.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderDetailFourTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *orderIdLab;
@property (weak, nonatomic) IBOutlet UILabel *tradeIdLab;
@property (weak, nonatomic) IBOutlet UILabel *creatTimeLab;
@property (weak, nonatomic) IBOutlet UILabel *payTimeLab;
@property (weak, nonatomic) IBOutlet UILabel *deliveryTimeLab;
@end
