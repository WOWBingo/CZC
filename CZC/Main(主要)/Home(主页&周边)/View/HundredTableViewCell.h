//
//  HundredTableViewCell.h
//  CZC
//
//  Created by 周德艺 on 15/7/15.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HundredTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *boxView;
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;/**< 产品图片 */
@property (weak, nonatomic) IBOutlet UILabel *nameLable;/**< 产品名Lable */
@property (weak, nonatomic) IBOutlet UILabel *discountLable;/**< 折扣Lable */
@property (weak, nonatomic) IBOutlet UILabel *priceLable;/**< 价格labl */
@property (weak, nonatomic) IBOutlet UILabel *postageLable;/**< 邮费Lable */

@end
