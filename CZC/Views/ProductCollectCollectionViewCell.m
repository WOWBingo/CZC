//
//  ProductCollectCollectionViewCell.m
//  CZC
//
//  Created by 张浩 on 15/7/13.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ProductCollectCollectionViewCell.h"

@implementation ProductCollectCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"ProductCollectCollectionViewCell" owner:self options:nil];
        
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]])
        {
            return nil;
        }
        // 加载nib
        self = [arrayOfViews objectAtIndex:0];
    }
    return self;
}

-(void)editFrame:(BOOL)isEdited andIndexPath:(NSIndexPath *)indexPath{
    if (isEdited) {
        if (indexPath.row%2) {
            _boxView.frame = CGRectMake(_boxView.frame.origin.x + 24, 0, _boxView.frame.size.width, _boxView.frame.size.height);
        }else{
            _boxView.frame = CGRectMake(_boxView.frame.origin.x - 24, 0, _boxView.frame.size.width, _boxView.frame.size.height);
        }
        
    }else{
        _boxView.frame = CGRectMake(0, 0, _boxView.frame.size.width, _boxView.frame.size.height);
    }
}

@end
