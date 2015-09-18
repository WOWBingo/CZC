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

@interface ConfirmOrderViewController ()

@end

@implementation ConfirmOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"确认订单";
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView setTableFooterView:[[UIView alloc]init]];
    //[_tableView setSeparatorColor:[UIColor clearColor]];
    _tableView.separatorStyle = NO;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 110;
}

- (void)viewWillAppear:(BOOL)animated{
    [self getAddress];
    [self getOrderNumber];
    [self getPayment];
}

#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _selectedShopList.count+1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else{
        ShopCarObject *shopObject = [_selectedShopList objectAtIndex:section-1];
        return shopObject.productList.count+2;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (IS_IOS8_OR_ABOVE) {
        return UITableViewAutomaticDimension;
    }else{
        return 110;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    if (section == 0) {
        /**
         *	地址的cell
         */
        static NSString *CellIdentifier = @"PayAddressTableViewCell";
        PayAddressTableViewCell *cell = (PayAddressTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            NSBundle *bundle = [NSBundle mainBundle];
            NSArray *nibArray = [bundle loadNibNamed:CellIdentifier owner:self options:nil];
            cell = (PayAddressTableViewCell *)[nibArray objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];//右箭头
        }
        if(_addressObj){
            [cell.nameLabel setText:[NSString stringWithFormat:@"%@  %@",_addressObj.name,_addressObj.mobile]];
            [cell.addressLabel setText:_addressObj.address];
        }
        return cell;
    }else{
        ShopCarObject *shopObject = [_selectedShopList objectAtIndex:section-1];
        if(row == 0){
            /**
             *	店铺cell
             */
            static NSString *cellIdentifier = @"ConfirmOrderShopCell";
            ConfirmOrderShopCell *cell = (ConfirmOrderShopCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (cell == nil) {
                NSBundle *bundle = [NSBundle mainBundle];
                NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
                cell = (ConfirmOrderShopCell *)[nibArray objectAtIndex:0];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            }
            [cell.shopNameLabel setText:shopObject.shop];
            return cell;
        }else if(row == shopObject.productList.count+1){
            /**
             *	快递选择，留言等的cell
             */
            static NSString *cellIdentifier = @"ConfirmOrderOtherCell";
            ConfirmOrderOtherCell *cell = (ConfirmOrderOtherCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (cell == nil) {
                NSBundle *bundle = [NSBundle mainBundle];
                NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
                cell = (ConfirmOrderOtherCell *)[nibArray objectAtIndex:0];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                [cell.renrenBtn addTarget:self action:@selector(choseDispatch:) forControlEvents:UIControlEventTouchUpInside];
            }
            int num;
            for (int i = 0; i < shopObject.productList.count; i++) {
                ShopCarProductObject *proObject = [shopObject.productList objectAtIndex:i];
                num += proObject.buyNumber;
            }
            //显示邮费
            NSDictionary *dispatchDic = shopObject.dispatchPriceDic;
            BOOL isFree = YES;
            for (NSString *dispatchKey in dispatchDic.allKeys) {
                NSString *price = [dispatchDic objectForKey:dispatchKey];
                NSString *str = [NSString stringWithFormat:@"%@ ￥%@",dispatchKey,price];
                if (price.intValue != 0) {
                    isFree = NO;
                    [cell.renrenBtn setTitle:str forState:UIControlStateNormal];
                    NSLog(@"");
                    break ;
                }
            }
            if (isFree) {
                [cell.renrenBtn setTitle:@"免邮" forState:UIControlStateNormal];
            }
            [cell.renrenBtn setTag:section-1];
            [cell.priceLabel setText:[NSString stringWithFormat:@"￥%.2f",shopObject.price]];
            [cell.numLabel setText:[NSString stringWithFormat:@"共%d件商品，",num]];
            return cell;
        }else{
            /**
             *	每条产品的cell
             */
            ShopCarProductObject *proObject = [shopObject.productList objectAtIndex:row-1];
            static NSString *cellIdentifier = @"ConfirmOrderTableViewCell";
            ConfirmOrderTableViewCell *cell = (ConfirmOrderTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (cell == nil) {
                NSBundle *bundle = [NSBundle mainBundle];
                NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
                cell = (ConfirmOrderTableViewCell *)[nibArray objectAtIndex:0];
                [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                [cell setBackgroundColor:BackGroundColor];
            }
            [cell.proNameLabel setText:proObject.name];
            [cell.proInfoLabel setText:[NSString stringWithFormat:@"%@%@",proObject.specificationValue,proObject.specificationName]];
            [cell.numberLabel setText:[NSString stringWithFormat:@"x %ld",proObject.buyNumber]];
            [cell.priceLabel setText:[NSString stringWithFormat:@"￥%.2f",proObject.buyPrice]];
            [cell.image sd_setImageWithURL:[NSURL URLWithString:proObject.originalImge] placeholderImage:DefaultImage];
            return cell;
        }
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        AddressViewController *newVC = [[AddressViewController alloc]initWithNibName:@"AddressViewController" bundle:nil];
        [self.navigationController pushViewController:newVC animated:YES];
    }else{
        
    }
    
}
/**
 *	选择快递方式
 */
- (IBAction)choseDispatch:(id)sender{
    UIButton *button = (UIButton*)sender;
    ShopCarObject *shopObject = [_selectedShopList objectAtIndex:button.tag];
    NSDictionary *dispatchDic = shopObject.dispatchPriceDic;
    
    BOOL isFree = YES;//判断是不是免邮
    for (NSString *dispatchKey in dispatchDic.allKeys) {
        NSString *price = [dispatchDic objectForKey:dispatchKey];
        if (price.intValue != 0) {
            isFree = NO;
        }
    }
    //如果不是免邮的
    if (!isFree) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"选择快递方式" message:nil preferredStyle: UIAlertControllerStyleActionSheet];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:cancelAction];
        for (NSString *dispatchKey in dispatchDic.allKeys) {
            NSString *str = [NSString stringWithFormat:@"%@ ￥%@",dispatchKey,[dispatchDic objectForKey:dispatchKey]];
            UIAlertAction *newAction = [UIAlertAction actionWithTitle:str style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                shopObject.dispatchPriceName = dispatchKey;
              //  shopObject.dispatchPrice = [dispatchDic objectForKey:dispatchKey];
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
-(void)getPayment{
    [CZCService GETmethod:kPayMentList_URL andParameters:@"" andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            NSArray *dataArr = [myresult objectForKey:@"PaymentList"];
            _paymentList = [PaymentObject objectArrayWithKeyValuesArray:dataArr];
            if (_paymentList.count > 0) {
                _paymentObject = [_paymentList objectAtIndex:0];
            }
        }
        else{
            NSLog(@"获取支付方式失败");
        }
    }];
}

/**
 *  收货地址列表
 */
-(void)getAddress{
    /** 18.收货地址列表 http://app.czctgw.com/api/address/a465788 */
    //NSString *params = @"a465788";
    [CZCService GETmethod:kAddressList_URL andParameters:kAccountObject.memLoginID andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            NSArray *dataArr = [myresult objectForKey:@"AddressList"];
            if(dataArr.count > 0){
                NSArray *list = [AddressObject objectArrayWithKeyValuesArray:dataArr];
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
                [self getDispatchPrice];//计算邮费
                [self.tableView reloadData];
            }
        }
        else{
            NSLog(@"失败");
        }
    }];
}
/**
 *	是否可以提交订单
 */
- (void)isCanOrder{
    if (_addressObj == nil) {
       [self showHUDViewTitle:@"请选择地址" info:@"" andCodes:^{
           
       }];
        return;
    }
    if (_paymentObject == nil) {
        [self showHUDViewTitle:@"请选择支付方式" info:@"" andCodes:^{
            
        }];
        return;
    }
     [_orderBtn setEnabled:YES];
}

/**
 *	生成订单号
 */
- (void)getOrderNumber{
    [CZCService GETmethod:kGetOrder_URL andParameters:@"" andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            _tradeID = [myresult objectForKey:@"OrderNumber"];
            NSLog(@" 生成订单号 ------%@",_tradeID);
        }
        else{
            NSLog(@"失败");
        }
    }];
}
/**
 *	计算邮费
 *  在地址选择之后重新计算
 */
