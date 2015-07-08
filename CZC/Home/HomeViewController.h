//
//  HomeViewController.h
//  CZC
//
//  Created by 周德艺 on 15/7/6.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController:UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong) UIView *searchView;
@property (nonatomic ,strong) NSMutableArray *dataList;
@property (nonatomic ,strong) UIBarButtonItem *leftItem;
@property (nonatomic) BOOL isHomePage;

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
