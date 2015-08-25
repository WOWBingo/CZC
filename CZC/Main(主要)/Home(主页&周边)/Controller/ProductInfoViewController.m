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

@interface ProductInfoViewController ()

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
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self getProductInfo];
    [self getProSpecification];
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
    NSString *params = @"d3777035-8d88-4e87-8d2b-7021e03d4d2a";
    [CZCService GETmethod:kProductInfo_URL andParameters:params andHandle:^(NSDictionary *myresult) {
        NSDictionary *result = myresult;
        if (result) {
            NSDictionary *dic = [result objectForKey:@"ProductInfo"];
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
    }];
}
/**
 *7.产品规格
 *	http://app.czctgw.com/api/SpecificationList/8BF39849-C3B8-4529-ABE6-6D3E1DA5227D
 */
- (void)getProSpecification{
    NSString *params = @"8BF39849-C3B8-4529-ABE6-6D3E1DA5227D";
    [CZCService GETmethod:kProSpecificationList_URL andParameters:params andHandle:^(NSDictionary *myresult) {
        NSDictionary *result = myresult;
        if (result) {
            NSArray *dataArr = [result objectForKey:@"SpecificationProudct"];
            _specificationArray = [SpecificationAllObject objectArrayWithKeyValuesArray:dataArr];
            NSLog(@"7.产品规格 ------%@",_specificationArray);
            _choseProductView.specificationArray = _specificationArray;
            [_choseProductView.tableView reloadData];//刷新选择页面
        }
        else{
            NSLog(@"失败");
        }
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
    _choseProductView.dismissView = ^(){
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
        NSLog(@"跳转的controller为=========%ld",index);
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
}
/**
 *	添加购物车
 * http:app.czctgw.com/api/shoppingcart/
 */
- (IBAction)addShoppingCar:(id)sender {
    _choseProductView.defineBtn.hidden = NO;
    _choseProductView.addShoppingCarBtn.hidden = YES;
    _choseProductView.buyNowBtn.hidden = YES;
    [self showChoseView];
}
/**
 *	弹出选择页面
 */
- (IBAction)choseSpecification:(id)sender {
    _choseProductView.defineBtn.hidden = YES;
    _choseProductView.addShoppingCarBtn.hidden = NO;
    _choseProductView.buyNowBtn.hidden = NO;
    [self showChoseView];
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


@end
