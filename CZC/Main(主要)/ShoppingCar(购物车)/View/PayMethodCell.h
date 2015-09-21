//
//  PayMethodTableViewCell.h
//  CZC
//
//  Created by 周德艺 on 15/9/20.
//  Copyright © 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayMethodCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *selectPayBtn;
@property (weak, nonatomic) IBOutlet UIImageView *payImageView;
@property (weak, nonatomic) IBOutlet UITextField *payNameTextField;

- (IBAction)selectPay:(id)sender;
@end
