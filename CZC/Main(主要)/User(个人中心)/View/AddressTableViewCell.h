//
//  AddressTableViewCell.h
//  CZC
//
//  Created by 张浩 on 15/7/16.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressObject.h"
@protocol AddressTableViewCellDelegate
-(void)setDefaultAddress:(AddressObject *)addressObj andCellIndex:(NSInteger)cellIndex;
-(void)pushToEditView:(AddressObject *)addressObj andCellIndex:(NSInteger)cellIndex;
-(void)deleteAddress:(AddressObject *)addressObj andCellIndex:(NSInteger)cellIndex;
@end

@interface AddressTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *telLab;
@property (weak, nonatomic) IBOutlet UILabel *addressLab;
@property (weak, nonatomic) IBOutlet UIButton *defaultImgBtn;
@property (weak, nonatomic) IBOutlet UIButton *defaultBtn;
@property (weak, nonatomic) IBOutlet UIButton *editImgBtn;
@property (weak, nonatomic) IBOutlet UIButton *editBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteImgBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (nonatomic,strong) AddressObject *addressObj;
@property (nonatomic,assign)id <AddressTableViewCellDelegate>delegate;
@property (nonatomic) NSInteger cellIndex;

- (IBAction)defaultClick:(id)sender;
- (IBAction)editClick:(id)sender;
- (IBAction)deleteClick:(id)sender;
@end
