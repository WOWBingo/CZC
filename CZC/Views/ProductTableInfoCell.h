//
//  ProductTableInfoCell.h
//  CZC
//
//  Created by 周德艺 on 15/7/15.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductTableInfoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *showView;/**< 图片视图 */
@property (weak, nonatomic) IBOutlet UIView *parametersView;/**< 参数视图 */
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmented;

- (IBAction)changeSegmented:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *shopPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *oldPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhekouLabel;
@end
