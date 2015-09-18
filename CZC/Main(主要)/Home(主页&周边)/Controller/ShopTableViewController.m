//
//  ShopTableViewController.m
//  CZC
//
//  Created by 周德艺 on 15/7/15.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ShopTableViewController.h"
#import "ShopTableViewCell.h"
#import "ShopInfoViewController.h"
#import "ShopObject.h"

@interface ShopTableViewController ()

@end

@implementation ShopTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"展示分站";

    CGFloat w = (SCREEN_WIDTH-16)/4;
    [PublicObject drawVerticalLineOnView:_tableHeadView
                                    andX:w
                                    andY:0
                                andHeigt:_tableHeadView.frame.size.height
                                andColor:[UIColor lightGrayColor]];
    [PublicObject drawVerticalLineOnView:_tableHeadView
                                    andX:2*w
                                    andY:0
                                andHeigt:_tableHeadView.frame.size.height
                                andColor:[UIColor lightGrayColor]];
    [PublicObject drawVerticalLineOnView:_tableHeadView
                                    andX:3*w
                                    andY:0
                                andHeigt:_tableHeadView.frame.size.height
                                andColor:[UIColor lightGrayColor]];

    /**
     *	设置阴影
     */
    [[_tableHeadView layer] setShadowOffset:CGSizeMake(1, 1)];//偏移量
    [[_tableHeadView layer] setShadowRadius:0.5];//宽度
    [[_tableHeadView layer] setShadowOpacity:1];//透明
    [[_tableHeadView layer] setShadowColor:[UIColor lightGrayColor].CGColor];

    // Do any additional setup after loading the view from its nib.
    _tableView.dataSource         = self;
    _tableView.delegate           = self;
    [_tableView setTableFooterView:[[UIView alloc]init]];
    [_tableView setSeparatorColor:[UIColor clearColor]];
    _tableView.rowHeight          = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = SCREEN_WIDTH;
    
    _shopList = [[NSMutableArray alloc]init];
    [self getShopListData];
}

- (void)viewWillAppear:(BOOL)animated{
    
    

}

#pragma mark - 获取数据
/** 3.店铺搜索列表 http://app.czctgw.com/api/shops?pageIndex=1&pageCount=5&OderStatus=0&keyKeyword=&CityDomainName=gy */
- (void)getShopListData{

    NSString *params = @"pageIndex=1&pageCount=5&OderStatus=0&keyKeyword=&CityDomainName=gy";
    [CZCService GETmethod:kShops_URL andParameters:params andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            NSInteger count = [[myresult objectForKey:@"Count"]integerValue];
            NSArray *dataArr = [myresult objectForKey:@"Data"];
            NSArray *list = [ShopObject objectArrayWithKeyValuesArray:dataArr];
            NSLog(@"3.店铺搜索列表 ------%@",list);
            [_shopList addObjectsFromArray:list];
            [_tableView reloadData];
            
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

#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _shopList.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_WIDTH*0.3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSInteger row = indexPath.row;
    ShopObject *shop = [_shopList objectAtIndex:row];
    static NSString *cellIdentifier = @"ShopTableViewCell";
    ShopTableViewCell *cell         = (ShopTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSBundle *bundle  = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
        cell              = (ShopTableViewCell *)[nibArray objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        [cell.nameLable setText:shop.shopName];
        [cell.discountLable setText:[NSString stringWithFormat:@"%.1f折起",shop.haoPingLV]];
        [cell.shopImageView sd_setImageWithURL:[NSURL URLWithString:shop.banner] placeholderImage:[UIImage imageNamed:@"dpsc-p4"]];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ShopInfoViewController *newVC = [[ShopInfoViewController alloc]initWithNibName:@"ShopInfoViewController" bundle:nil];
    newVC.shopId = @"100001058";
    [self.navigationController pushViewController:newVC animated:YES];
}


@end
