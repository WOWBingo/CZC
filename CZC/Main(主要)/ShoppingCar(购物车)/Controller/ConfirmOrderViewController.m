//
//  ConfirmOrderViewController.m
//  CZC
//
//  Created by 周德艺 on 15/9/9.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ConfirmOrderViewController.h"
#import "ConfirmOrderTableViewCell.h"
#import "PayAddressTableViewCell.h"
#import "ConfirmOrderShopCell.h"
#import "ConfirmOrderOtherCell.h"
#import "ShopCarObject.h"
#import "AddressViewController.h"
#import "ZDYPrintObject.h"
#import "PayMethodCell.h"
#import "PayMethodViewController.h"

@interface ConfirmOrderViewController ()

@end

@implementation ConfirmOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"确认订单";
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView setTableFooterView:[[UIView alloc] init]];
    //[_tableView setSeparatorColor:[UIColor clearColor]];
    _tableView.separatorStyle = NO;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 110;
    
    [self showHUDBeginWithTitle:nil];
    _endNumber = 0;
    [self getOrderNumber]; //获取订单号
    [self getPayment];     //获取支付方式列表
    [self getAddress];     //取地址，完成计算邮费
}

- (void)viewWillAppear:(BOOL)animated {
}
/**
 *	数据请求就绪
 */
- (void)reloadSelfView {
    //全部完成，取消转转转
    _endNumber++;
    if (_endNumber == 3+_selectedShopList.count*2) {
        [self dismissHUDEnd];
    }
    //如果只有一家店，订单号等于交易号
    if (_selectedShopList.count == 1) {
        _tradeID = [_selectedShopList objectAtIndexedSubscript:0];
    }
    //计算总价
    _allShouldPayPrice = 0.0f;
    for (int n = 0; n < _selectedShopList.count; n++) {
        ShopCarObject *shopObject = [_selectedShopList objectAtIndex:n];
        _allShouldPayPrice += (shopObject.price+shopObject.dispatchPrice);
    }
    //刷新界面
    [self.allPriceLab setText:[NSString stringWithFormat:@"%.2f",_allShouldPayPrice]];
    [self.tableView reloadData];
}

/**
 *	是否可以提交订单
 */
- (BOOL)isCanOrder {
    if (_addressObj == nil) {
        [self showHUDViewTitle:@"请选择收货地址"
                          info:@""
                      andCodes:^{
                          
                      }];
        return NO;
    }
    if (_paymentObject == nil) {
        [self showHUDViewTitle:@"请选择支付方式"
                          info:@""
                      andCodes:^{
                          
                      }];
        return NO;
    }
    return YES;
}

/**
 *	选择快递方式
 */
