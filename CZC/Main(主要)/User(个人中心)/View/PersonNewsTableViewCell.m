//
//  PersonNewsTableViewCell.m
//  CZC
//
//  Created by 张浩 on 15/7/21.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "PersonNewsTableViewCell.h"

@implementation PersonNewsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)goDetailVCClick:(id)sender {
    [self.delegate goPersonNewsDetailVC:self.cellIndex];
}
@end
