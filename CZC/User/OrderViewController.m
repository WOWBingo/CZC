//
//  OrderDetailsViewController.m
//  CZC
//
//  Created by 张浩 on 15/8/16.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "OrderViewController.h"
#import "OrderDetailsTableViewCell.h"

@interface OrderViewController ()

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单明细";
    //创建segmentControl
    LjjUISegmentedControl* ljjuisement=[[LjjUISegmentedControl alloc]initWithFrame:CGRectMake(0, 64,SCREEN_WIDTH,34)];
    ljjuisement.delegate = self;
    NSArray* ljjarray=[NSArray arrayWithObjects:@"全部",@"待付款",@"待发货",@"待收货",@"待评价",nil];
    [ljjuisement AddSegumentArray:ljjarray];
    [self.view addSubview:ljjuisement];
    self.view.backgroundColor = [UIColor redColor];
    
    //创建tableView
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    //Change the background color
//    ljjuisement.LJBackGroundColor=[UIColor BlackColor];
    
    //Change Title color
//    ljjuisement.titleColor=[UIColor BlackColor];
    
    //Change the Color of selectionButton
//    ljjuisement.selectColor=[UIColor BlackColor];
    
    //Change the buttonTitle Font
//    ljjuisement.titleFont=[UIFont fontWithName:@".Helvetica Neue Interface" size:14.0f];
    
    //Select the Button
    [ljjuisement selectTheSegument:0];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"OrderDetailsTableViewCell";
    OrderDetailsTableViewCell *cell = (OrderDetailsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:CellIdentifier owner:self options:nil];
        cell = (OrderDetailsTableViewCell *)[nibArray objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    //划线
    [PublicObject drawHorizontalLineOnView:cell.backView andX:cell.backView.frame.origin.x andY:cell.imgView.frame.origin.y+cell.imgView.frame.size.height+8 andWidth:SCREEN_WIDTH-16 andColor:[UIColor grayColor]];
    [PublicObject drawHorizontalLineOnView:cell.backView andX:cell.backView.frame.origin.x andY:cell.proNumLab.frame.origin.y+cell.proNumLab.frame.size.height+8 andWidth:SCREEN_WIDTH-16 andColor:[UIColor grayColor]];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //    if (IS_IOS8_OR_ABOVE) {
    //        return UITableViewAutomaticDimension;
    //    }else{
    return 180;
    //    }
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    //    switch (indexPath.section) {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - uisegument
-(void)uisegumentSelectionChange:(NSInteger)selection{
    NSLog(@"%ld",(long)selection);
}

@end