- (void)getDispatchPrice{
//    /api/Appshopfeetemplate?productguid=82def311-4d4c-4790-bf8a-9913812ba5c5,1|82def311-4d4c-4790-bf8a-9913812ba5c5,1&code=001
    for (int n = 0; n < _selectedShopList.count; n++) {
        ShopCarObject *shopObject = [_selectedShopList objectAtIndex:n];
        NSString *params = @"productguid=";
        
        for (int i = 0; i < shopObject.productList.count; i++) {
            ShopCarProductObject *productObject = [shopObject.productList objectAtIndex:i];
            if (i == 0) {
                params = [NSString stringWithFormat:@"%@%@,%ld",params,productObject.guid,productObject.buyNumber];
            }else{
                params = [NSString stringWithFormat:@"%@|%@,%ld",params,productObject.guid,productObject.buyNumber];
            }
        }
        params = [NSString stringWithFormat:@"%@&code=%@",params,_addressObj.addressCode];
        [CZCService GETmethod:kAppShopfeetemplate_URL andParameters:params andHandle:^(NSDictionary *myresult) {
            if (myresult) {
                NSMutableDictionary *dispatchPriceDic = [myresult objectForKey:@"WL"];
                if (dispatchPriceDic) {
                    shopObject.dispatchPriceDic = dispatchPriceDic;
                }
            }
        }];
    }
    
    
}


