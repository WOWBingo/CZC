//
//  ShopInfoViewController.m
//  CZC
//
//  Created by 周德艺 on 15/7/21.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ShopInfoViewController.h"

@interface ShopInfoViewController ()

@end

@implementation ShopInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"商铺详情";
    
    _titleBar = [[LGtitleBarView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    self.titles = @[@"店铺首页", @"精品推荐", @"最新上架", @"热门商品", @"促销商品", @"最后疯抢", @"即将上架"];
    _titleBar.titles = self.titles;
    _titleBar.delegate = self;
    [_centerView addSubview:_titleBar];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView setTableFooterView:[[UIView alloc]init]];
    [_tableView setSeparatorColor:[UIColor clearColor]];
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 160;
}
/** titlebar代理方法 */
-(void)LGtitleBarView:(LGtitleBarView *)titleBarView didSelectedItem:(int)index
{
    NSLog(@"%d", index);

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
    static NSString *cellIdentifier = @"";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    if (cell == nil) {
//        NSBundle *bundle = [NSBundle mainBundle];
//        NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
//        cell = (UITableViewCell *)[nibArray objectAtIndex:0];
//        
//        
//        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//    }
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)callShop:(id)sender {
}
@end
