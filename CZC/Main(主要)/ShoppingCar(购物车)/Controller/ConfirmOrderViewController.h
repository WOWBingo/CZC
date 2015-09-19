//
//  ConfirmOrderViewController.h
//  CZC
//
//  Created by 周德艺 on 15/9/9.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "PublicViewController.h"
#import "AddressObject.h"
#import "PaymentObject.h"

@interface ConfirmOrderViewController : PublicViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *allPriceLab;
@property (weak, nonatomic) IBOutlet UIButton *orderBtn;


@property (nonatomic,strong) NSMutableArray *selectedShopList;/**< 选中的店铺 */
@property (nonatomic,strong) NSMutableArray *selectedProductList;/**< 选中的产品 */
@property (nonatomic,strong) NSMutableArray *dispatchPriceList;/**< 邮费数组 */
@property (nonatomic,strong) NSMutableArray *orderNumberList;/**< 订单号数组 */
@property (nonatomic,strong) NSMutableArray *paymentList;/**< 支付方式列表 */
@property (nonatomic,strong) PaymentObject *paymentObject;/**< 支付方式 */

@property (nonatomic,copy) NSString *tradeID;/**< 订单号 */
@property (nonatomic,strong) AddressObject *addressObj;/**< 地址 */

@property (nonatomic,strong) NSURLConnection *connection;
@property (nonatomic,strong)NSMutableData *receiveData;

- (IBAction)accountClick:(id)sender;

@end
