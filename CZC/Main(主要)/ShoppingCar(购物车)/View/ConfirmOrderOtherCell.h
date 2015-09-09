//
//  ConfirmOrderOtherCell.h
//  CZC
//
//  Created by 周德艺 on 15/9/9.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfirmOrderOtherCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *messageTextField;
@property (weak, nonatomic) IBOutlet UIButton *renrenBtn;
@property (weak, nonatomic) IBOutlet UIButton *generalBtn;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

- (IBAction)chooseLogistics:(id)sender;

@end
