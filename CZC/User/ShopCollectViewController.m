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
#import "CollectShopObject.h"
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
    [self getshopCollectInfo];
}

-(void)viewWillAppear:(BOOL)animated{
}
-(void)getshopCollectInfo{
#pragma mark - 25.店铺收藏列表
    /** 25.店铺收藏列表 http://app.czctgw.com/api/ShopCollectList?MemLoginID=s1886&pageIndex=1&pageCount=5 */
    NSString *params = @"MemLoginID=s1886&pageIndex=1&pageCount=5";
    [CZCService GETmethod:kShopCollectList_URL andParameters:params andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            NSInteger count = [[myresult objectForKey:@"Count"]integerValue];
            NSArray *dataArr = [myresult objectForKey:@"Data"];
            NSArray *list = [CollectShopObject objectArrayWithKeyValuesArray:dataArr];
            NSLog(@"25.店铺收藏列表  ------%@",list);
            self.shopArray = list;
            [self.tableView reloadData];
        }
        else{
            NSLog(@"失败");
        }
    }];
}

#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.shopArray.count;
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
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    cell.cellIndexPath = indexPath;
    CollectShopObject *shopObj = [self.shopArray objectAtIndex:indexPath.row];
    cell.shopNameLab.text = shopObj.shopName;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    for (UIView *view in appDelegate.window.subviews) {
        if ([view isKindOfClass:[PopoverView class]]) {
            [view removeFromSuperview];
            view.tag = 0;
        }
    }
    ShopInfoViewController *newVC = [[ShopInfoViewController alloc]initWithNibName:@"ShopInfoViewController" bundle:nil];
    [self.navigationController pushViewController:newVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)moreView:(ShopCollectTableViewCell *)cell andPopoverView:(PopoverView *)view{
    //    //先隐藏上一个
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    for (UIView *view in appDelegate.window.subviews) {
        if ([view isKindOfClass:[PopoverView class]]) {
            [view removeFromSuperview];
        }
    }
    //获取tableviewCell在当前屏幕中的坐标值
    CGRect rectInTableView = [self.tableView rectForRowAtIndexPath:cell.cellIndexPath];
    CGRect rect = [self.tableView convertRect:rectInTableView toView:[self.tableView superview]];
    NSLog(@"%f",rect.origin.y);
    cell.moreView = [cell.moreView initWithPoint:CGPointMake(cell.moreBtn.frame.origin.x, rect.origin.y+30)];
    NSLog(@"%ld",(long)cell.moreView.tag);
    //遍历uiview存在就隐藏，不存在就显示
    if (cell.moreView.tag == 0) {
        CFShow((__bridge CFTypeRef)(cell.moreView));
        cell.moreView.tag = 1;
        [appDelegate.window addSubview:cell.moreView];
        //显示后在其下方插入手势
        //         handleSwipeFrom 是偵測到手势，所要呼叫的方法
        UITapGestureRecognizer *hidenPop = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenPop)];
        hidenPop.numberOfTapsRequired = 1;
        hidenPop.delegate = self;
        [self.tableView addGestureRecognizer:hidenPop];
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
- (void)back
{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    for (UIView *view in appDelegate.window.subviews) {
        if ([view isKindOfClass:[PopoverView class]]) {
            [view removeFromSuperview];
            view.tag = 0;
        }
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    CFShow((__bridge CFTypeRef)(self.view.subviews));
    NSLog(@"%@",NSStringFromClass([touch.view class]));
    if ([touch.view isKindOfClass:[UIButton class]]){
        return NO;
    }else if([touch.view isKindOfClass:[PopoverView class]]){
        return NO;
    }else if([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return YES;
}
-(void)hidenPop{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    for (UIView *view in appDelegate.window.subviews) {
        if ([view isKindOfClass:[PopoverView class]]) {
            [view removeFromSuperview];
            view.tag = 0;
        }
    }
}
@end
