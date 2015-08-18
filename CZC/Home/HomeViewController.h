//
//  HomeViewController.h
//  CZC
//
//  Created by 周德艺 on 15/7/6.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PublicViewController.h"
#import "HomeImageObject.h"
#import "ZDYScrollView.h"

@interface HomeViewController:PublicViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong) UIView *searchView;
@property (nonatomic ,strong) NSMutableArray *dataList;
@property (nonatomic ,strong) NSArray *homeImages;/**< 首页轮播展示图片*/
@property (nonatomic ,strong) UIBarButtonItem *leftItem;
@property (nonatomic) BOOL isHomePage;

@property (strong, nonatomic) ZDYScrollView *headView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
