//
//  ProductCollectViewController.m
//  CZC
//
//  Created by 张浩 on 15/7/13.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ProductCollectViewController.h"
#import "ProductCollectCollectionViewCell.h"
#import "CollectProductObject.h"
@interface ProductCollectViewController ()

@end

@implementation ProductCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"产品收藏";
    
    //popTable
    self.typeArray = [[NSMutableArray alloc]initWithObjects:@"全部分类",@"1",@"2",@"3",@"4",@"5", nil];
    self.popTableView.tableFooterView = [[UIView alloc]init];
    self.popTableView.scrollEnabled = NO;
    self.popTableViewIsHiden = YES;
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
    [self getProCollectInfo];
    
}

-(void)viewWillAppear:(BOOL)animated{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)editCollect{
    _isEdited = !_isEdited;
    [_collectionView reloadData];
}
-(void)getProCollectInfo{
#pragma mark - 23.产品收藏列表
    /** 23.产品收藏列表 http://app.czctgw.com/api/CollectList?MemLoginID=zh010101&pageIndex=1&pageCount=5 */
    NSString *params = [NSString stringWithFormat:@"MemLoginID=%@&pageIndex=1&pageCount=5 ",kAccountObject.memLoginID];
    [CZCService GETmethod:kProCollectList_URL andParameters:params andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            NSInteger count = [[myresult objectForKey:@"Count"]integerValue];
            NSArray *dataArr = [myresult objectForKey:@"Data"];
            NSArray *list = [CollectProductObject objectArrayWithKeyValuesArray:dataArr];
            NSLog(@"23.产品收藏列表 ------%@",list);
            self.productsArr = [[NSMutableArray alloc]initWithArray:list];
            [_collectionView reloadData];
        }
        else{
            NSLog(@"失败");
        }
    }];
}
//异步加载图片
- (void)updateImage:(UIImage *)img withCell:(ProductCollectCollectionViewCell *)cell{
    if (img != nil) {
        cell.proImageView.image = img;
    } else {
        cell.proImageView.image = [UIImage imageNamed:@"cpsc-p1"];
    }
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
    return self.productsArr.count;
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
    CollectProductObject *proObj = [self.productsArr objectAtIndex:indexPath.row];
    NSString *imgURL = @"";
    imgURL = [PublicObject convertNullString:proObj.smallImage];
    if ([imgURL isEqualToString:@""]||imgURL == nil) {
        cell.proImageView.image = [UIImage imageNamed:@"cpsc-p1"];
    } else {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSString *urlString = [NSString stringWithFormat:@"%@",imgURL];
            NSURL *imageUrl = [NSURL URLWithString:urlString];
            NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
            UIImage *img = [UIImage imageWithData:imageData];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self updateImage:img withCell:cell];
            });
        });
    }
    cell.proInfoLab.text = proObj.name;
    cell.proPriceLab.text = [NSString stringWithFormat:@"%f",proObj.shopPrice];
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.typeArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
        cell.backgroundColor = [UIColor clearColor];
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell.textLabel setTextColor:[UIColor blackColor]];
        cell.textLabel.font = [UIFont systemFontOfSize:18];
    }
    NSLog(@"%d",self.typeTag);
    if (indexPath.row == self.typeTag){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    cell.textLabel.text = [self.typeArray objectAtIndex:indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.typeLab.text = [self.typeArray objectAtIndex:indexPath.row];
    self.typeTag = (int)indexPath.row;
    self.popTableView.hidden = YES;
    [self.popTableView reloadData];
}
- (IBAction)moreType:(id)sender {
    self.popTableViewIsHiden = !self.popTableViewIsHiden;
    if (self.popTableViewIsHiden) {
        self.popTableView.frame = CGRectMake(self.popTableView.frame.origin.x, self.popTableView.frame.origin.y
                                             , self.popTableView.frame.size.width, self.typeArray.count*44);
        self.popTableView.hidden = NO;
    }else{
        self.popTableView.hidden = YES;
    }
    
}
@end
