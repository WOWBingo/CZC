//
//  HundredViewController.m
//  CZC
//
//  Created by 周德艺 on 15/7/15.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "HundredViewController.h"
#import "HundredTableViewCell.h"
#import "ProductsObject.h"
#import "ProductInfoViewController.h"

@interface HundredViewController ()

@end

@implementation HundredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 //   self.title = @"百元专区";
//    [_integrateBtn.layer setMasksToBounds:YES];
//    [_integrateBtn.layer setCornerRadius:8.0]; //设置矩形四个圆角半径
//    [_integrateBtn.layer setBorderWidth:0.5]; //边框宽度
//    [_integrateBtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];//边框颜色
//    [_salesBtn.layer setBorderWidth:0.5]; //边框宽度
//    [_salesBtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];//边框颜色
//    [_priceBtn.layer setBorderWidth:0.5]; //边框宽度
//    [_priceBtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];//边框颜色
//    [_commentBtn.layer setBorderWidth:0.5]; //边框宽度
//    [_commentBtn.layer setBorderColor:[UIColor lightGrayColor].CGColor];//边框颜色
    CGFloat w = (SCREEN_WIDTH-16)/4;
//    [PublicObject drawHorizontalLineOnView:_tableHeadView andX:0 andY:0 andWidth:4*w andColor:[UIColor lightGrayColor]];
//    [PublicObject drawHorizontalLineOnView:_tableHeadView andX:1 andY:_tableHeadView.frame.size.height andWidth:4*w-1 andColor:[UIColor lightGrayColor]];
    [PublicObject drawVerticalLineOnView:_tableHeadView andX:w andY:0 andHeigt:_tableHeadView.frame.size.height andColor:[UIColor lightGrayColor]];
    [PublicObject drawVerticalLineOnView:_tableHeadView andX:2*w andY:0 andHeigt:_tableHeadView.frame.size.height andColor:[UIColor lightGrayColor]];
    [PublicObject drawVerticalLineOnView:_tableHeadView andX:3*w andY:0 andHeigt:_tableHeadView.frame.size.height andColor:[UIColor lightGrayColor]];
//    [PublicObject drawVerticalLineOnView:_tableHeadView andX:4*w andY:0 andHeigt:_tableHeadView.frame.size.height andColor:[UIColor lightGrayColor]];
    
    /**
     *	设置阴影
     */
    [[_tableHeadView layer] setShadowOffset:CGSizeMake(1, 1)];//偏移量
    [[_tableHeadView layer] setShadowRadius:0.5];//宽度
    [[_tableHeadView layer] setShadowOpacity:1];//透明
    [[_tableHeadView layer] setShadowColor:[UIColor lightGrayColor].CGColor];
    
    // Do any additional setup after loading the view from its nib.
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView setTableFooterView:[[UIView alloc]init]];
    [_tableView setSeparatorColor:[UIColor clearColor]];
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = SCREEN_WIDTH;
    
    _productArray = [[NSMutableArray alloc]init];
    _pageIndex = 1;
    _pageCount = 10;
    _isLastPage = NO;
    _sort = kSortsProModifyTime;
    _isASC = YES;
    _cityDomainName = @"";
    _btntag = 0;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self getProductsList];
}

#pragma mark - 5.平台产品列表
/**
 http://app.czctgw.com/api/product/listNew/002?sorts=SaleNumber&isASC=true&pageIndex=1&pageCount=5&CityDomainName=fy
 *5.平台产品列表 http://app.czctgw.com/api/product/list/004001001?sorts=SaleNumber&isASC=true&pageIndex=1&pageCount=5&CityDomainName=gy */
- (void)getProductsList{
    NSString *params = [NSString stringWithFormat:@"%@?sorts=%@&isASC=%@&pageIndex=%lu&pageCount=%lu&CityDomainName=%@",_productCatagory,_sort,_isASC?kSortsisASCTrue:kSortsisASCFalse,(unsigned long)_pageIndex,(unsigned long)_pageCount,_cityDomainName];
    [CZCService GETmethod:kProductList_URL andParameters:params andHandle:^(NSDictionary *myresult) {
        NSDictionary *result = myresult;
        if (result) {
            _allCount = [[result objectForKey:@"Count"] integerValue];
            NSArray *dataArr = [result objectForKey:@"Data"];
            NSArray *productList = [ProductsObject objectArrayWithKeyValuesArray:dataArr];
            NSLog(@"5.平台产品列表------%@",productList);
            if (!_isLastPage) {
                [_productArray addObjectsFromArray:productList];
            }
            if (_allCount%_pageCount == 0) {
                if (_allCount/_pageCount == _pageIndex) {
                    _isLastPage = YES;
                }else{
                    _pageIndex ++ ;
                }
            }else{
                if (productList.count < _pageCount) {
                    _isLastPage = YES;
                }else{
                    _pageIndex ++ ;
                }
            }
            [self.tableView reloadData];
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
    return _productArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        return 100;
//    }
//    return UITableViewAutomaticDimension;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger row = indexPath.row;
    ProductsObject *product = [_productArray objectAtIndex:row];
    static NSString *cellIdentifier = @"HundredTableViewCell";
    
    if ((row == _productArray.count-1) && !_isLastPage) {
        [self getProductsList];
    }
    
    HundredTableViewCell *cell = (HundredTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
        cell = (HundredTableViewCell *)[nibArray objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    [cell.productImageView sd_setImageWithURL:[NSURL URLWithString:product.originalImage] placeholderImage:[UIImage imageNamed:@"imagedefault"]];
    [cell.priceLable setText:[NSString stringWithFormat:@"￥%.2f",product.shopPrice]];
    [cell.nameLable setText:product.name];
    
    [cell.postageLable setText:@"邮费字段不明"];
    cell.postageLable.hidden = YES;
    
    if (product.shopPrice != 0 && product.marketPrice != 0) {
        [cell.discountLable setText:[NSString stringWithFormat:@" %.1f折 ",(product.shopPrice*10/product.marketPrice)]];
    }else{
        [cell.discountLable setText:@""];
        cell.discountLable.hidden = YES;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ProductInfoViewController *newVC = [[ProductInfoViewController alloc]initWithNibName:@"ProductInfoViewController" bundle:nil];
    ProductsObject *product = [_productArray objectAtIndex:indexPath.row];
    newVC.product = product;
    [self.navigationController pushViewController:newVC animated:YES];
}

/**
 *	修改排序及类型
 */
- (IBAction)changeSort:(id)sender {
    UIButton *btn = (UIButton*)sender;
    if (btn.tag ==_btntag) {
        _isASC = !_isASC;
    }else{
        _btntag = btn.tag;
        switch (btn.tag) {
            case 0:
                _sort = kSortsProModifyTime;
                break;
            case 1:
                _sort = kSortsProSaleNumber;
                break;
            case 2:
                _sort = kSortsProPrice;
                break;
            case 3:
                _sort = kSortsProPrice;
                break;
                
            default:
                break;
        }
    }
    _pageIndex = 1;
    [self getProductsList];
    
}


@end
