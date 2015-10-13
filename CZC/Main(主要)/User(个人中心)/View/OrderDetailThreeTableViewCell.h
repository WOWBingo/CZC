//
//  OrderDetailThreeTableViewCell.h
//  CZC
//
//  Created by 张浩 on 15/8/19.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol OrderDetailThreeTableViewCellDelegate
-(void)goEvaluateVC:(int)orderIndex andBtn:(UIButton *)btn;
@end
@interface OrderDetailThreeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *infoLab;
@property (weak, nonatomic) IBOutlet UILabel *otherInfoLab;
@property (weak, nonatomic) IBOutlet UILabel *moneyLab;
@property (weak, nonatomic) IBOutlet UILabel *numLab;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (nonatomic,assign)id <OrderDetailThreeTableViewCellDelegate>delegate;
@property (nonatomic) int orderIndex;
- (IBAction)btnClick:(id)sender;
@end
