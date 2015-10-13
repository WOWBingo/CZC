//
//  EvaluateViewController.h
//  CZC
//
//  Created by 张浩 on 15/10/9.
//  Copyright © 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderObject.h"
#import "OrderProductObject.h"
@interface EvaluateViewController : PublicViewController<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *orderImg;
@property (weak, nonatomic) IBOutlet UILabel *orderInfoLab;
@property (weak, nonatomic) IBOutlet UILabel *orderOtherInfoLab;
@property (weak, nonatomic) IBOutlet UIButton *proEvaluateBtn1;
@property (weak, nonatomic) IBOutlet UIButton *proEvaluateBtn2;
@property (weak, nonatomic) IBOutlet UIButton *proEvaluateBtn3;
@property (weak, nonatomic) IBOutlet UIButton *proEvaluateBtn4;
@property (weak, nonatomic) IBOutlet UIButton *proEvaluateBtn5;
@property (weak, nonatomic) IBOutlet UITextView *evaluateTextView;
@property (weak, nonatomic) IBOutlet UIButton *photoBtn;
@property (weak, nonatomic) IBOutlet UIButton *fhBtn1;
@property (weak, nonatomic) IBOutlet UIButton *fhBtn2;
@property (weak, nonatomic) IBOutlet UIButton *fhBtn3;
@property (weak, nonatomic) IBOutlet UIButton *fhBtn4;
@property (weak, nonatomic) IBOutlet UIButton *fhBtn5;
@property (weak, nonatomic) IBOutlet UIButton *fwBtn1;
@property (weak, nonatomic) IBOutlet UIButton *fwBtn2;
@property (weak, nonatomic) IBOutlet UIButton *fwBtn3;
@property (weak, nonatomic) IBOutlet UIButton *fwBtn4;
@property (weak, nonatomic) IBOutlet UIButton *fwBtn5;
@property (weak, nonatomic) IBOutlet UIButton *msBtn1;
@property (weak, nonatomic) IBOutlet UIButton *msBtn2;
@property (weak, nonatomic) IBOutlet UIButton *msBtn3;
@property (weak, nonatomic) IBOutlet UIButton *msBtn4;
@property (weak, nonatomic) IBOutlet UIButton *msBtn5;
@property (nonatomic) int proEvaluate;//描述
@property (nonatomic) int fh;//发货
@property (nonatomic) int ms;//描述
@property (nonatomic) int fw;//服务
@property (nonatomic,strong) OrderObject *orderObj;
@property (nonatomic,strong) OrderProductObject *orderProObj;
- (IBAction)proEvaluateClick:(id)sender;
- (IBAction)photoClick:(id)sender;
- (IBAction)fhClick:(id)sender;
- (IBAction)fwClick:(id)sender;
- (IBAction)msClick:(id)sender;
- (IBAction)postEvaluateClick:(id)sender;
@end
