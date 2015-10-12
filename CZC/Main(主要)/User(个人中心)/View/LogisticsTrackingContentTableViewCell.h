//
//  LogisticsTrackingContentTableViewCell.h
//  CZC
//
//  Created by 张浩 on 15/10/12.
//  Copyright © 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogisticsTrackingContentTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *circleImg;
@property (weak, nonatomic) IBOutlet UIImageView *barImg;
@property (weak, nonatomic) IBOutlet UILabel *regionLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@end
