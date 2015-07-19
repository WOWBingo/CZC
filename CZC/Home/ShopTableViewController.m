//
//  ShopTableViewController.m
//  CZC
//
//  Created by 周德艺 on 15/7/15.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ShopTableViewController.h"
#import "ShopTableViewCell.h"

@interface ShopTableViewController ()

@end

@implementation ShopTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"展示分站";

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
    
    static NSString *cellIdentifier = @"ShopTableViewCell";
    ShopTableViewCell *cell = (ShopTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
        cell = (ShopTableViewCell *)[nibArray objectAtIndex:0];
        
        [[cell.shopImageView layer] setShadowOffset:CGSizeMake(1, 1)];//偏移量
        [[cell.shopImageView layer] setShadowRadius:1];//宽度
        [[cell.shopImageView layer] setShadowOpacity:1];//透明
        [[cell.shopImageView layer] setShadowColor:[UIColor grayColor].CGColor];
        [cell.shopImageView.layer setMasksToBounds:YES];
        [cell.shopImageView.layer setCornerRadius:cell.shopImageView.frame.size.width/2+2];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return cell;
}



@end
