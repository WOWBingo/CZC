//
//  RechargeView.h
//  CZC
//
//  Created by 张浩 on 15/8/30.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol RechargeViewDelegate
-(void)changeRecharge:(NSInteger)btnTag;
@end
@interface RechargeView : UIView
@property (weak, nonatomic) IBOutlet UIButton *zfbBtn;
@property (weak, nonatomic) IBOutlet UIButton *zfbImgBtn;
@property (weak, nonatomic) IBOutlet UIButton *ylBtn;
@property (weak, nonatomic) IBOutlet UIButton *ylImgBtn;
@property (nonatomic,assign)id <RechargeViewDelegate>delegate;

@property (nonatomic) int chooseIndex;//保存选中的哪一个
- (IBAction)chooseZfbClick:(id)sender;
- (IBAction)chooseYlClick:(id)sender;
@end
