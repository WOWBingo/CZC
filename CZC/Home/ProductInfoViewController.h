//
//  ProductInfoViewController.h
//  CZC
//
//  Created by 周德艺 on 15/7/14.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "PublicViewController.h"
#import "AdScrollView.h"
#import "ZDYScrollView.h"

@interface ProductInfoViewController : PublicViewController<UITableViewDataSource,UITableViewDelegate>


@property (strong, nonatomic) ZDYScrollView *headView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *addShoppingCarBtn;
@property (weak, nonatomic) IBOutlet UIButton *shoppingCarBtn;

- (IBAction)goShoppingCar:(id)sender;
- (IBAction)addShoppingCar:(id)sender;

@end
