//
//  ChoseProductInfoView.h
//  CZC
//
//  Created by 周德艺 on 15/8/20.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//
/**
 *	选择规格数量，加入购物车，直接购买
 *
 */

#import <UIKit/UIKit.h>
#import "ProductsObject.h"
#import "SpecificationAllObject.h"
#import "SpecificationOfPriceObject.h"

@interface ChoseProductInfoView : UIView<UITableViewDelegate,UITableViewDataSource>

+(ChoseProductInfoView *)instanceView;
- (IBAction)disView:(id)sender;
- (IBAction)addShoppingCar:(id)sender;
- (IBAction)buyNow:(id)sender;
- (IBAction)define:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UIView *imgBackView;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *stockLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *buyNowBtn;
@property (weak, nonatomic) IBOutlet UIButton *addShoppingCarBtn;
@property (weak, nonatomic) IBOutlet UIButton *defineBtn;

@property (strong, nonatomic) void (^dismissView)();

#pragma  mark - 数据
@property (strong, nonatomic) ProductsObject *product;/**< 产品对象 */
@property (nonatomic, strong) SpecificationOfPriceObject *priceObject;/**< 查询到的价格对象*/
@property (strong, nonatomic) NSMutableDictionary *selectedSpecificationDic;/**< 选中的规格对象字典 */
@property (strong, nonatomic) NSArray *specificationArray;/**< 所有规格对象 */

@property (assign, nonatomic) NSInteger productNum;/**< 购买数 */
@property (assign, nonatomic) NSInteger stockNum;/**< 库存数 */
@property (assign, nonatomic) CGFloat allPrice;/**< 总价 */
@property (assign, nonatomic) CGFloat onePrice;/**< 选中类型的单价 */

/**
 *	刷新对象
 */
- (void)reloadProduct:(ProductsObject *)object;


@end
