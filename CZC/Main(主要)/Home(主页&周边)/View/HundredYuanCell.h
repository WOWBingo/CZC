//
//  HundredYuanCell.h
//  CZC
//
//  Created by 周德艺 on 15/7/7.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HundredYuanCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *showView;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *topRightBtn;
@property (weak, nonatomic) IBOutlet UIButton *bottomMidBtn;
@property (weak, nonatomic) IBOutlet UIButton *bottomRightBtn;
- (IBAction)getMore:(id)sender;
- (IBAction)productInfo:(id)sender;

@end
