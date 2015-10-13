//
//  EvaluateViewController.m
//  CZC
//
//  Created by 张浩 on 15/10/9.
//  Copyright © 2015年 周德艺. All rights reserved.
//

#import "EvaluateViewController.h"

@interface EvaluateViewController ()

@end

@implementation EvaluateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"评价";
    self.proEvaluate = 0;
    self.fh = 0;
    self.fw = 0;
    self.ms = 0;
    // handleSwipeFrom 是偵測到手势，所要呼叫的方法
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenKeyboard)];
    gesture.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:gesture];
}
-(void)viewWillAppear:(BOOL)animated{
    //图片
    NSString *imgURL = @"";
    imgURL = [PublicObject convertNullString:self.orderProObj.productImg];
    if ([imgURL isEqualToString:@""]||imgURL == nil) {
        self.orderImg.image = [UIImage imageNamed:@"cpsc-p1"];
    } else {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSString *urlString = [NSString stringWithFormat:@"%@",imgURL];
            NSURL *imageUrl = [NSURL URLWithString:urlString];
            NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
            UIImage *img = [UIImage imageWithData:imageData];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateImage:img];
            });
        });
    }
    self.orderInfoLab.text = self.orderProObj.productName;
    self.orderOtherInfoLab.text = self.orderProObj.specificationValue;
}
//异步加载图片
- (void)updateImage:(UIImage *)img{
    if (img != nil) {
        self.orderImg.image = img;
    } else {
        self.orderImg.image = [UIImage imageNamed:@"cpsc-p1"];
    }
}
//隐藏键盘的方法
- (void)hidenKeyboard {
    [self.evaluateTextView resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)proEvaluateClick:(id)sender {
    UIButton *btn = (UIButton *)sender;
    self.proEvaluate = (int)btn.tag+1;
    switch (btn.tag) {
        case 0:
        {
            [self.proEvaluateBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.proEvaluateBtn2 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.proEvaluateBtn3 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.proEvaluateBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.proEvaluateBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
        }
            break;
        case 1:
            [self.proEvaluateBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.proEvaluateBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.proEvaluateBtn3 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.proEvaluateBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.proEvaluateBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [self.proEvaluateBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.proEvaluateBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.proEvaluateBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.proEvaluateBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.proEvaluateBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [self.proEvaluateBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.proEvaluateBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.proEvaluateBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.proEvaluateBtn4 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.proEvaluateBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [self.proEvaluateBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.proEvaluateBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.proEvaluateBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.proEvaluateBtn4 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.proEvaluateBtn5 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}

- (IBAction)photoClick:(id)sender {
}

- (IBAction)fhClick:(id)sender {
    UIButton *btn = (UIButton *)sender;
    self.fh = (int)btn.tag+1;
    switch (btn.tag) {
        case 0:
        {
            [self.fhBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fhBtn2 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.fhBtn3 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.fhBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.fhBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
        }
            break;
        case 1:
            [self.fhBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fhBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fhBtn3 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.fhBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.fhBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [self.fhBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fhBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fhBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fhBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.fhBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [self.fhBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fhBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fhBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fhBtn4 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fhBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [self.fhBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fhBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fhBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fhBtn4 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fhBtn5 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}

- (IBAction)fwClick:(id)sender {
    UIButton *btn = (UIButton *)sender;
    self.fw = (int)btn.tag+1;
    switch (btn.tag) {
        case 0:
        {
            [self.fwBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fwBtn2 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.fwBtn3 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.fwBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.fwBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
        }
            break;
        case 1:
            [self.fwBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fwBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fwBtn3 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.fwBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.fwBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [self.fwBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fwBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fwBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fwBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.fwBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [self.fwBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fwBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fwBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fwBtn4 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fwBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [self.fwBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fwBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fwBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fwBtn4 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.fwBtn5 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            break;
        default:
            break;
    }
    
}

- (IBAction)msClick:(id)sender {
    UIButton *btn = (UIButton *)sender;
    self.ms = (int)btn.tag+1;
    switch (btn.tag) {
        case 0:
        {
            [self.msBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn2 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.msBtn3 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.msBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.msBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
        }
            break;
        case 1:
            [self.msBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn3 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.msBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.msBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 2:
            [self.msBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn4 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            [self.msBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 3:
            [self.msBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn4 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn5 setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
            break;
        case 4:
            [self.msBtn1 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn2 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn3 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn4 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            [self.msBtn5 setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}

- (IBAction)postEvaluateClick:(id)sender {
#pragma mark - 44.发表评价
    /** 44.发表评价 http://api/ProductComment/Add */
    NSString *proEvaluateStr = @"";
    if (self.proEvaluate < 3) {
        proEvaluateStr = @"1";
    }else if (self.proEvaluate < 5){
        proEvaluateStr = @"3";
    }else{
        proEvaluateStr = @"5";
    }
    NSString *fhStr = [NSString stringWithFormat:@"%d",self.fh];
    NSString *fwStr = [NSString stringWithFormat:@"%d",self.fw];
    NSString *msStr = [NSString stringWithFormat:@"%d",self.ms];
    
    NSString *shopId = [NSString stringWithFormat:@"%ld",(long)self.orderObj.shopID2];
//    NSLog(@"%@",proEvaluateStr);
//    NSLog(@"%@",fhStr);
//    NSLog(@"%@",fwStr);
//    NSLog(@"%@",msStr);
//    NSLog(@"%@",self.evaluateTextView.text);
//    NSLog(@"%@",self.orderProObj.guid);
//    NSLog(@"%@",kAccountObject.memLoginID);
//    NSLog(@"%@",self.orderObj.shopID);
//    NSLog(@"%@",self.orderObj.shopName);
//    NSLog(@"%@",self.orderObj.guid);
//    NSLog(@"%@",self.orderProObj.productName);
//    NSLog(@"%f",self.orderProObj.buyPrice);
    
    NSString *proProce = [NSString stringWithFormat:@"%f",self.orderProObj.buyPrice];
    NSDictionary *dic = @{@"CommentType":proEvaluateStr,
                          @"Speed":fhStr,
                          @"Attitude":fwStr,
                          @"Character":msStr,
                          @"Comment":self.evaluateTextView.text,
                          @"ProductGuid":self.orderProObj.guid,
                          @"ShopID":shopId,
                          @"MemLoginID":kAccountObject.memLoginID,
                          @"ShopLoginid":self.orderObj.shopID,
                          @"ShopName":self.orderObj.shopName,
                          @"OrderGuid":self.orderObj.guid,
                          @"ProductName":self.orderProObj.productName,
                          @"ProductPrice":proProce};
    [CZCService POSTmethod:kProductCommentAdd_URL andDicParameters:dic andHandle:^(NSDictionary *myresult) {
        NSDictionary *result = myresult;
        NSLog(@"%@",result);
        if (result) {
            NSString *statuStr = [NSString stringWithFormat:@"%@",[result objectForKey:@"return"]];
            if ([statuStr isEqualToString:@"200"]) {
                NSLog(@"评价成功");
                [self showHUDViewTitle:@"评价成功" info:@"" andCodes:^{
                    [self.navigationController popViewControllerAnimated:YES];
                }];
            }else{
                NSLog(@"评价失败");
                [self showHUDViewTitle:@"评价订单失败" info:@"" andCodes:^{
                }];
            }
        }
        else{
            [self showHUDViewTitle:@"取消订单失败" info:@"" andCodes:^{
            }];
        }
    }];
}
#pragma textView delegate
-(void)textViewDidBeginEditing:(UITextView *)textView{
    textView.text = @"";
}

@end
