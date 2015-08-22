//
//  ShopInfoViewController.h
//  CZC
//
//  Created by 周德艺 on 15/7/21.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "PublicViewController.h"
#import "LGtitleBarView.h"
#import "ShopObject.h"

@interface ShopInfoViewController : PublicViewController<UITableViewDataSource,UITableViewDelegate,LGtitleBarViewDelegate>

/**
 *	数据
 */
@property (nonatomic, strong) NSArray *titles;/** < */
@property (nonatomic, strong) LGtitleBarView *titleBar;/** < */
@property (nonatomic) CGRect oldFrame;/** < */
@property (nonatomic, copy) NSString *shopId;/** <店铺id */
@property (nonatomic, strong) ShopObject *shop;/** <店铺 */

/** 显示 IBOutlet*/
@property (weak, nonatomic) IBOutlet UIView *titleView;/** < 分类*/
@property (weak, nonatomic) IBOutlet UITableView *tableView;/** < */
@property (weak, nonatomic) IBOutlet UIView *centerView;/** < */
@property (weak, nonatomic) IBOutlet UILabel *shopNameLab;/** < 店铺名Lable */
@property (weak, nonatomic) IBOutlet UILabel *locationLab;/** < 位置Lable*/
@property (weak, nonatomic) IBOutlet UILabel *distanceLab;/** < 距离*/
@property (weak, nonatomic) IBOutlet UIButton *telBtn;/** < 电话*/
/**
 *	电话联系
 */
- (IBAction)callShop:(id)sender;


@end
