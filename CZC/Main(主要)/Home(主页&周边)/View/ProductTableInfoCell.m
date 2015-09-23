//
//  ProductTableInfoCell.m
//  CZC
//
//  Created by 周德艺 on 15/7/15.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ProductTableInfoCell.h"
#import "Masonry.h"

@implementation ProductTableInfoCell

- (void)awakeFromNib {
    
    // 防止block中的循环引用
    // __weak typeof(self) weakSelf = self;
    
    int count = 17;
    
    UIImageView *lastImageView = nil;
    
    for ( int i = 0 ; i < count ; ++i )
    {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"zy-p%d",i+1]];
        //CGSize imgSize = image.size;
        UIImageView *subv = [[UIImageView alloc]initWithImage:image];
        [subv setContentMode:UIViewContentModeScaleAspectFit];
        [_showView addSubview:subv];
        
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(_showView);
            /**
             *	计算高度
             */
            // make.height.mas_equalTo(_showView.frame.size.width*imgSize.height/imgSize.width);
            if ( lastImageView )
            {
                make.top.equalTo(lastImageView.mas_bottom).offset(5);
            }
            else
            {
                make.top.equalTo(_showView.mas_top);
            }
        }];
        
        lastImageView = subv;
    }
    
    [_showView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastImageView.mas_bottom);
    }];
    
    
    NSArray *titleArr = @[@"名称",@"大小",@"颜色",@"制造商",@"洗涤方式",@"内存大小",@"系统",@"摄像头",@"屏幕",@"电池",@"配件",@"备注",@"其他" ];
    NSArray *infoArr = @[@"这个玩意是啥我也不是很清楚",@"我估计应该不会太大吧",@"我比较喜欢黑色",@"made in China",@"手洗",@"1000G",@"iOS9",@"1200W",@"320*480",@"10000",@"耳机",@"这是一条长的备注这是一条长的备注这是一条长的备注这是一条长的备注这是一条长的备注这是一条长的备注这是一条长的备注这是一条长的备注这是一条长的备注这是一条长的备注这是一条长的备注这是一条长的备注这是一条长的备注这是一条长的备注这是一条长的备注",@"没了" ];
    int parametersCount = (int)titleArr.count;
    
    UILabel *lastTitleLable = nil;
    for ( int i = 0 ; i < parametersCount ; ++i )
    {
        
        UILabel *subTitleLabel = [UILabel new];
        UILabel *subInfoLabel = [UILabel new];
        [subTitleLabel setNumberOfLines:0];
        [subInfoLabel setNumberOfLines:0];
        subTitleLabel.text = [titleArr objectAtIndex:i];
        subInfoLabel.text = [infoArr objectAtIndex:i];
        
        [_parametersView addSubview:subTitleLabel];
        [_parametersView addSubview:subInfoLabel];
        [subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.equalTo(_parametersView.mas_left);
            make.right.equalTo(subInfoLabel.mas_left).offset(10);
            make.width.equalTo(subInfoLabel);
            
            // make.height.mas_equalTo(_parametersView.frame.size.width*imgSize.height/imgSize.width);
            if (lastTitleLable )
            {
                make.top.equalTo(lastTitleLable.mas_bottom).offset(4);
            }
            else
            {
                make.top.equalTo(_parametersView.mas_top);
            }
        }];
        [subInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(subTitleLabel.mas_top);
            make.width.equalTo(subTitleLabel);
            make.right.top.equalTo(_parametersView);
            make.left.equalTo(subTitleLabel.mas_right);
        }];
        
        lastTitleLable = subInfoLabel;
    }
    
    //
    //        [_parametersView mas_makeConstraints:^(MASConstraintMaker *make) {
    //            make.bottom.equalTo(lastTitleLable.mas_bottom);
    //        }];
    //
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (IBAction)changeSegmented:(id)sender {
    _showView.hidden = !_showView.hidden;
    _parametersView.hidden = !_parametersView.hidden;
}
@end
