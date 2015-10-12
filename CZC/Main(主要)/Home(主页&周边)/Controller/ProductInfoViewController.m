//
//  ProductInfoViewController.m
//  CZC
//
//  Created by 周德艺 on 15/7/14.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ProductInfoViewController.h"
#import "ProductTableInfoCell.h"
#import "AdScrollView.h"
#import "ZDYScrollView.h"
#import "ProductsObject.h"
#import "Masonry.h"
#import "ChoseProductInfoView.h"
#import "SpecificationTableViewCell.h"
#import "SpecificationObject.h"
#import "SpecificationAllObject.h"
#import "LoginViewController.h"
#import "ShoppingCarViewController.h"
#import "CollectProductObject.h"

@interface ProductInfoViewController ()

@property (nonatomic,assign)NSInteger finished;

@end

#define kShowViewHight (SCREEN_WIDTH*0.65)

@implementation ProductInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"产品详情";
    [self addHeadView];
    [self addChoseView];
    
    _imgTextView = [UIView new];
    [_scrollView addSubview:_imgTextView];
    _imgTextView.tag = 1;
    
    //获取所有收藏商品列表,并判断该商品是否在收藏列表中，以判断收藏按钮的显示状态
    //先初始化button基本属性（tag值和图片除外）
    self.collectBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [self.collectBtn setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
    [self.collectBtn addTarget:self action:@selector(collectClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.collectBtn];
    [self getProCollectInfo];
}

-(void)viewWillAppear:(BOOL)animated{
    _finished = 0;
    [self getProductInfo];
    [self getProSpecification];
    [self showHUDBeginWithTitle:@""];
}
-(void)getProCollectInfo{
#pragma mark - 23.产品收藏列表
    /** 23.产品收藏列表 http://app.czctgw.com/api/CollectList?MemLoginID=zh010101&pageIndex=1&pageCount=5 */
    NSString *params = [NSString stringWithFormat:@"MemLoginID=%@&pageIndex=1&pageCount=50 ",kAccountObject.memLoginID];
    [CZCService GETmethod:kProCollectList_URL andParameters:params andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            //NSInteger count = [[myresult objectForKey:@"Count"]integerValue];
            NSArray *dataArr = [myresult objectForKey:@"Data"];
            NSArray *list = [CollectProductObject objectArrayWithKeyValuesArray:dataArr];
            NSLog(@"23.产品收藏列表 ------%@",list);
            NSMutableArray *collectProArr = [[NSMutableArray alloc]initWithArray:list];
            for (CollectProductObject *obj in collectProArr) {
                if([self.product.guid isEqualToString:obj.productGuid]){
                    [self.collectBtn setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
                    self.collectBtn.tag = 1;//收藏状态
                    return;
                }else{
                    [self.collectBtn setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
                    self.collectBtn.tag = 0;//未收藏状态
                }
            }
        }
        else{
            NSLog(@"失败");
        }
    }];
}
/**
 *	数据加载完成
 */
- (void)isFinished{
    _finished ++;
    if (_finished == 2) {
        [self dismissHUDEnd];
        self.choseSpecificationBtn.enabled = YES;
    }
    [_choseProductView.tableView reloadData];//刷新选择页面
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 获取数据
/**
 *6.产品详细
 *	http://app.czctgw.com/api/product/d3777035-8d88-4e87-8d2b-7021e03d4d2a
 */
- (void)getProductInfo{
    //790e6cfe-c05b-473a-863d-0001d033cb6b
    //d3777035-8d88-4e87-8d2b-7021e03d4d2a
    //8BF39849-C3B8-4529-ABE6-6D3E1DA5227D
    //715b0edf-1a41-4439-ab4e-0738da284946  连衣裙
    NSString *params = _product.guid;//@"715b0edf-1a41-4439-ab4e-0738da284946";
    [CZCService GETmethod:kProductInfo_URL andParameters:params andHandle:^(NSDictionary *myresult) {
        NSDictionary *result = myresult;
        NSDictionary *dic = [result objectForKey:@"ProductInfo"];
        if (![dic isKindOfClass:[NSNull class]]) {
            
            _product = [ProductsObject objectWithKeyValues:dic];
            
            [_nameLabel setText:_product.name];
            [_shopPriceLabel setText:[NSString stringWithFormat:@"￥%.2f",_product.shopPrice]];
            [_oldPriceLabel setText:[NSString stringWithFormat:@"￥%.2f",_product.marketPrice]];
            [_zhekouLabel setText:[NSString stringWithFormat:@"%.1f折",_product.shopPrice*10/_product.marketPrice]];
            
            NSLog(@"6.产品详细------%@",_product);
            [_choseProductView reloadProduct:_product];
            NSString *imageStr = _product.multiImages;
            NSArray *imageArray = [imageStr componentsSeparatedByString:@","];
            [_headView loadImageData:imageArray];
            
            [self changeScrollViewInfo];//显示图文详情
        }
        else{
            NSLog(@"失败");
        }
        [self isFinished];
    }];
}
/**
 *7.产品规格
 *	http://app.czctgw.com/api/SpecificationList/8BF39849-C3B8-4529-ABE6-6D3E1DA5227D
 */
- (void)getProSpecification{
    //@"715b0edf-1a41-4439-ab4e-0738da284946"
    NSString *params = _product.guid;
    [CZCService GETmethod:kProSpecificationList_URL andParameters:params andHandle:^(NSDictionary *myresult) {
        NSDictionary *result = myresult;
        NSArray *dataArr = [result objectForKey:@"SpecificationProudct"];
        if (dataArr.count!=0) {
            _specificationArray = [SpecificationAllObject objectArrayWithKeyValuesArray:dataArr];
            NSLog(@"7.产品规格 ------%@",_specificationArray);
            _choseProductView.specificationArray = _specificationArray;
            //            [_choseProductView.tableView reloadData];//刷新选择页面
            
        }
        else{
            NSLog(@"失败");
        }
        [self isFinished];
    }];
}


#pragma mark - 添加各种视图
/**
 *	添加选择产品界面。弹出选择窗口，背影黑罩
 */
- (void)addChoseView{
    _backView = [[UIView alloc]initWithFrame:self.view.bounds];
    _backView.hidden = YES;
    _backView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    _choseProductView = [ChoseProductInfoView instanceView];
    [_choseProductView setTransform:CGAffineTransformMakeTranslation(0, _choseProductView.frame.size.height)];
    __weak typeof(self) weakSelf = self;
    _choseProductView.dismissView = ^(BOOL isDismiss){
        if (isDismiss) {
            [weakSelf showHUDViewTitle:@"添加成功" info:@"" andCodes:^{
                [weakSelf dismissViewControllerAnimated:YES completion:^{
                }];
            }];
        }
        //添加动画，添加到父窗口中，使之从下移动上
        [UIView animateWithDuration:0.3 animations:^{
            weakSelf.backView.hidden = YES;
            [weakSelf.choseProductView setTransform:CGAffineTransformMakeTranslation(0, weakSelf.choseProductView.frame.size.height)];
        } completion:^(BOOL finished) {
            
        }];
    };
    [self.view addSubview:_backView];
    [self.view addSubview:_choseProductView];
    
}
/**
 *	添加头部显示照片显示视图
 */
- (void)addHeadView{
    
    [PublicObject drawHorizontalLineOnView:_titleView
                                      andX:0
                                      andY:52
                                  andWidth:SCREEN_WIDTH
                                  andColor:[UIColor lightGrayColor ]];
    [PublicObject drawHorizontalLineOnView:_guigeView
                                      andX:0
                                      andY:0
                                  andWidth:SCREEN_WIDTH
                                  andColor:[UIColor lightGrayColor ]];
    [PublicObject drawHorizontalLineOnView:_guigeView
                                      andX:0
                                      andY:40
                                  andWidth:SCREEN_WIDTH
                                  andColor:[UIColor lightGrayColor ]];
    [PublicObject drawHorizontalLineOnView:_oldPriceLabel
                                      andX:0
                                      andY:_oldPriceLabel.frame.size.height/2
                                  andWidth:_oldPriceLabel.frame.size.width
                                  andColor:[UIColor lightGrayColor ]];
    _headView = [[ZDYScrollView alloc]initWithFrame:CGRectZero];
    _headView.imageViewContentMode = UIViewContentModeScaleAspectFit;
    _headView.clickBlock = ^(NSInteger index){
        NSLog(@"跳转的controller为=========%ld",(long)index);
    };
    _headView.frame = CGRectMake(0, -kShowViewHight+5, SCREEN_WIDTH, kShowViewHight);
    _scrollView.delegate = self;
    _scrollView.contentInset = UIEdgeInsetsMake(kShowViewHight, 0, 0, 0);
    [_scrollView addSubview:_headView];
}
/**
 *	加载图文详情的图片
 *
 *	@param image	要加载的图片
 *	@param height	scrollView的高度
 *
 *	@return scrollView的新高度
 */
- (CGFloat)loadImages:(UIImage *)image andHeight:(CGFloat)height{
    
    __block CGFloat newHeight = height;
    UIImageView *subv = [[UIImageView alloc]initWithImage:image];
    CGSize imgSize = image.size;
    [subv setContentMode:UIViewContentModeScaleAspectFit];
    [_imgTextView addSubview:subv];
    
    [subv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(_imgTextView);
        //计算高度
        make.height.mas_equalTo((SCREEN_WIDTH-20)*imgSize.height/imgSize.width);
        if ( newHeight )
        {
            make.top.mas_equalTo(newHeight);//equalTo(lastImageView.mas_bottom).offset(8);
        }else{
            make.top.equalTo(_imgTextView.mas_top);
        }
        newHeight += ((SCREEN_WIDTH-20)*imgSize.height/imgSize.width)+8;
    }];
    [_imgTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.top.equalTo(self.segmented.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left);
        make.height.mas_equalTo(newHeight);//.equalTo(subv.mas_bottom).offset(8);
    }];
    [self.nilImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(newHeight);
    }];
    return newHeight;
}