- (IBAction)choseDispatch:(id)sender {
    UIButton *button = (UIButton *)sender;
    ShopCarObject *shopObject = [_selectedShopList objectAtIndex:button.tag];
    NSDictionary *dispatchDic = shopObject.dispatchPriceDic;
    
    //如果不是免邮的
    if (shopObject.dispatchType != 0) {
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@"选择快递方式"
                                              message:nil
                                              preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *cancelAction =
        [UIAlertAction actionWithTitle:@"取消"
                                 style:UIAlertActionStyleCancel
                               handler:nil];
        [alertController addAction:cancelAction];
        for (NSString *dispatchKey in dispatchDic.allKeys) {
            NSString *dispatchPriceName;
            NSInteger diapatchType = -1;
            if ([dispatchKey isEqualToString:@"Express"]) {
                dispatchPriceName = @"快递";
                diapatchType = 2;
            } else if ([dispatchKey isEqualToString:@"Ems"]) {
                dispatchPriceName = @"EMS";
                diapatchType = 3;
            } else {
                dispatchPriceName = @"平邮";
                diapatchType = 1;
            }
            
            NSString *str =
            [NSString stringWithFormat:@"%@ ￥%@", dispatchPriceName,
             [dispatchDic objectForKey:dispatchKey]];
            UIAlertAction *newAction = [UIAlertAction
                                        actionWithTitle:str
                                        style:UIAlertActionStyleDefault
                                        handler:^(UIAlertAction *_Nonnull action) {
                                            shopObject.dispatchPriceName = dispatchKey;
                                            shopObject.dispatchPrice = [(NSString *)
                                                                        [dispatchDic objectForKey:dispatchKey] floatValue];
                                            shopObject.dispatchType = diapatchType;
                                            [button setTitle:str forState:UIControlStateNormal];
                                            NSLog(@"");
                                        }];
            [alertController addAction:newAction];
        }
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

#pragma mark - 网络数据操作
/**
 *  支付方式列表
 */
- (void)getPayment {
    [CZCService GETmethod:kPayMentList_URL
            andParameters:@""
                andHandle:^(NSDictionary *myresult) {
                    if (myresult) {
                        NSArray *dataArr = [myresult objectForKey:@"PaymentList"];
                        _paymentList =
                        [PaymentObject objectArrayWithKeyValuesArray:dataArr];
                        if (_paymentList.count > 0) {
                            _paymentObject = [_paymentList objectAtIndex:0];
                        }
                    } else {
                        NSLog(@"获取支付方式失败");
                    }
                    [self reloadSelfView];
                }];
}

/**
 *  收货地址列表
 */
- (void)getAddress {
    /** 18.收货地址列表 http://app.czctgw.com/api/address/a465788 */
    // NSString *params = @"a465788";
    [CZCService GETmethod:kAddressList_URL
            andParameters:kAccountObject.memLoginID
                andHandle:^(NSDictionary *myresult) {
                    
                    if (myresult) {
                        NSArray *dataArr = [myresult objectForKey:@"AddressList"];
                        if (dataArr.count > 0) {
                            NSArray *list =
                            [AddressObject objectArrayWithKeyValuesArray:dataArr];
                            BOOL isHaveDefault;
                            for (int i = 0; i < list.count; i++) {
                                AddressObject *addressObj = [list objectAtIndex:i];
                                if (addressObj.isDefault) {
                                    _addressObj = addressObj;
                                    isHaveDefault = YES;
                                    break;
                                }
                            }
                            if (!isHaveDefault) {
                                _addressObj = [list objectAtIndex:0];
                            }
                            [self getDispatchPrice]; //计算邮费
                        }
                    } else {
                        NSLog(@"失败");
                    }
                    [self reloadSelfView];
                }];
}

/**
 *	生成订单号
 */
- (void)getOrderNumber {
    _orderNumberList = [[NSMutableArray alloc] init];
    for (int i = 0; i <= _selectedShopList.count; i++) {
        [CZCService GETmethod:kGetOrder_URL
                andParameters:@""
                    andHandle:^(NSDictionary *myresult) {
                        
                        if (myresult) {
                            if (i == _selectedShopList.count) {
                                _tradeID = [myresult objectForKey:@"OrderNumber"];
                                NSLog(@" 生成订交易号 ------%@", _tradeID);
                            } else {
                                NSString *orderNumber =
                                [myresult objectForKey:@"OrderNumber"];
                                [_orderNumberList addObject:orderNumber];
                            }
                        } else {
                            NSLog(@"失败");
                        }
                        [self reloadSelfView];
                    }];
    }
}
/**
 *	计算邮费
 *  在地址选择之后重新计算
 */
- (void)getDispatchPrice {
    //    /api/Appshopfeetemplate?productguid=82def311-4d4c-4790-bf8a-9913812ba5c5,1|82def311-4d4c-4790-bf8a-9913812ba5c5,1&code=001
    for (int n = 0; n < _selectedShopList.count; n++) {
        ShopCarObject *shopObject = [_selectedShopList objectAtIndex:n];
        NSString *params = @"productguid=";
        for (int i = 0; i < shopObject.productList.count; i++) {
            ShopCarProductObject *productObject =
            [shopObject.productList objectAtIndex:i];
            if (i == 0) {
                params =
                [NSString stringWithFormat:@"%@%@,%ld", params, productObject.guid,
                 productObject.buyNumber];
            } else {
                params =
                [NSString stringWithFormat:@"%@|%@,%ld", params, productObject.guid,
                 productObject.buyNumber];
            }
        }
        params = [NSString
                  stringWithFormat:@"%@&code=%@", params, _addressObj.addressCode];
        [CZCService GETmethod:kAppShopfeetemplate_URL
                andParameters:params
                    andHandle:^(NSDictionary *myresult) {
                        
                        if (myresult) {
                            NSMutableDictionary *dispatchPriceDic =
                            [myresult objectForKey:@"WL"];
                            
                            if (dispatchPriceDic) {
                                shopObject.dispatchPriceDic = dispatchPriceDic;
                                
                                BOOL isFree = YES; //判断是不是免邮
                                for (NSString *dispatchKey in dispatchPriceDic.allKeys) {
                                    NSString *price =
                                    [dispatchPriceDic objectForKey:dispatchKey];
                                    if (price.intValue != 0) {
                                        isFree = NO;
                                    }
                                }
                                //如果是免邮的
                                if (isFree) {
                                    shopObject.dispatchPriceName = @"免邮";
                                    shopObject.dispatchPrice = 0.0f;
                                    shopObject.dispatchType = 0;
                                } else {
                                    NSString *price =
                                    [dispatchPriceDic objectForKey:@"Express"];
                                    shopObject.dispatchPriceName = @"快递";
                                    shopObject.dispatchPrice = price.floatValue;
                                    shopObject.dispatchType = 2;
                                }
                            }
                        }
                        [self reloadSelfView];
                    }];
    }
}

- (NSMutableDictionary *)createOrderDictionary:(ShopCarObject *)shopObject
                                   orderNumber:(NSString *)orderNumber {
    NSMutableArray *productDicList = [[NSMutableArray alloc] init];
    for (int i = 0; i < shopObject.productList.count; i++) {
        ShopCarProductObject *productObject =
        [shopObject.productList objectAtIndex:i];
        NSDictionary *productDic = [ZDYPrintObject
                                    getObjectData:productObject]; // getObjectData经过修改，首字大写
        [productDicList addObject:productDic];
    }
    
    NSString *shouldPayPrice = [NSString
                                stringWithFormat:@"%f", shopObject.price + shopObject.dispatchPrice];
    
    NSDictionary *dic = @{
                          @"MemLoginID" : kAccountObject.memLoginID, //@"111111",
                          @"OrderNumber" : orderNumber,
                          @"TradeID" : _tradeID,
                          @"Name" : _addressObj.name,
                          @"Email" : _addressObj.email,
                          @"Address" : [NSString stringWithFormat:@"%@%@", _addressObj.addressValue,
                                        _addressObj.address],
                          @"Postalcode" : _addressObj.postalcode,
                          @"Tel" : _addressObj.tel,
                          @"Mobile" : _addressObj.mobile,
                          @"PaymentGuid" : _paymentObject.guid,
                          @"OutOfStockOperate" : @"",
                          @"ClientToSellerMsg" : shopObject.messageStr,             //留言
                          @"RegionCode" : _addressObj.addressCode, //配送区域编码
                          @"PostType" :
                              [NSString stringWithFormat:@"%ld", shopObject.dispatchType], //快递方式
                          @"orderPrice" : @"",   //订单价格
                          @"ProductPrice" : @"", //产品价格
                          @"DispatchPrice" :
                              [NSString stringWithFormat:@"%f", shopObject.dispatchPrice], //邮费
                          @"ShouldPayPrice" : shouldPayPrice,                              //应支付
                          };
    
    NSMutableDictionary *parameters =
    [[NSMutableDictionary alloc] initWithDictionary:dic];
    [parameters setObject:productDicList forKey:@"ProductList"];
    
    return parameters;
}

/**
 *	提交订单
 *
 */
- (IBAction)accountClick:(id)sender {
    if ([self isCanOrder]) {
        [self showHUDBeginWithTitle:@"正在提交订单……"];
        _failShopList = [[NSMutableArray alloc] init];
        _successOrderList = [[NSMutableArray alloc] init];
        for (int n = 0; n < _selectedShopList.count; n++) {
            ShopCarObject *shopObject = [_selectedShopList objectAtIndex:n];
            NSString *orderNumber = [_orderNumberList objectAtIndex:n];
//            ConfirmOrderOtherCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:shopObject.count inSection:n+1]];
//            shopObject.messageStr = cell.messageTextField.text;
            
            NSMutableDictionary *parameters =
            [self createOrderDictionary:shopObject orderNumber:orderNumber];
            
            [CZCService POSTmethod:kOrderAdd_URL
                  andDicParameters:parameters
                         andHandle:^(NSDictionary *myresult) {
                             if (myresult) {
                                 NSInteger result =
                                 [[myresult objectForKey:@"return"] integerValue];
                                 if (result == 201) { //成功的订单
                                     [_successOrderList addObject:orderNumber];
                                 } else {
                                     [_failShopList addObject:shopObject]; //失败的订单
                                 }
                             } else {
                                 [_failShopList addObject:shopObject]; //失败的订单
                             }
                             //全部订单提交结束
                             if (_successOrderList.count + _failShopList.count ==
                                 _selectedShopList.count) {
                                 [self dismissHUDEnd];
                                 if (_failShopList.count == 0) {
                                     [self showHUDViewTitle:
                                      [NSString
                                       stringWithFormat:@"共%"
                                       @"ld张订单提交成功，是"
                                       @"否立即支付",
                                       _successOrderList.count]
                                                       info:@""
                                                   andCodes:^{
                                                       
                                                   }];
                                 } else {
                                     [self showHUDViewTitle:
                                      [NSString stringWithFormat:
                                       @"共%" @"ld张订单提交成功，%"
                                       @"ld张失败，是否立即支" @"付",
                                       _successOrderList.count,
                                       _failShopList.count]
                                                       info:@""
                                                   andCodes:^{
                                                       
                                                   }];
                                 }
                             }
                         }];
        }
    }
}

#pragma mark - tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _selectedShopList.count + 2;
}
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    if (section == 0 || section == _selectedShopList.count + 1) {
        return 1;
    } else {
        ShopCarObject *shopObject = [_selectedShopList objectAtIndex:section - 1];
        return shopObject.productList.count + 2;
    }
}
- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (IS_IOS8_OR_ABOVE) {
        return UITableViewAutomaticDimension;
    } else {
        return 110;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    if (section == 0) {
        /**
         *	地址的cell
         */
        static NSString *CellIdentifier = @"PayAddressTableViewCell";
        PayAddressTableViewCell *cell = (PayAddressTableViewCell *)
        [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            NSBundle *bundle = [NSBundle mainBundle];
            NSArray *nibArray =
            [bundle loadNibNamed:CellIdentifier owner:self options:nil];
            cell = (PayAddressTableViewCell *)[nibArray objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            [cell setAccessoryType:
             UITableViewCellAccessoryDisclosureIndicator]; //右箭头
        }
        if (_addressObj) {
            [cell.nameLabel
             setText:[NSString stringWithFormat:@"%@  %@", _addressObj.name,
                      _addressObj.mobile]];
            [cell.addressLabel setText:_addressObj.address];
        }
        return cell;
    } else if (section == _selectedShopList.count + 1) {
        /**
         *	支付方式cell
         */
        static NSString *CellIdentifier = @"PayMethodCell";
        PayMethodCell *cell = (PayMethodCell *)
        [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            NSBundle *bundle = [NSBundle mainBundle];
            NSArray *nibArray =
            [bundle loadNibNamed:CellIdentifier owner:self options:nil];
            cell = (PayMethodCell *)[nibArray objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            //[cell
            // setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];//右箭头
        }
        [cell.selectPayBtn addTarget:self
                              action:@selector(selectPayMethod:)
                    forControlEvents:UIControlEventTouchUpInside];
        if (_paymentObject) {
            [cell.payNameTextField setText:_paymentObject.name];
        }
        return cell;
    } else {
        ShopCarObject *shopObject = [_selectedShopList objectAtIndex:section - 1];
        if (row == 0) {
            /**
             *	店铺cell
             */
            static NSString *cellIdentifier = @"ConfirmOrderShopCell";
            ConfirmOrderShopCell *cell = (ConfirmOrderShopCell *)
            [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (cell == nil) {
                NSBundle *bundle = [NSBundle mainBundle];
                NSArray *nibArray =
                [bundle loadNibNamed:cellIdentifier owner:self options:nil];
                cell = (ConfirmOrderShopCell *)[nibArray objectAtIndex:0];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            }
            [cell.shopNameLabel setText:shopObject.shop];
            return cell;
        } else if (row == shopObject.productList.count + 1) {
            /**
             *	快递选择，留言等的cell
             */
            static NSString *cellIdentifier = @"ConfirmOrderOtherCell";
            ConfirmOrderOtherCell *cell = (ConfirmOrderOtherCell *)
            [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (cell == nil) {
                NSBundle *bundle = [NSBundle mainBundle];
                NSArray *nibArray =
                [bundle loadNibNamed:cellIdentifier owner:self options:nil];
                cell = (ConfirmOrderOtherCell *)[nibArray objectAtIndex:0];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                [cell.renrenBtn addTarget:self
                                   action:@selector(choseDispatch:)
                         forControlEvents:UIControlEventTouchUpInside];
            }
            int num;
            for (int i = 0; i < shopObject.productList.count; i++) {
                ShopCarProductObject *proObject =
                [shopObject.productList objectAtIndex:i];
                num += proObject.buyNumber;
            }
            if (shopObject.dispatchPriceName != nil) {
                NSString *str = [NSString stringWithFormat:@" %@ ￥%.f",
                                 shopObject.dispatchPriceName,
                                 shopObject.dispatchPrice];
                [cell.renrenBtn setTitle:str forState:UIControlStateNormal];
            } else {
                [cell.renrenBtn setTitle:@"选择配送方式" forState:UIControlStateNormal];
            }
            
            [cell.renrenBtn setTag:section - 1];
            [cell.priceLabel
             setText:[NSString stringWithFormat:@"￥%.2f", shopObject.price]];
            [cell.messageTextField setText:shopObject.messageStr];
            [cell.messageTextField setTag:section - 1];
            cell.messageTextField.delegate = self;
            [cell.numLabel setText:[NSString stringWithFormat:@"共%d件商品，", num]];
            return cell;
        } else {
            /**
             *	每条产品的cell
             */
            ShopCarProductObject *proObject =
            [shopObject.productList objectAtIndex:row - 1];
            static NSString *cellIdentifier = @"ConfirmOrderTableViewCell";
            ConfirmOrderTableViewCell *cell = (ConfirmOrderTableViewCell *)
            [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (cell == nil) {
                NSBundle *bundle = [NSBundle mainBundle];
                NSArray *nibArray =
                [bundle loadNibNamed:cellIdentifier owner:self options:nil];
                cell = (ConfirmOrderTableViewCell *)[nibArray objectAtIndex:0];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                [cell setBackgroundColor:BackGroundColor];
            }
            [cell.proNameLabel setText:proObject.name];
            [cell.proInfoLabel
             setText:[NSString stringWithFormat:@"%@%@",
                      proObject.specificationValue,
                      proObject.specificationName]];
            [cell.numberLabel
             setText:[NSString stringWithFormat:@"x %ld", proObject.buyNumber]];
            [cell.priceLabel
             setText:[NSString stringWithFormat:@"￥%.2f", proObject.buyPrice]];
            [cell.image
             sd_setImageWithURL:[NSURL URLWithString:proObject.originalImge]
             placeholderImage:DefaultImage];
            return cell;
        }
    }
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        AddressViewController *newVC =
        [[AddressViewController alloc] initWithNibName:@"AddressViewController"
                                                bundle:nil];
        [self.navigationController pushViewController:newVC animated:YES];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    ShopCarObject *shopObject = [_selectedShopList objectAtIndex:textField.tag];
    shopObject.messageStr = textField.text;
}

- (IBAction)selectPayMethod:(id)sender {
    PayMethodViewController *newVC = [[PayMethodViewController alloc]
                                      initWithNibName:@"PayMethodViewController"
                                      bundle:nil];
    newVC.paymentList = _paymentList;
    [self presentViewController:newVC
                       animated:YES
                     completion:^{
                         
                     }];
}

@end
