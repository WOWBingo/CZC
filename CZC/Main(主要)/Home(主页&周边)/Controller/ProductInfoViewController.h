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
#import "ChoseProductInfoView.h"
#import "ProductsObject.h"

@interface ProductInfoViewController : PublicViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>


@property (strong, nonatomic) ZDYScrollView *headView;
@property (assign, nonatomic) CGFloat paramesHeight;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *addShoppingCarBtn;
@property (weak, nonatomic) IBOutlet UIButton *shoppingCarBtn;

- (IBAction)goShoppingCar:(id)sender;
- (IBAction)addShoppingCar:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *choseSpecificationBtn;
- (IBAction)choseSpecification:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *nilImageView;

@property (strong, nonatomic) __block UIView *imgTextView;/**< 图片视图 */
@property (strong, nonatomic)  UITableView *paramesTable;/**< 参数视图 */
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmented;

- (IBAction)changeSegmented:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *shopPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *oldPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhekouLabel;
@property (weak, nonatomic) IBOutlet UIView *titleView;/**< 名称视图 */
@property (weak, nonatomic) IBOutlet UIView *guigeView;/**< 规格,数量视图 */

#pragma  mark - 选择视图
@property (strong, nonatomic) ChoseProductInfoView *choseProductView;
@property (strong, nonatomic) UIView *backView;

#pragma  mark - 数据
@property (strong, nonatomic) NSArray *specificationArray;
@property (strong, nonatomic) ProductsObject *product;
@property (nonatomic, assign) BOOL isHaveGuige;

@end
