//
//  SpecificationChoseCellTableViewCell.m
//  CZC
//
//  Created by 周德艺 on 15/8/23.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "SpecificationChoseCell.h"
#import "Masonry.h"
#import "SpecificationAllObject.h"
#import "SpecificationObject.h"
#import "SpecificationOfPriceObject.h"

static CGFloat fontSize = 14.0f;
static CGFloat intervalSize = 10.0f;

@implementation SpecificationChoseCell

- (void)awakeFromNib {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)reloadView:(SpecificationAllObject *)object{
    _object = object;
    _tags = [[NSMutableArray alloc]initWithArray:_object.specificationList];
    // 防止block中的循环引用
    //__weak typeof(self) weakSelf = self;
    
    UIButton *lastBtn = nil;
    
    __block CGFloat allWidth = 32.0;
    for ( int i = 0 ; i < _tags.count ; ++i )
    {
        SpecificationObject *speObject = [SpecificationObject objectWithKeyValues:[_tags objectAtIndex:i]];
        NSString *specName = speObject.specValueName;
        UIButton *subv = [UIButton new];
        [subv setTitle:specName forState:UIControlStateNormal];
        [subv setBackgroundColor:[UIColor whiteColor]];
        [subv setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [subv setContentEdgeInsets:UIEdgeInsetsMake(5, intervalSize, 5, intervalSize)];
        [subv.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
        [subv.layer setMasksToBounds:YES];
        [subv.layer setCornerRadius:2.0];//设置矩圆角半径,数值越大圆弧越大，反之圆弧越小
        [subv.layer setBorderWidth:1.0];//边框宽度
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0, 0, 0, 1 });//R,G,B,alpha
        [subv.layer setBorderColor:colorref];//设置边框颜色
        [subv addTarget:self action:@selector(choseSpecification:) forControlEvents:UIControlEventTouchUpInside];
        //传入的值self.tag存在，修改按钮的tag为选中类型
        if (self.tag == speObject.specValueid) {
            subv.tag = 1;
            [subv setBackgroundColor:DominantColor];
            [subv setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        [_specificationView addSubview:subv];
        
        CGSize sizeName = [specName sizeWithFont:[UIFont systemFontOfSize:fontSize]
                               constrainedToSize:CGSizeMake(MAXFLOAT, 0.0)
                                   lineBreakMode:NSLineBreakByWordWrapping];
        allWidth += sizeName.width+2*intervalSize;
        
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            if ( lastBtn )
            {
                if (allWidth > SCREEN_WIDTH) {
                    make.top.equalTo(lastBtn.mas_bottom).offset(8);
                    make.left.equalTo(_specificationView.mas_left).offset(intervalSize);
                    allWidth = 32.0;
                }else{
                    make.top.equalTo(lastBtn.mas_top);
                    make.left.equalTo(lastBtn.mas_right).offset(intervalSize);
                }
            }
            else
            {
                make.top.equalTo(_specificationView.mas_top).offset(8);
                make.left.equalTo(_specificationView.mas_left).offset(intervalSize);
            }
        }];
        lastBtn = subv;
    }
    
    [_specificationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastBtn.mas_bottom);
    }];

}
/**
 *	选择规格
 */
- (IBAction)choseSpecification:(id)sender {
    for (UIButton *btn in _specificationView.subviews) {
        if (btn.tag == 1) {
            btn.tag = 0;
            [btn setBackgroundColor:[UIColor whiteColor]];
            [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        }
    }
    UIButton *button = (UIButton*)sender;
    button.tag = 1;
    [button setBackgroundColor:DominantColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    NSString *specStr = [button titleForState:UIControlStateNormal];
    //回传选中的规格对象
    for ( int i = 0 ; i < _tags.count ; ++i )
    {
        SpecificationObject *speObject = [SpecificationObject objectWithKeyValues:[_tags objectAtIndex:i]];
        NSString *specName = speObject.specValueName;
        if ([specStr isEqualToString:specName]) {
            _specificationBlock(speObject);
        }
    }
    
}



@end
