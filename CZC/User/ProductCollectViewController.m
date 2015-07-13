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
    self.navigationItem.leftBarButtonItem = self.backMenuItem;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"cpxx-7"] forBarMetrics:UIBarMetricsDefault ];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    static NSString * const CellIdentifier = @"ProductCollectCollectionViewCell";
    [self.collectionView registerClass:[ProductCollectCollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
    self.collectionView.backgroundColor = RGB(231, 231, 231, 1);
    //数组初始化
    self.productsArr = [[NSMutableArray alloc]init];
    
    //假数据
    self.proImageArr = [[NSMutableArray alloc]initWithObjects:@"cpsc-p1",@"cpsc-p2",@"cpsc-p3",@"cpsc-p4", nil];
    self.proInfoArr = [[NSMutableArray alloc]initWithObjects:@"Adidas阿迪达斯女鞋2015清风运动鞋跑鞋B 40737 40736 S 77245",@"台湾张君雅小妹妹系列外套甜甜圈点心面丸子i进口零食大礼包5包",@"ZK旗舰店2015夏装连衣裙夏季连衣裙女装印花连衣裙a字裙印花裙潮",@"Midea/美的吸尘器超静音除螨仪超小型—无耗材C3-L148B", nil];
    self.proPriceArr = [[NSMutableArray alloc]initWithObjects:@"￥609",@"￥39",@"￥308",@"￥399", nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
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
    return cell;
}
#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((SCREEN_WIDTH-24)/2, (SCREEN_WIDTH-24)/2*1.2);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
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
@end
