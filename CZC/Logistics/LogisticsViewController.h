//
//  LogisticsViewController.h
//  CZC
//
//  Created by 张浩 on 15/7/15.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogisticsViewController : PublicViewController

@property (nonatomic) BOOL isHomePage;

@property (weak, nonatomic) IBOutlet UIButton *searchImgBtn;
@property (weak, nonatomic) IBOutlet UIButton *historyImgBtn;
@property (weak, nonatomic) IBOutlet UIButton *searchLabBtn;
@property (weak, nonatomic) IBOutlet UIButton *historyLabBtn;
@property (weak, nonatomic) IBOutlet UIImageView *searchTriangleImg;
@property (weak, nonatomic) IBOutlet UIImageView *historyTriangleImg;
@property (weak, nonatomic) IBOutlet UIButton *startBtn;
@property (weak, nonatomic) IBOutlet UIButton *endBtn;
@property (weak, nonatomic) IBOutlet UIButton *placeBtn;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
- (IBAction)seachClick:(id)sender;
@end
