//
//  HomeViewController.h
//  CZC
//
//  Created by 周德艺 on 15/7/6.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccoutObject.h"
#import "MBProgressHUD.h"


@interface PublicViewController:UIViewController

@property(nonatomic ,unsafe_unretained)IBOutlet UILabel *noDataLab;
@property(nonatomic ,strong)UIBarButtonItem *leftMenuItem;
@property(nonatomic ,strong)UIBarButtonItem *rightMenuItem;
@property(nonatomic ,strong)UIBarButtonItem *backMenuItem;

//@property(nonatomic ,strong)AccoutObject *accoutObject;

-(IBAction)backFucntion:(id)sender;


- (void)goToLoginVC;

- (void)showHUDViewTitle:(NSString *)title info:(NSString*)info andCodes:(void (^)())finish;

- (void)showHUDBeginWithTitle:(NSString *)title;

- (void)dissMissHUDEnd;

@end
