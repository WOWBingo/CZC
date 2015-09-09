//
//  ConfirmOrderViewController.h
//  CZC
//
//  Created by 周德艺 on 15/9/9.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "PublicViewController.h"

@interface ConfirmOrderViewController : PublicViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *allPriceLab;
@property (weak, nonatomic) IBOutlet UIButton *orderBtn;

@property (nonatomic,strong) NSMutableArray *selectedProductList;/**< 选中的产品 */
@property (nonatomic,strong) NSMutableArray *selectedShopList;/**< 选中的店铺 */

- (IBAction)accountClick:(id)sender;

@end
