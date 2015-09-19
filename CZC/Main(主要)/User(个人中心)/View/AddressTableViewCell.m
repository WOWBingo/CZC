//
//  AddressTableViewCell.m
//  CZC
//
//  Created by 张浩 on 15/7/16.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "AddressTableViewCell.h"

@implementation AddressTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)defaultClick:(id)sender {
    [self.delegate setDefaultAddress:self.addressObj andCellIndex:self.cellIndex];
}

- (IBAction)editClick:(id)sender {
    [self.delegate pushToEditView:self.addressObj andCellIndex:self.cellIndex];
}

- (IBAction)deleteClick:(id)sender {
    [self.delegate deleteAddress:self.addressObj andCellIndex:self.cellIndex];
}
@end
