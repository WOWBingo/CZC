//
//  PersonNewsViewController.m
//  CZC
//
//  Created by 张浩 on 15/7/21.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "PersonNewsViewController.h"
#import "PersonNewsTableViewCell.h"
#import "MessageObject.h"
#import "PersonNewsDetailViewController.h"
#import <MJRefresh.h>
@interface PersonNewsViewController ()

@end

@implementation PersonNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的消息";
    self.newsArr = [[NSMutableArray alloc]init];
    //设置导航栏按钮
    
    UIButton *setBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    [setBtn setImage:[UIImage imageNamed:@"head_tb1"] forState:UIControlStateNormal];
    //[setBtn addTarget:self action:@selector(setClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:setBtn];
    
    //设置tableView的cel有内容时显示分割线，无内容时，不显示分割线
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.pageIndex = 1;
    [self getWithPage:self.pageIndex];
}
-(void)viewWillAppear:(BOOL)animated{
    //下拉刷新
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        if (self.pageIndex !=1) {
            self.pageIndex--;
        }else{
            self.pageIndex =1;
            [self showHUDViewTitle:@"已经是第一页了" info:@"" andCodes:^{
            }];
        }
        [self getWithPage:self.pageIndex];
    }];
    //    // 马上进入刷新状态
    //    [self.tableView.header beginRefreshing];
    
    //上拉刷新
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        if (self.pageIndex != self.allPageNum) {
            self.pageIndex++;
        }else{
            self.pageIndex = self.allPageNum;
            [self showHUDViewTitle:@"已经是最后一页了" info:@"" andCodes:^{
            }];
        }
        [self getWithPage:self.pageIndex];
    }];
    //    // 马上进入刷新状态
    //    [self.tableView.footer beginRefreshing];
}
-(void)getWithPage:(int)pageIndex{
#pragma mark - 29.会员消息列表
    /** 29.会员消息列表 http://app.czctgw.com/api/membermessage/list/1/hyx888*/
    NSString *params = [NSString stringWithFormat:@"%d/hyx888",self.pageIndex];
    [CZCService GETmethod:kMemberMessage_URL andParameters:params andHandle:^(NSDictionary *myresult) {
        [self.tableView.header endRefreshing];
        [self.tableView.footer endRefreshing];
        if (myresult) {
            NSInteger count = [[myresult objectForKey:@"Count"]integerValue];
            NSArray *dataArr = [myresult objectForKey:@"Data"];
            NSArray *list = [MessageObject objectArrayWithKeyValuesArray:dataArr];
            self.newsArr = [[NSMutableArray alloc]initWithArray:list];
            self.allPageNum = (int)count/5+1;
            NSLog(@"29.会员消息列表 ------%@",list);
            [self.tableView reloadData];
        }
        else{
            NSLog(@"失败");
        }
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.newsArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PersonNewsTableViewCell";
    PersonNewsTableViewCell *cell = (PersonNewsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:CellIdentifier owner:self options:nil];
        cell = (PersonNewsTableViewCell *)[nibArray objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    //加载数据
    cell.delegate = self;
    cell.cellIndex = (int)indexPath.row;
    MessageObject *messageObj = [self.newsArr objectAtIndex:indexPath.row];
    cell.timeLab.text = messageObj.sendTime;
    cell.contentLab.text = messageObj.content;
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //删除
#pragma mark - 29.会员消息列表
        /** 29.会员消息列表 http://app.czctgw.com/api/membermessage/delete/?msgId=75df9d79-8a3b-4685-864d-46f1ded476a7&MemLoginID=111111
         */
        //获取memloginID
        //NSString *memLoginId = @"111111";
        //获取messageId
        MessageObject *messageObj = [self.newsArr objectAtIndex:indexPath.row];
        NSString *params = [NSString stringWithFormat:@"%@%@",kAccountObject.memLoginID,messageObj.guid];
        [CZCService GETmethod:kMemberMessageDelete_URL andParameters:params andHandle:^(NSDictionary *myresult) {
            if (myresult) {
                NSNumber *temp = [myresult objectForKey:@"return"];
                NSString *status = [NSString stringWithFormat:@"%@",temp];
                NSLog(@"%@",status);
                if ([status isEqualToString:@"202"]) {
                    NSLog(@"消息已删除");
                    [self.tableView reloadData];
                }else{
                    NSLog(@"消息删除失败");
                }
            }
            else{
                NSLog(@"失败");
            }
        }];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    
    //    switch (indexPath.section) {
    
}
-(void)goPersonNewsDetailVC:(int)cellIndex{
    PersonNewsDetailViewController *personNewsDetailVC = [[PersonNewsDetailViewController alloc]initWithNibName:@"PersonNewsDetailViewController" bundle:nil];
    personNewsDetailVC.messageObj = [self.newsArr objectAtIndex:cellIndex];
    [self.navigationController pushViewController:personNewsDetailVC animated:YES];
}
@end
