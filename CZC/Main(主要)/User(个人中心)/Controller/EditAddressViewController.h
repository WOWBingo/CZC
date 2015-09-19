//
//  EditAddressViewController.h
//  CZC
//
//  Created by 张浩 on 15/8/4.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressObject.h"
@interface EditAddressViewController : PublicViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UIPickerView *pickView;
@property (nonatomic, strong) UIToolbar *toolbar;
@property (nonatomic,strong)NSString *consignee;
@property (nonatomic,strong)NSString *telNum;
@property (nonatomic,strong)NSString *postalCode;
@property (nonatomic,strong)NSString *detailAddress;

@property (nonatomic, strong) AddressObject *addressObj;
@property (nonatomic) BOOL isAdd; //区分是添加地址还是修改地址
//pickView
@property(nonatomic,strong)NSIndexPath *indexPath;
@property (nonatomic,strong)NSString *addressStr;
@property (nonatomic,strong)NSString *addressCode;
@property (nonatomic, strong) NSMutableArray *regionArr;//省市区
@property (nonatomic, strong) NSMutableArray *provinceArr;//省
@property (nonatomic, strong) NSMutableArray *cityArr;//市
@property (nonatomic, strong) NSMutableArray *districtArr;//区

- (IBAction)saveClick:(id)sender;
@end