/**
 *	图文、参数切换
 */
- (void)changeScrollViewInfo{
    if (_imgTextView.tag == 1) {
        __block CGFloat height = 0;
        for ( int i = 0 ; i < _product.imgList.count ; ++i )
        {
            //查找缓存中是否存在图片，不存在请求地址加载，存入缓存
            NSString *imageCatchKey = [_product.imgList objectAtIndex:i];
            NSURL *imageURL = [NSURL URLWithString:imageCatchKey];
            if([[SDImageCache sharedImageCache] diskImageExistsWithKey:imageCatchKey]){
                UIImage *image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:imageCatchKey];
                height = [self loadImages:image andHeight:height];
            }else{
                SDWebImageManager *manager = [SDWebImageManager sharedManager];
                [manager downloadImageWithURL:imageURL
                                      options:0
                                     progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                         // progression tracking code
                                     }
                                    completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                                        if (image) {
                                            height = [self loadImages:image andHeight:height];
                                        }
                                    }];
            }
        }
    }else{
        _paramesTable = [UITableView new];
        _paramesTable.delegate = self;
        _paramesTable.dataSource = self;
        [_paramesTable setTableFooterView:[[UIView alloc]init]];
        _paramesTable.rowHeight = UITableViewAutomaticDimension;
        _paramesTable.estimatedRowHeight = 60;
        [_imgTextView addSubview:_paramesTable];
        
        [_paramesTable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.top.equalTo(self.segmented.mas_bottom).offset(10);
            make.left.equalTo(self.view.mas_left);
            make.height.mas_equalTo(_paramesTable.contentSize.height);
        }];
        [_imgTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.top.equalTo(self.segmented.mas_bottom).offset(10);
            make.left.equalTo(self.view.mas_left);
            make.bottom.equalTo(_paramesTable.mas_bottom).offset(8);
        }];
        [self.nilImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self.imgTextView.mas_height);
        }];
    }
}

