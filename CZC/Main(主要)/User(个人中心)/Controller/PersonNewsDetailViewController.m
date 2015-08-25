//
//  PersonNewsDetailViewController.m
//  CZC
//
//  Created by 张浩 on 15/8/24.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "PersonNewsDetailViewController.h"

@interface PersonNewsDetailViewController ()

@end

@implementation PersonNewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息详情";
}
-(void)viewWillAppear:(BOOL)animated{
    self.titleLab.text = self.messageObj.title;
    self.timeLab.text = self.messageObj.sendTime;
    self.contentLab.text = self.messageObj.content;
    [self changMessageStatus:self.messageObj.guid];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)changMessageStatus:(NSString *)messageGuid{
#pragma mark - 消息已读
    /** 消息已读 http://app.czctgw.com/api/membermessage/IsReaded?Guid=409de06e-9c9c-4d6e-8e3b-6b125a699d27*/
    [CZCService GETmethod:kMemberMessageIsReaded_URL andParameters:messageGuid andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            NSNumber *temp = [myresult objectForKey:@"return"];
            NSString *status = [NSString stringWithFormat:@"%@",temp];
            NSLog(@"%@",status);
            if ([status isEqualToString:@"202"]) {
                NSLog(@"消息已读");
            }else{
                NSLog(@"消息读取失败");
            }
        }
        else{
            NSLog(@"失败");
        }
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
