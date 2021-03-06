//
//  ProductCollectViewController.h
//  CZC
//
//  Created by 张浩 on 15/7/13.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductCollectViewController : PublicViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *popTableView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UIButton *moreTypeBtn;
@property (weak, nonatomic) IBOutlet UILabel *typeLab;

@property (nonatomic) int typeTag;
@property(nonatomic,strong)NSMutableArray *typeArray;
@property (nonatomic,strong) UILabel *titleLab;
@property (nonatomic,strong) UIImageView *titleImg;

@property (nonatomic,strong) NSMutableArray *productsArr;
//假数据
@property (nonatomic,strong) NSMutableArray *proImageArr;
@property (nonatomic,strong) NSMutableArray *proInfoArr;
@property (nonatomic,strong) NSMutableArray *proPriceArr;

@property(nonatomic) BOOL isEdited;
@property(nonatomic) BOOL popTableViewIsHiden;

- (IBAction)moreType:(id)sender;
@end
