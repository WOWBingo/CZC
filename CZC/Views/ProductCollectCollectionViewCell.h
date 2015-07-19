//
//  ProductCollectCollectionViewCell.h
//  CZC
//
//  Created by 张浩 on 15/7/13.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductCollectCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *proImageView;
@property (weak, nonatomic) IBOutlet UILabel *proInfoLab;

@property (weak, nonatomic) IBOutlet UILabel *proPriceLab;
@property (weak, nonatomic) IBOutlet UIView *boxView;

-(void)editFrame:(BOOL)isEdited andIndexPath:(NSIndexPath *)indexPath;

@end
