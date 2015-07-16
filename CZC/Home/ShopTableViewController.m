//
//  ShopTableViewController.m
//  CZC
//
//  Created by 周德艺 on 15/7/15.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ShopTableViewController.h"
#import "HundredTableViewCell.h"

@interface ShopTableViewController ()

@end

@implementation ShopTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat w = (SCREEN_WIDTH-16)/4;
    [PublicObject drawVerticalLineOnView:_tableHeadView andX:w andY:0 andHeigt:_tableHeadView.frame.size.height andColor:[UIColor lightGrayColor]];
    [PublicObject drawVerticalLineOnView:_tableHeadView andX:2*w andY:0 andHeigt:_tableHeadView.frame.size.height andColor:[UIColor lightGrayColor]];
    [PublicObject drawVerticalLineOnView:_tableHeadView andX:3*w andY:0 andHeigt:_tableHeadView.frame.size.height andColor:[UIColor lightGrayColor]];
    
    /**
     *	设置阴影
     */
    [[_tableHeadView layer] setShadowOffset:CGSizeMake(1, 1)];//偏移量
    [[_tableHeadView layer] setShadowRadius:0.5];//宽度
    [[_tableHeadView layer] setShadowOpacity:1];//透明
    [[_tableHeadView layer] setShadowColor:[UIColor lightGrayColor].CGColor];
    
    // Do any additional setup after loading the view from its nib.
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView setTableFooterView:[[UIView alloc]init]];
    [_tableView setSeparatorColor:[UIColor clearColor]];
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = SCREEN_WIDTH;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_WIDTH*0.3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"HundredTableViewCell";
    HundredTableViewCell *cell = (HundredTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
        cell = (HundredTableViewCell *)[nibArray objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return cell;
}



@end
