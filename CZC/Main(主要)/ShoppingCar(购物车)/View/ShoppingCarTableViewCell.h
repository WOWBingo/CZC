//
//  ShoppingCarTableViewCell.h
//  CZC
//
//  Created by 张浩 on 15/7/15.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJCAjustNumButton.h"
#import "ZDYCheckButton.h"


@interface ShoppingCarTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet ZDYCheckButton *chooseBtn;
@property (weak, nonatomic) IBOutlet UIButton *delBtn;

@property (weak, nonatomic) IBOutlet UIView *infoView;/**<  */
@property (weak, nonatomic) IBOutlet UIImageView *titleImg;/**< 图片 */
@property (weak, nonatomic) IBOutlet UILabel *titleLab;/**< 名 */
@property (weak, nonatomic) IBOutlet UILabel *centerLab;/**< 信息 */
@property (weak, nonatomic) IBOutlet UILabel *oldPriceLab;/**< 原价 */
@property (weak, nonatomic) IBOutlet UILabel *nowPriceLab;/**< 现价 */
@property (nonatomic, strong) HJCAjustNumButton *numBtn;/**< 数量 */
@property (nonatomic) int *productNumber;/**< 数量 */

- (IBAction)addClick:(id)sender;
- (IBAction)delClick:(id)sender;
@end
