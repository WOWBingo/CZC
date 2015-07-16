//
//  PayDeliverTableViewCell.h
//  CZC
//
//  Created by 张浩 on 15/7/16.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayDeliverTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *nomalBtn;
@property (weak, nonatomic) IBOutlet UIButton *personBtn;
- (IBAction)chooseNormalClick:(id)sender;
- (IBAction)choosePersonBtn:(id)sender;
@end
