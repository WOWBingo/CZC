//
//  UserInfoViewController.h
//  CZC
//
//  Created by 张浩 on 15/7/8.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHPickView.h"

@interface UserInfoViewController : PublicViewController<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,ZHPickViewDelegate>
//pickView
@property(nonatomic,strong)ZHPickView *pickview;
@property(nonatomic,strong)NSIndexPath *indexPath;
@property (nonatomic,strong)NSString *dateStr;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) UIButton *iconBtn;
@property (nonatomic,strong) UILabel *trueName;
@property (nonatomic,strong) UILabel *userName;
@property (nonatomic,strong) UILabel *sex;
@property (nonatomic,strong) UILabel *age;
@property (nonatomic,strong) UILabel *tel;

//@property (nonatomic,strong)AccoutObject *object;



@property (nonatomic,strong) NSURLConnection *connection;
@property (nonatomic,strong)NSMutableData *receiveData;

@end
