//
//  HomeViewCell.h
//  CZC
//
//  Created by 周德艺 on 15/7/7.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewButton.h"

@interface HomeViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *showView;
@property (weak, nonatomic) IBOutlet UIButton *moreBtn;
@property (weak, nonatomic) IBOutlet HomeViewButton *topLeftBtn;
@property (weak, nonatomic) IBOutlet HomeViewButton *topRightBtn;
@property (weak, nonatomic) IBOutlet HomeViewButton *bottomLeftBtn;
@property (weak, nonatomic) IBOutlet HomeViewButton *bottomMidBtn;
@property (weak, nonatomic) IBOutlet HomeViewButton *bottomRightBtn;

- (IBAction)shopInfo:(id)sender;
//设置button的唯一标识符
- (void)buttonAddCellNum:(NSInteger)cellNum;
- (IBAction)getMore:(id)sender;

@end
