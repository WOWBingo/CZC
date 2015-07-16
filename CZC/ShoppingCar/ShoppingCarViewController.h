//
//  ShoppingCarViewController.h
//  CZC
//
//  Created by 张浩 on 15/7/15.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoppingCarViewController : PublicViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic) BOOL isHomePage;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *sumLab;
@property (weak, nonatomic) IBOutlet UIButton *accountBtn;

@property (nonatomic,strong) NSMutableArray *productsArr;
- (IBAction)accountClick:(id)sender;
@end
