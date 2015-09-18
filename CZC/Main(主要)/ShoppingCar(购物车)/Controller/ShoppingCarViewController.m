//
//  ShoppingCarViewController.m
//  CZC
//
//  Created by 张浩 on 15/7/15.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ShoppingCarViewController.h"
#import "ShoppingCarTableViewCell.h"
#import "PayViewController.h"
#import "ShopCarObject.h"
#import "ShopCarProductObject.h"
#import "ShoppingCarHeadView.h"
#import "Masonry.h"
#import "ZDYCheckButton.h"
#import "ConfirmOrderViewController.h"
@interface ShoppingCarViewController ()

@end

@implementation ShoppingCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购物车";
    self.navigationItem.leftBarButtonItem = nil;
    
    //数组初始化
    self.shopCarObjectArr = [[NSMutableArray alloc]init];
    
    //表格
    _tableView.dataSource = self;
    _tableView.delegate = self;
    //[_tableView setSeparatorColor:[UIColor clearColor]];
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 120;
    
}

-(void)viewWillAppear:(BOOL)animated{
    self.parentViewController.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.hidden = NO;
    if (kAccountObject == nil) {
        [self goToLoginVC];
    }else{
        [self getShoppingCarData];
    }
}
-(void)viewDidAppear:(BOOL)animated{
    self.parentViewController.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.hidden = NO;
}

-(void)viewWillDisappear:(BOOL)animated{
    self.parentViewController.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.hidden = NO;
}
#pragma mark - 11. 购物车列表
/**11. 购物车列表  http://app.czctgw.com/api/shoppingcart2/*/
- (void)getShoppingCarData{
    
    [CZCService GETmethod:kShoppingCartList_URL andParameters:kAccountObject.memLoginID andHandle:^(NSDictionary *myresult) {
        NSDictionary *result = myresult;
        if (result) {
            NSArray *dataArr = [result objectForKey:@"DATA"];
            NSArray *list = [ShopCarObject objectArrayWithKeyValuesArray:dataArr];
            NSLog(@"11. 购物车列表 ------%@",list);
            _shopCarObjectArr = [NSMutableArray arrayWithArray:list];
            for (int i = 0; i < _shopCarObjectArr.count; i++) {
                ShopCarObject *carObject = [_shopCarObjectArr objectAtIndex:i];
                NSArray *productList = [ShopCarProductObject objectArrayWithKeyValuesArray:carObject.productList];
                carObject.productList = [NSMutableArray arrayWithArray:productList];
                carObject.price = 0;
            }
            
            [self reloadPrice];
        }
        else{
            NSLog(@"失败");
        }
    }];
}

#pragma mark - table
//section数，商店数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _shopCarObjectArr.count;;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    ShopCarObject *carObject = [_shopCarObjectArr objectAtIndex:section];
    ShoppingCarHeadView *headView = [ShoppingCarHeadView instanceView];
    headView.selectBtn.tag = section;
    [headView.selectBtn setSelectedWithBool:carObject.isSelected];
    [headView.selectBtn addTarget:self action:@selector(selectShopControl:) forControlEvents:UIControlEventTouchUpInside];
    [headView.shopBtn setTitle:carObject.shop forState:UIControlStateNormal];
    [headView.priceLabel setText:[NSString stringWithFormat:@"￥%.2f",carObject.price]];
    
    return headView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ShopCarObject *carObject = [_shopCarObjectArr objectAtIndex:section];
    return carObject.productList.count;//_shopCarObjectArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    ShopCarObject *carObject = [_shopCarObjectArr objectAtIndex:section];
    ShopCarProductObject *proObject = [carObject.productList objectAtIndex:row];
    static NSString *CellIdentifier = @"ShoppingCarTableViewCell";
    ShoppingCarTableViewCell *cell = (ShoppingCarTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:CellIdentifier owner:self options:nil];
        cell = (ShoppingCarTableViewCell *)[nibArray objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell.chooseBtn addTarget:self action:@selector(selectProductControl:) forControlEvents:UIControlEventTouchUpInside];
    }
    cell.chooseBtn.index = indexPath;
    [cell.chooseBtn setSelectedWithBool:proObject.isSelected];
    [cell.titleLab setText:proObject.name];
    [cell.centerLab setText:[NSString stringWithFormat:@"%@%@",proObject.specificationValue,proObject.specificationName]];
    [cell.oldPriceLab setText:[NSString stringWithFormat:@"￥%.2f",proObject.marketPrice]];
    [cell.nowPriceLab setText:[NSString stringWithFormat:@"￥%.2f",proObject.buyPrice]];
    [cell.titleImg sd_setImageWithURL:[NSURL URLWithString:proObject.originalImge] placeholderImage:DefaultImage];
    cell.numBtn.currentNum = [NSString stringWithFormat:@"%ld",proObject.buyNumber];
    // 内容更改的block回调
    cell.numBtn.callBack = ^(NSString *currentNum){
        proObject.buyNumber = currentNum.integerValue;
        NSLog(@"%@", currentNum);
        [self reloadPrice];
    };
    
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (IS_IOS8_OR_ABOVE) {
        return UITableViewAutomaticDimension;
    }else{
        return 110;
    }
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    //    switch (indexPath.section) {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *	结算
 *
 *	找到被选中的店铺和产品
 */
