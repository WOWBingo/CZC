//
//  PersonNewsDetailViewController.h
//  CZC
//
//  Created by 张浩 on 15/8/24.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageObject.h"
@interface PersonNewsDetailViewController : PublicViewController
@property(nonatomic,strong)MessageObject *messageObj;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *contentLab;
@end
