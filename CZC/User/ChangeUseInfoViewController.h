//
//  ChangeUseInfoViewController.h
//  CZC
//
//  Created by 张浩 on 15/7/8.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangeUseInfoViewController : PublicViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UITextField *infoField;
@property (nonatomic,strong) NSString *infoStr;
@property (nonatomic) BOOL isTrueName;
@property (nonatomic) BOOL isSex;

@property (nonatomic,strong) NSString *titleStr;
@property (nonatomic,strong) NSArray *sexArr;
@property(nonatomic) int index;
@end
