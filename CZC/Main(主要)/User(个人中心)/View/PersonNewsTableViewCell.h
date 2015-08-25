//
//  PersonNewsTableViewCell.h
//  CZC
//
//  Created by 张浩 on 15/7/21.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol PersonNewsCellDelegate
-(void)goPersonNewsDetailVC:(int)cellIndex;
@end
@interface PersonNewsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (weak, nonatomic) IBOutlet UILabel *contentLab;
@property (nonatomic)int cellIndex;
@property (nonatomic,assign)id <PersonNewsCellDelegate>delegate;

- (IBAction)goDetailVCClick:(id)sender;
@end