/**
 *	提交订单
 *
 */
- (IBAction)accountClick:(id)sender{
    
    for (int n = 0; n < _selectedShopList.count; n++) {
        ShopCarObject *shopObject = [_selectedShopList objectAtIndex:n];
        
        //对象转换成字典，注意首字大写
        NSMutableArray *productDicList = [[NSMutableArray alloc]init];
        for (int i = 0; i < shopObject.productList.count; i++) {
            ShopCarProductObject *productObject = [shopObject.productList objectAtIndex:i];
            NSDictionary *productDic = [ZDYPrintObject getObjectData:productObject];//getObjectData经过修改，首字大写
            [productDicList addObject:productDic];
        }
        
        NSDictionary *dic = @{
                              @"MemLoginID":kAccountObject.memLoginID,//@"111111",
                              @"OrderNumber": _tradeID,
                              @"TradeID": _tradeID,
                              @"Name": _addressObj.name,
                              @"Email": _addressObj.email,
                              @"Address": _addressObj.address,
                              @"Postalcode":_addressObj.postalcode,
                              @"Tel": _addressObj.tel,
                              @"Mobile": _addressObj.mobile,
                              @"PaymentGuid": _paymentObject.guid,
                              @"OutOfStockOperate": @"",
                              @"ClientToSellerMsg": @"",//留言
                              @"RegionCode":@"1",//配送区域编码
                              @"PostType": @"0",//快递方式
                              @"orderPrice":@"",//订单价格
                              @"ProductPrice": @"",//产品价格
                              @"DispatchPrice": @"0.00",//邮费
                              @"ShouldPayPrice": @"248.00",//应支付
                              };
        
        
        
        NSMutableDictionary *parameters = [[NSMutableDictionary alloc]initWithDictionary:dic];
        [parameters setObject:productDicList forKey:@"ProductList"];
        
        [self showHUDBeginWithTitle:@"正在提交订单……"];
        [CZCService POSTmethod:kOrderAdd_URL andDicParameters:parameters andHandle:^(NSDictionary *myresult) {
            [self dissMissHUDEnd];
            if (myresult) {
                NSInteger result = [[myresult objectForKey:@"return"] integerValue];
                if (result == 201) {
                    [self showHUDViewTitle:@"提交订单成功！" info:@"" andCodes:^{  }];
                    return ;
                }
                NSLog(@"162222.提交订单 ------%ld",result);
            }
            [self showHUDViewTitle:@"提交订单失败！" info:@"" andCodes:^{
            }];
        }];
    }
    
    
}


@end