#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (IS_IOS8_OR_ABOVE) {
        _paramesHeight += UITableViewAutomaticDimension;
        return UITableViewAutomaticDimension;
    }else{
        return 60;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    static NSString *cellIdentifier = @"SpecificationTableViewCell";
    SpecificationTableViewCell *cell = (SpecificationTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
        cell = (SpecificationTableViewCell *)[nibArray objectAtIndex:0];
        cell.SpecificationNameLabel.text = [NSString stringWithFormat:@"这是第%ld条",(long)row];
        cell.SpecificationInfoLabel.text = [NSString stringWithFormat:@"这是第%ld条参数的信息，这是第条参数的信息，这是第条参数的信息",(long)row];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return cell;
}

#pragma mark - scrollView滚动代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat yOffset  = scrollView.contentOffset.y;
    if ( yOffset < -kShowViewHight*0.7) {
        CGRect f = _headView.frame;
        f.origin.y = yOffset+5;
        f.size.height =  -yOffset;
        _headView.frame = f;
        [_headView reloadSize];
    }
}

/**
 * 切换图文、参数
 */
- (IBAction)changeSegmented:(id)sender{
    [_imgTextView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    if (_imgTextView.tag == 0) {
        _imgTextView.tag = 1;
    }else{
        _imgTextView.tag = 0;
    }
    [self changeScrollViewInfo];
}

/**
 *	前往购物车
 */
- (IBAction)goShoppingCar:(id)sender {
    
    ShoppingCarViewController *shoppingCarVC=[[ShoppingCarViewController alloc]initWithNibName:@"ShoppingCarViewController" bundle:nil];
    shoppingCarVC.isHomePage = NO;
    shoppingCarVC.isHiddenTab = YES;
    shoppingCarVC.title = @"购物车";
    [self.navigationController pushViewController:shoppingCarVC animated:YES];
}
/**
 *	添加购物车
 * http:app.czctgw.com/api/shoppingcart/
 */
- (IBAction)addShoppingCar:(id)sender {
    if (kAccountObject == nil) {
        [self goToLoginVC];
    }else{
        if (_specificationArray != nil) {
            _choseProductView.defineBtn.hidden = NO;
            _choseProductView.addShoppingCarBtn.hidden = YES;
            _choseProductView.buyNowBtn.hidden = YES;
            [self showChoseView];
        }
    }
}
/**
 *	弹出选择页面
 */
- (IBAction)choseSpecification:(id)sender {
    if (kAccountObject == nil) {
        [self goToLoginVC];
    }else{
        _choseProductView.defineBtn.hidden = YES;
        _choseProductView.addShoppingCarBtn.hidden = NO;
        _choseProductView.buyNowBtn.hidden = NO;
        [self showChoseView];
    };
    
}

/**
 *	显示选择规则视图
 */
- (void)showChoseView{
    //添加动画,使之从下移动上
    [UIView animateWithDuration:0.3 animations:^{
        _backView.hidden = NO;
        [_choseProductView.tableView reloadData];
        [_choseProductView setTransform:CGAffineTransformMakeTranslation(0, 0)];
    } completion:^(BOOL finished) {
        
    }];
}


-(void)goToLoginVC{
    LoginViewController *loginController=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    UINavigationController *newNVC = [[UINavigationController alloc]initWithRootViewController:loginController];
    newNVC.navigationBarHidden = YES;
    newNVC.tabBarItem.title = @"登 录";
    newNVC.tabBarItem.image = [UIImage imageNamed:@"icon-grzx-1"];
    newNVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld",(long)[UIApplication sharedApplication].applicationIconBadgeNumber];
    
    loginController.dismissView = ^(BOOL isSuccess){
        if (!isSuccess) {
            self.tabBarController.selectedIndex = kLastSelectedIndex;//登录失败，调回上一个界面
        }
    };
    //调用此方法显示模态窗口
    [self presentViewController:newNVC animated:YES completion:nil];
}
//根据collectBtn 的tag值初始化button的图片
-(void)collectClick{
    if (self.collectBtn.tag == 0) {
        //添加收藏请求
        [self collectProduct];
    }else{
        //取消收藏请求
        [self collectProductCancel];
    }
}
#pragma mark - 40. 产品收藏
-(void)collectProduct{
    /**40. 产品收藏  http://api/Collect/?productGuid=926c2491-ca2f-47a4-90d9-52bcecdda0d9&sellLoginid=shop1&shopname=女装&MemLoginID=111111*/
    NSString *param = [NSString stringWithFormat:@"productGuid=%@&sellLoginid=%@&shopname=%@&MemLoginID=%@",self.product.guid,self.product.brandName,self.product.shopName,kAccountObject.memLoginID];
    [CZCService GETmethod:kProCollect_URL andParameters:param andHandle:^(NSDictionary *myresult) {
        NSDictionary *result = myresult;
        NSLog(@"%@",result);
        if (result) {
            NSInteger statuStr = [[result objectForKey:@"return"] integerValue];
            if (statuStr == 202) {
                NSLog(@"收藏成功");
                [self showHUDViewTitle:@"收藏成功" info:@"" andCodes:^{
                    self.collectBtn.tag = 1;
                    [self.collectBtn setBackgroundImage:[UIImage imageNamed:@"startYes.png"] forState:UIControlStateNormal];
                }];
            }else{
                NSLog(@"收藏失败");
                [self showHUDViewTitle:@"收藏失败" info:@"" andCodes:^{
                }];
            }
        }
        else{
            [self showHUDViewTitle:@"收藏失败" info:@"" andCodes:^{
            }];
        }
    }];
}
#pragma mark - 24. 取消产品收藏
-(void)collectProductCancel{
    /**24. 取消产品收藏  http://api/mycollect/delete?Guid=dc900185-1203-4dd0-8682-d490acb03b6b&MemLoginID=111111*/
    NSString *param = [NSString stringWithFormat:@"Guid=%@&MemLoginID=%@",self.product.guid,kAccountObject.memLoginID];
    [CZCService GETmethod:kProCollectDelete_URL andParameters:param andHandle:^(NSDictionary *myresult) {
        NSDictionary *result = myresult;
        NSLog(@"%@",result);
        if (result) {
            NSString *statuStr = [NSString stringWithFormat:@"%@",[result objectForKey:@"return"]];
            if ([statuStr isEqualToString:@"200"]) {
                NSLog(@"取消收藏成功");
                [self showHUDViewTitle:@"取消收藏成功" info:@"" andCodes:^{
                    self.collectBtn.tag = 0;
                    [self.collectBtn setBackgroundImage:[UIImage imageNamed:@"startNo.png"] forState:UIControlStateNormal];
                }];
            }else{
                NSLog(@"取消收藏失败");
                [self showHUDViewTitle:@"取消收藏失败" info:@"" andCodes:^{
                }];
            }
        }
        else{
            [self showHUDViewTitle:@"取消收藏失败" info:@"" andCodes:^{
            }];
        }
    }];
}
@end
