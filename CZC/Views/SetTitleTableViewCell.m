//
//  SetTitleTableViewCell.m
//  CZC
//
//  Created by 张浩 on 15/7/7.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "SetTitleTableViewCell.h"

@implementation SetTitleTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //设置背景色
        UIImageView *backImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 160)];
        [backImg setImage:[UIImage imageNamed:@"head_pic"]];
        [self.contentView addSubview:backImg];
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 160)];
        [backView setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:backView];
        //设置按钮
        UIButton *setBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 15 , 30 , 30)];
        [setBtn setBackgroundImage:[UIImage imageNamed:@"head_tb1"] forState:UIControlStateNormal];
        [setBtn addTarget:self action:@selector(setUpClick:) forControlEvents:UIControlEventTouchUpInside];
        [backView addSubview:setBtn];
        //消息按钮
        UIView *newsView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-20-40, 15, 40, 30)];
        [backView addSubview:newsView];
        UIButton *newsBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        [newsBtn setBackgroundImage:[UIImage imageNamed:@"head_tb2"] forState:UIControlStateNormal];
        [newsBtn addTarget:self action:@selector(newsClick:) forControlEvents:UIControlEventTouchUpInside];
        [newsView addSubview:newsBtn];
        self.popBtn = [[UIButton alloc]initWithFrame:CGRectMake(33, 0, 10, 10)];
        [self.popBtn setBackgroundImage:[UIImage imageNamed:@"head_tb3"] forState:UIControlStateNormal];
        [self.popBtn addTarget:self action:@selector(newsClick:) forControlEvents:UIControlEventTouchUpInside];
        [newsView addSubview:self.popBtn];
        //头像
        UIButton *iconBackBtn = [[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 60) / 2, 25, 60, 60)];
        [iconBackBtn setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.5]];
        iconBackBtn.layer.masksToBounds = YES;
        iconBackBtn.layer.cornerRadius = iconBackBtn.frame.size.width / 2;
        [backView addSubview:iconBackBtn];
        
        self.iconBtn = [[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH - 60) / 2 + 5, 30, 50, 50)];
        [self.iconBtn setImage:[UIImage imageNamed:@"head_tb4"] forState:UIControlStateNormal];
        self.iconBtn.layer.masksToBounds = YES;
        self.iconBtn.layer.cornerRadius = self.iconBtn.frame.size.width / 2;
        [backView addSubview:self.iconBtn];
        //会员
        self.vipTypeLab = [[UILabel alloc]initWithFrame:CGRectMake(iconBackBtn.frame.origin.x+iconBackBtn.frame.size.width+10, newsView.frame.origin.y+newsView.frame.size.height+5, 150, 10)];
        self.vipTypeLab.font = [UIFont systemFontOfSize:10];
        self.vipTypeLab.textColor = [UIColor whiteColor];
        self.vipTypeLab.text = @"普通会员";
        [backView addSubview:self.vipTypeLab];
        self.vipNumLab = [[UILabel alloc]initWithFrame:CGRectMake(self.vipTypeLab.frame.origin.x, self.vipTypeLab.frame.origin.y+self.vipTypeLab.frame.size.height, 150, 30)];
        self.vipNumLab.font = [UIFont systemFontOfSize:10];
        self.vipNumLab.textColor = [UIColor whiteColor];
        self.vipNumLab.text = @"8899053800000001";
        [backView addSubview:self.vipNumLab];
        //tab
        UIView *tabView = [[UIView alloc]initWithFrame:CGRectMake(0, 160-44, SCREEN_WIDTH, 44)];
        tabView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.5];
        [backView addSubview:tabView];
        //个人信息
        UIView *userInfoView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/3, 44)];
        //添加点击事件
        userInfoView.userInteractionEnabled = YES;
        UITapGestureRecognizer *click = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userInfoShowClick)];
        [userInfoView addGestureRecognizer:click];
        [tabView addSubview:userInfoView];
        UIImageView *userImg = [[UIImageView alloc]initWithFrame:CGRectMake(userInfoView.frame.size.width/2-10, 5, 15, 15)];
        [userImg setImage:[UIImage imageNamed:@"head_tb5"]];
        [userInfoView addSubview:userImg];
        UILabel *userInfoLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, userInfoView.frame.size.width, 15)];
        userInfoLab.text = @"个人信息";
        userInfoLab.textAlignment = UITextAlignmentCenter;
        userInfoLab.font = [UIFont systemFontOfSize:12];
        userInfoLab.textColor = [UIColor whiteColor];
        [userInfoView addSubview:userInfoLab];
        //产品收藏
        UIView *proCollectView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3, 0, SCREEN_WIDTH/3, 44)];
        [tabView addSubview:proCollectView];
        self.proCollectNumLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, proCollectView.frame.size.width, 15)];
        self.proCollectNumLab.font = [UIFont systemFontOfSize:12];
        self.proCollectNumLab.text = @"2";
        self.proCollectNumLab.textAlignment = UITextAlignmentCenter;
        self.proCollectNumLab.textColor = [UIColor whiteColor];
        [proCollectView addSubview:self.proCollectNumLab];
        UILabel *proCollectLab = [[UILabel alloc]initWithFrame:CGRectMake(0,20, proCollectView.frame.size.width, 15)];
        proCollectLab.text = @"产品收藏";
        proCollectLab.textAlignment = UITextAlignmentCenter;
        proCollectLab.textColor = [UIColor whiteColor];
        proCollectLab.font = [UIFont systemFontOfSize:12];
        [proCollectView addSubview:proCollectLab];
        //店铺收藏
        UIView *shopCollectView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3*2, 0, SCREEN_WIDTH/3, 44)];
        [tabView addSubview:shopCollectView];
        self.shopCollectNumLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, shopCollectView.frame.size.width, 15)];
        self.shopCollectNumLab.font = [UIFont systemFontOfSize:12];
        self.shopCollectNumLab.text = @"6";
        self.shopCollectNumLab.textAlignment = UITextAlignmentCenter;
        self.shopCollectNumLab.textColor = [UIColor whiteColor];
        [shopCollectView addSubview:self.shopCollectNumLab];
        UILabel *shopCollectLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, shopCollectView.frame.size.width, 15)];
        shopCollectLab.text = @"店铺收藏";
        shopCollectLab.textAlignment = UITextAlignmentCenter;
        shopCollectLab.textColor = [UIColor whiteColor];
        shopCollectLab.font = [UIFont systemFontOfSize:12];
        [shopCollectView addSubview:shopCollectLab];
    }
    self.userInteractionEnabled = YES;
    return self;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
-(void)userInfoShowClick{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"userInfo"　object:nil];
}
@end
