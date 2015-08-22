//
//  ShopTableViewCell.h
//  CZC
//
//  Created by 周德艺 on 15/7/16.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *boxView;/**< */
@property (weak, nonatomic) IBOutlet UIImageView *shopImageView;/**< 店图 */
@property (weak, nonatomic) IBOutlet UILabel *nameLable;/**< 店名 */
@property (weak, nonatomic) IBOutlet UILabel *discountLable; /**< 折扣 */
@property (weak, nonatomic) IBOutlet UIButton *collectBtn; /**< 收藏按钮*/
@property (weak, nonatomic) IBOutlet UILabel *distanceLable;/**< 距离*/
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;/**< */
- (IBAction)collect:(id)sender;
- (IBAction)deleteShop:(id)sender;

@end
