//
//  ProductCollectViewController.m
//  CZC
//
//  Created by 张浩 on 15/7/13.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ProductCollectViewController.h"
#import "ProductCollectCollectionViewCell.h"
@interface ProductCollectViewController ()

@end

@implementation ProductCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"产品收藏";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //[button setBackgroundImage:[UIImage imageNamed:@"button_main.png"] forState:UIControlStateNormal];
    [button setTitle:@"编辑" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(editCollect)forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, 44, 44);
    UIBarButtonItem *editButItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = editButItem;
    
    static NSString * const CellIdentifier = @"ProductCollectCollectionViewCell";
    [self.collectionView registerClass:[ProductCollectCollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
    self.collectionView.backgroundColor = RGB(231, 231, 231, 1);
    
    //数组初始化
    self.productsArr = [[NSMutableArray alloc]init];
    
    //假数据
    self.proImageArr = [[NSMutableArray alloc]initWithObjects:@"cpsc-p1",@"cpsc-p2",@"cpsc-p3",@"cpsc-p4",@"cpsc-p1",@"cpsc-p2",@"cpsc-p3",@"cpsc-p4",@"cpsc-p1",@"cpsc-p2",@"cpsc-p3",@"cpsc-p4", nil];
    self.proInfoArr = [[NSMutableArray alloc]initWithObjects:@"Adidas阿迪达斯女鞋2015清风运动鞋跑鞋B 40737 40736 S 77245",@"台湾张君雅小妹妹系列外套甜甜圈点心面丸子i进口零食大礼包5包",@"ZK旗舰店2015夏装连衣裙夏季连衣裙女装印花连衣裙a字裙印花裙潮",@"Midea/美的吸尘器超静音除螨仪超小型—无耗材C3-L148B",@"Adidas阿迪达斯女鞋2015清风运动鞋跑鞋B 40737 40736 S 77245",@"台湾张君雅小妹妹系列外套甜甜圈点心面丸子i进口零食大礼包5包",@"ZK旗舰店2015夏装连衣裙夏季连衣裙女装印花连衣裙a字裙印花裙潮",@"Midea/美的吸尘器超静音除螨仪超小型—无耗材C3-L148B",@"Adidas阿迪达斯女鞋2015清风运动鞋跑鞋B 40737 40736 S 77245",@"台湾张君雅小妹妹系列外套甜甜圈点心面丸子i进口零食大礼包5包",@"ZK旗舰店2015夏装连衣裙夏季连衣裙女装印花连衣裙a字裙印花裙潮",@"Midea/美的吸尘器超静音除螨仪超小型—无耗材C3-L148B", nil];
    self.proPriceArr = [[NSMutableArray alloc]initWithObjects:@"￥609",@"￥39",@"￥308",@"￥399",@"￥609",@"￥39",@"￥308",@"￥399",@"￥609",@"￥39",@"￥308",@"￥399", nil];

}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setShadowImage:nil];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)editCollect{
    _isEdited = !_isEdited;
    [_collectionView reloadData];
}

#pragma mark -- UICollectionViewDataSource

//-(UIView *)collectionView:(collectionView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
//    bgView.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    
//    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 250, 20)];
//    titleLabel.backgroundColor = [UIColor clearColor];
//    titleLabel.textColor = [UIColor blackColor];
//    titleLabel.font = [UIFont boldSystemFontOfSize:14];
//    
//    NSString *key = [_keys objectAtIndex:section];
//    //    if ([key rangeOfString:@"hot"].location != NSNotFound) {
//    //        titleLabel.text = @"热门城市";
//    //    }
//    //    else
//    titleLabel.text = key;
//    [bgView addSubview:titleLabel];
//    
//    return bgView;
//}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 12;
}
//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ProductCollectCollectionViewCell *cell = (ProductCollectCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"ProductCollectCollectionViewCell" forIndexPath:indexPath];
    NSString *imgStr = [self.proImageArr objectAtIndex:indexPath.row];
    cell.proImageView.image = [UIImage imageNamed:imgStr];
    cell.proInfoLab.text = [self.proInfoArr objectAtIndex:indexPath.row];
    cell.proPriceLab.text = [self.proPriceArr objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor whiteColor];
    [cell editFrame:_isEdited andIndexPath:indexPath];
    return cell;
}
#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SCREEN_WIDTH/2-15, (SCREEN_WIDTH/2-15)*1.3);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 0, 10);
}
#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (IBAction)moreType:(id)sender {
}
@end
