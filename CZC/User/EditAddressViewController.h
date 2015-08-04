//
//  EditAddressViewController.h
//  CZC
//
//  Created by 张浩 on 15/8/4.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#define PROVINCE_COMPONENT  0
#define CITY_COMPONENT      1
#define DISTRICT_COMPONENT  2
@interface EditAddressViewController : PublicViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIPickerViewDelegate, UIPickerViewDataSource>{
    UIPickerView *picker;
    UIButton *button;
    
    NSDictionary *areaDic;
    NSArray *province;
    NSArray *city;
    NSArray *district;
    
    NSString *selectedProvince;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (nonatomic, strong) UIToolbar *toolbar;
- (IBAction)saveClick:(id)sender;
@end
