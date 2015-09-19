//
//  PotintsDetailsViewController.m
//  CZC
//
//  Created by 张浩 on 15/8/30.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "PotintsDetailsViewController.h"
#import "PotintsDetailsTableViewCell.h"
#import "PopView.h"
@interface PotintsDetailsViewController ()

@end

@implementation PotintsDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNotification:) name:@"infoTypeTag" object:nil];
    self.title = @"积分明细";
    self.typeArray = [[NSMutableArray alloc]initWithObjects:@"全部",@"支出",@"收入",nil];
    //给导航按钮的titleView
    UIView *titleView = [[UIView alloc]init];
    titleView.backgroundColor = [UIColor clearColor];
    self.titleLab = [[UILabel alloc]init];
    NSString *tempName = [self.typeArray objectAtIndex:0];
    self.typeTag = 0;
    CGSize labelSize = [tempName sizeWithFont:[UIFont systemFontOfSize:20.0] constrainedToSize:CGSizeMake(300, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];// 这里限制宽300, 不限制高度
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, labelSize.width, labelSize.height)];
    self.titleLab.text = tempName;
    self.titleLab.textColor = [UIColor whiteColor];
    self.titleImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"infoTypeDown.png"]];
    self.titleImg.frame = CGRectMake(self.titleLab.frame.origin.x + self.titleLab.frame.size.width, self.titleLab.frame.origin.y+5, 15, 15);
    titleView.frame = CGRectMake(self.navigationItem.titleView.frame.origin.x, self.navigationItem.titleView.frame.origin.y,self.titleLab.frame.size.width + self.titleImg.frame.size.width + 25, 36);
    self.navigationItem.titleView = titleView;
    titleView.center = self.navigationItem.titleView.center;
    [titleView addSubview:self.titleLab];
    [titleView addSubview:self.titleImg];
    titleView.userInteractionEnabled = YES;
    UITapGestureRecognizer *click = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectClicked)];
    [titleView addGestureRecognizer:click];
    self.navigationItem.titleView = titleView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma tableviewdatesource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"PotintsDetailsTableViewCell";
    PotintsDetailsTableViewCell *cell = (PotintsDetailsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:CellIdentifier owner:self options:nil];
        cell = (PotintsDetailsTableViewCell *)[nibArray objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
#pragma tableviewdelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)selectClicked{
    [self.titleImg setImage:[UIImage imageNamed:@"infoTypeUp.png"]];
    
    CGPoint point = CGPointMake(self.navigationController.navigationBar.frame.size.width/2, 0+self.navigationController.navigationBar.frame.size.height+20);
    PopView *pop = [[PopView alloc] initWithPoint:point titles:self.typeArray images:nil];
    pop.selectRowAtIndex = ^(NSInteger index){
        NSLog(@"select index:%ld", (long)index);
    };
    pop.titleName = self.titleLab.text;
    NSLog(@"%@",pop.titleName);
    [pop show];
}
//定义接受广播的方法
- (void)getNotification:(NSNotification *)notification {
    NSDictionary *mydata = [notification userInfo];
    UIView *titleView = [[UIView alloc]init];
    titleView.backgroundColor = [UIColor clearColor];
    NSString *typeTag = [mydata objectForKey:@"typeTag"];
    NSString *typeName = [mydata objectForKey:@"typeName"];
    NSLog(@"%@",typeName);
    CGSize labelSize = [typeName sizeWithFont:[UIFont systemFontOfSize:20.0] constrainedToSize:CGSizeMake(300, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];// 这里限制宽300, 不限制高度
    NSLog(@"%f",labelSize.width);
    
    self.titleLab.frame = CGRectMake(15, 5, labelSize.width, labelSize.height);
    self.titleLab.text = typeName;
    self.titleImg.frame = CGRectMake(self.titleLab.frame.origin.x + self.titleLab.frame.size.width, self.titleLab.frame.origin.y+5, 15, 15);
    NSLog(@"%f",self.titleLab.frame.size.width);
    titleView.frame = CGRectMake(self.navigationItem.titleView.frame.origin.x, self.navigationItem.titleView.frame.origin.y,self.titleLab.frame.size.width + self.titleImg.frame.size.width + 25, 36);
    NSLog(@"%f",titleView.frame.size.width);
    self.navigationItem.titleView = titleView;
    titleView.center = self.navigationItem.titleView.center;
    [titleView addSubview:self.titleLab];
    [titleView addSubview:self.titleImg];
    titleView.userInteractionEnabled = YES;
    UITapGestureRecognizer *click = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(selectClicked)];
    [titleView addGestureRecognizer:click];
    [self.titleImg setImage:[UIImage imageNamed:@"infoTypeDown.png"]];
    self.typeTag = [typeTag intValue];
}
- (void)dissPop:(NSNotification *)notification {
    [self.titleImg setImage:[UIImage imageNamed:@"infoTypeDown.png"]];
}

@end
