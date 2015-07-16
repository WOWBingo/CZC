//
//  ProductTableInfoCell.h
//  CZC
//
//  Created by 周德艺 on 15/7/15.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductTableInfoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *showView;
@property (weak, nonatomic) IBOutlet UIView *parametersView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmented;
- (IBAction)changeSegmented:(id)sender;

@end
