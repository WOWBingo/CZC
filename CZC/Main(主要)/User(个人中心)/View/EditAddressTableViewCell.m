//
//  EditAddressTableViewCell.m
//  CZC
//
//  Created by 张浩 on 15/8/4.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "EditAddressTableViewCell.h"

@implementation EditAddressTableViewCell

- (void)awakeFromNib {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(hidenKeyboard:)
                                                 name:@"hidenEditAddressTextField"
                                               object:nil];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void)hidenKeyboard:(NSNotification *)notification{
    [self.infoText resignFirstResponder];
}
@end
