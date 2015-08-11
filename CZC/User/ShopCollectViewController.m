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
#import "AppDelegate.h"
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
    NSLog(@"%ld",(long)row);
    static NSString *cellIdentifier = @"ShopCollectTableViewCell";
    ShopCollectTableViewCell *cell = (ShopCollectTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
        cell = (ShopCollectTableViewCell *)[nibArray objectAtIndex:0];
        cell.moreBtn.tag = row;
        cell.delegate = self;
//        [cell.moreBtn addTarget:self action:@selector(moreView:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    cell.cellIndexPath = indexPath;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    ShopInfoViewController *newVC = [[ShopInfoViewController alloc]initWithNibName:@"ShopInfoViewController" bundle:nil];
//    [self.navigationController pushViewController:newVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)moreView:(ShopCollectTableViewCell *)cell andPopoverView:(PopoverView *)view{
    //获取tableviewCell在当前屏幕中的坐标值
    CGRect rectInTableView = [self.tableView rectForRowAtIndexPath:cell.cellIndexPath];
    CGRect rect = [self.tableView convertRect:rectInTableView toView:[self.tableView superview]];
    NSLog(@"%f",rect.origin.y);
    cell.moreView = [cell.moreView initWithPoint:CGPointMake(cell.moreBtn.frame.origin.x, rect.origin.y)];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSLog(@"%ld",(long)cell.moreView.tag);
    //遍历uiview存在就隐藏，不存在就显示
    if (cell.moreView.tag == 0) {
        CFShow((__bridge CFTypeRef)(cell.moreView));
        cell.moreView.tag = 1;
        [appDelegate.window addSubview:cell.moreView];
    }else{
        CFShow((__bridge CFTypeRef)(cell.moreView));
        cell.moreView.tag = 0;
        [cell.moreView removeFromSuperview];
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    for (UIView *view in appDelegate.window.subviews) {
        if ([view isKindOfClass:[PopoverView class]]) {
            [view removeFromSuperview];
            view.tag = 0;
        }
    }
}



@end
