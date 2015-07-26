//
//  ShopCollectViewController.m
//  CZC
//
//  Created by 周德艺 on 15/7/20.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ShopCollectViewController.h"
#import "ShopCollectTableViewCell.h"
#import "ShopInfoViewController.h"
#import "PopoverView.h"

@interface ShopCollectViewController ()

@end

@implementation ShopCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"店铺收藏";
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView setTableFooterView:[[UIView alloc]init]];
//    [_tableView setSeparatorColor:[UIColor clearColor]];
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 160;
}

-(void)viewWillAppear:(BOOL)animated{
}

#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 12;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (IS_IOS8_OR_ABOVE) {
        return UITableViewAutomaticDimension;
    }else{
        return 160;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    static NSString *cellIdentifier = @"ShopCollectTableViewCell";
    ShopCollectTableViewCell *cell = (ShopCollectTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
        cell = (ShopCollectTableViewCell *)[nibArray objectAtIndex:0];
        cell.moreBtn.tag = row;
        [cell.moreBtn addTarget:self action:@selector(moreView:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ShopInfoViewController *newVC = [[ShopInfoViewController alloc]initWithNibName:@"ShopInfoViewController" bundle:nil];
    [self.navigationController pushViewController:newVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)moreView:(id)sender{
    CGPoint point = CGPointMake(100, 100);
    UIButton *btn = (UIButton*)sender;
    ShopCollectTableViewCell *cell = (ShopCollectTableViewCell*) [_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:btn.tag inSection:0]];
    cell.moreView = [[PopoverView alloc] initWithPoint:btn.frame.origin ];
    cell.moreView.parentView = cell;
    cell.moreView.selectRowAtIndex = ^(NSInteger index){
        NSLog(@"select index:%d", index);
        NSLog(@"cell index:%d", btn.tag);
    };
    [cell.moreView show];
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