- (IBAction)accountClick:(id)sender {
    
    NSMutableArray *selectedShopList = [[NSMutableArray alloc]init];
    CGFloat allPrice = 0;
    for (int i = 0; i < _shopCarObjectArr.count; i++) {
        CGFloat shopPrice = 0;
        ShopCarObject *carObject = [_shopCarObjectArr objectAtIndex:i];
        NSMutableArray *selectedProductList = [[NSMutableArray alloc]init];
        for (int j = 0; j < carObject.productList.count; j++) {
            ShopCarProductObject *product = [carObject.productList objectAtIndex:j];
            if (product.isSelected) {
                shopPrice += product.buyNumber*product.buyPrice;
                [selectedProductList addObject:product];
            }
        }
        carObject.price = shopPrice;
        if (selectedProductList.count != 0) {
            ShopCarObject *selectedShop = [[ShopCarObject alloc]init];
            selectedShop.shopID = carObject.shopID;
            selectedShop.shop = carObject.shop;
            selectedShop.price = carObject.price;
            selectedShop.count =  selectedProductList.count;
            selectedShop.productList = selectedProductList;
            [selectedShopList addObject:selectedShop];
        }
        allPrice += shopPrice;
    }
//    NSArray *dictArray = [ShopCarObject keyValuesArrayWithObjectArray:selectedShopList];
//    
//    NSLog(@"%@",dictArray);
    
    ConfirmOrderViewController *newVC = [[ConfirmOrderViewController alloc]initWithNibName:@"ConfirmOrderViewController" bundle:nil];
    newVC.selectedShopList = selectedShopList;
    [self.navigationController pushViewController:newVC animated:YES];
}

#pragma mark - 选择控制
/**
 *店铺选择控制
 */
- (IBAction)selectShopControl:(id)sender{
    ZDYCheckButton *button = (ZDYCheckButton *)sender;
    button.allIsSelected = [button changeSelected];
    ShopCarObject *carObject = [_shopCarObjectArr objectAtIndex:button.tag];
    carObject.isSelected = button.allIsSelected;//店铺对象的选中改变
    for (int i = 0; i < carObject.productList.count; i++) {
        ShoppingCarTableViewCell *cell = (ShoppingCarTableViewCell *)[_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:button.tag]];
        [cell.chooseBtn setSelectedWithBool:button.allIsSelected];
        ShopCarProductObject *proObject = [carObject.productList objectAtIndex:i];
        proObject.isSelected = button.allIsSelected;
    }
    [self reloadPrice];
}
/**
 *店铺选择控制
 */
- (IBAction)selectProductControl:(id)sender{
    ZDYCheckButton *button = (ZDYCheckButton *)sender;
    button.isSelected = [button changeSelected];
    ShopCarObject *carObject = [_shopCarObjectArr objectAtIndex:button.index.section];
    ShoppingCarTableViewCell *cell = (ShoppingCarTableViewCell *)[_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:button.index.row inSection:button.index.section]];
    [cell.chooseBtn setSelectedWithBool:button.isSelected];
    ShopCarProductObject *proObject = [carObject.productList objectAtIndex:button.index.row];
    proObject.isSelected = button.isSelected;
    
    //判断店铺内的商品是否为全选中状态
    for (int i = 0; i < carObject.productList.count; i++) {
        ShopCarProductObject *proObject = [carObject.productList objectAtIndex:i];
        carObject.isSelected = proObject.isSelected;
        if (!carObject.isSelected) {
            break;
        }
    }
    [self reloadPrice];
}

/**
 *店铺选择控制
 */
- (void)reloadPrice{
    CGFloat allPrice = 0;
    for (int i = 0; i < _shopCarObjectArr.count; i++) {
        CGFloat shopPrice = 0;
        ShopCarObject *carObject = [_shopCarObjectArr objectAtIndex:i];
        for (int j = 0; j < carObject.productList.count; j++) {
            ShopCarProductObject *product = [carObject.productList objectAtIndex:j];
            if (product.isSelected) {
                shopPrice += product.buyNumber*product.buyPrice;
            }
        }
        carObject.price = shopPrice;
        allPrice += shopPrice;
    }
    [_sumLab setText:[NSString stringWithFormat:@"￥%.2f",allPrice]];
    
    _accountBtn.enabled = ![_sumLab.text isEqualToString:@"￥0.00"];
    
    [_tableView reloadData];
}



@end
