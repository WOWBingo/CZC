//
//  SearchViewController.h
//  CZC
//
//  Created by 周德艺 on 15/7/6.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong) UISearchBar    *searchBar;
@property (nonatomic ,strong) NSMutableArray *dataList;
@property (nonatomic ,strong) NSMutableArray *searchList;
@property (nonatomic ,strong) UIBarButtonItem *leftItem;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
