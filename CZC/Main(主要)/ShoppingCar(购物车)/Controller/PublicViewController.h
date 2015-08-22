//
//  PublicViewController.h
//  CZC
//
//  Created by 张浩 on 15/7/12.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PublicViewController : UIViewController
@property(nonatomic ,unsafe_unretained)IBOutlet UILabel *noDataLab;
@property(nonatomic ,strong)UIBarButtonItem *leftMenuItem;
@property(nonatomic ,strong)UIBarButtonItem *rightMenuItem;
@property(nonatomic ,strong)UIBarButtonItem *backMenuItem;
-(IBAction)backFucntion:(id)sender;
@end
