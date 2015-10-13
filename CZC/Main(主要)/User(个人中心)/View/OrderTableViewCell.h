//
//  OrderDetailsTableViewCell.h
//  CZC
//
//  Created by 张浩 on 15/8/16.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol OrderTableViewCellDelegate
-(void)goEvaluateVC:(int)orderIndex andBtn:(UIButton *)btn;
@end
@interface OrderTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *infolab;
@property (weak, nonatomic) IBOutlet UILabel *otherInfoLab;
@property (weak, nonatomic) IBOutlet UILabel *orderStatusLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UIButton *evaluateBtn;
@property (nonatomic,assign)id <OrderTableViewCellDelegate>delegate;
@property (nonatomic) int orderIndex;
- (IBAction)evaluateClick:(id)sender;
@end
