//
//  ChoseProductInfoView.m
//  CZC
//
//  Created by 周德艺 on 15/8/20.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ChoseProductInfoView.h"
#import "SpecificationChoseCell.h"
#import "SpecificationNumCell.h"

@implementation ChoseProductInfoView

+(ChoseProductInfoView *)instanceView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"ChoseProductInfoView" owner:nil options:nil];
    return [nibView objectAtIndex:0];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView setTableFooterView:[[UIView alloc]init]];
    //    [_tableView setSeparatorColor:[UIColor clearColor]];
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 60;
    
    [PublicObject drawHorizontalLineOnView:self.titleView andX:0 andY:self.titleView.frame.size.height-1 andWidth:SCREEN_WIDTH andColor:[UIColor lightGrayColor]];
}

/**
 *	刷新对象
 */
- (void)reloadProduct:(ProductsObject *)object{
    self.product = object;
    NSURL *imageURL = [NSURL URLWithString:_product.originalImage];
    [_imgView sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"cpsc-p1"]];
    _priceLabel.text = [NSString stringWithFormat:@"￥%.2f",_product.shopPrice];
    _stockLabel.text = [NSString stringWithFormat:@"%ld",_product.repertoryCount];
    
    _specificationArray = [[NSMutableArray alloc]init];
    _selectedSpecificationDic = [[NSMutableDictionary alloc]init];
    _priceObject = [[SpecificationOfPriceObject alloc]init];
    _onePrice = 0;
    _stockNum = 0;
    _allPrice = 0;
    _productNum = 1;
    
    _defineBtn.enabled = NO;
    _buyNowBtn.enabled = NO;
    _addShoppingCarBtn.enabled = NO;
}

#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _specificationArray.count+1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (IS_IOS8_OR_ABOVE) {
        return UITableViewAutomaticDimension;
    }else{
        return 120;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    if (row == _specificationArray.count) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:@"SpecificationNumCell" owner:self options:nil];
        SpecificationNumCell *numCell = (SpecificationNumCell *)[nibArray objectAtIndex:0];
        [numCell setSelectionStyle:UITableViewCellSelectionStyleNone];
        numCell.numBtn.currentNum = [NSString stringWithFormat:@"%ld",_productNum];
        numCell.numBlock = ^(NSInteger num){
            _productNum = num;
            [self showPrice];
        };
        return numCell;
    }else{
        SpecificationAllObject *speAllObject = [_specificationArray objectAtIndex:row];
        
        static NSString *cellIdentifier = @"SpecificationChoseCell";
        SpecificationChoseCell *cell = (SpecificationChoseCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            NSBundle *bundle = [NSBundle mainBundle];
            NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
            cell = (SpecificationChoseCell *)[nibArray objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        //找到已经选中的，赋值tag做标识符，cell中button变色
        SpecificationObject *selectedSpecObject = [_selectedSpecificationDic objectForKey:speAllObject.specValueName];
        if (selectedSpecObject) {
            cell.tag = selectedSpecObject.specValueid;
        }
        //回调输出规格
        cell.specificationBlock = ^(SpecificationObject *specObject){
            NSLog(@"specStr=========%@----%@----%ld",specObject.specName,specObject.specValueName,specObject.specValueid);
            //判断选中的规格是否存在相同类型，存在替换，不存在添加
            [_selectedSpecificationDic setValue:specObject forKey:specObject.specName];
            [self getPriceBySpecification];
        };
        cell.specificationNameLabel.text = speAllObject.specValueName;
        [cell reloadView:speAllObject];
        return cell;
    }
}



#pragma mark - 8.规格查询价格
/**
 *8.规格查询价格
 *http://app.czctgw.com/api/Specification/8bf39849-c3b8-4529-abe6-6d3e1da5227d?Detail=%E7%89%9B%E4%BB%94%E8%93%9D,234%7CM,665
 *
 */
- (void)getPriceBySpecification{
    //    NSString *params = [NSString stringWithFormat:@"%@?Detail=",_product.guid];
    //    for(int i = 0; i<_specificationArray.count; i++){
    //        SpecificationAllObject *speAllObject = [_specificationArray objectAtIndex:i];
    //        SpecificationObject *selectedSpecObject = [_selectedSpecificationDic objectForKey:speAllObject.specValueName];
    //        if (selectedSpecObject) {
    //            if (i == 0) {
    //                params = [NSString stringWithFormat:@"%@%@,%ld",params,selectedSpecObject.specValueName,selectedSpecObject.specValueid];
    //            }else{
    //                params = [NSString stringWithFormat:@"%@|%@,%ld",params,selectedSpecObject.specValueName,selectedSpecObject.specValueid];
    //            }
    //        }else{
    //            NSLog(@"Str=========return");
    //            return;
    //        }
    //    }
    //    NSLog(@"Str=========%@",params);
    NSString *params = @"8bf39849-c3b8-4529-abe6-6d3e1da5227d?Detail=牛仔蓝,234|M,665";
    [CZCService GETmethod:kPriceBySpecification_URL andParameters:params andHandle:^(NSDictionary *myresult) {
        NSDictionary *result = myresult;
        NSArray *dataArr = [result objectForKey:@"Specification"];
        if (dataArr.count) {
            NSDictionary *dic = [dataArr objectAtIndex:0];
            //            NSArray *list = [SpecificationOfPriceObject objectArrayWithKeyValuesArray:dataArr];
            NSLog(@"8.产品规格获得价格 ------%@",dic);
            if (dic) {
                //                _priceArray = [[NSMutableArray alloc]initWithArray:list];
                _priceObject = [SpecificationOfPriceObject objectWithKeyValues:dic];
            }
        }
        else{
            NSLog(@"失败");
        }
        [self showPrice];
    }];
}

/**
 *	显示价格、库存
 */
- (void)showPrice{
    if (_priceObject) {
        _onePrice = _priceObject.goodsPrice;
        _stockNum = _priceObject.goodsStock;
        _allPrice = _priceObject.goodsPrice*_productNum;
        NSLog(@"_allPrice======%.2f",_allPrice);
        _priceLabel.text = [NSString stringWithFormat:@"￥%.2f",_allPrice];
        _stockLabel.text = [NSString stringWithFormat:@"%ld",_stockNum];
        _defineBtn.enabled = YES;
        _buyNowBtn.enabled = YES;
        _addShoppingCarBtn.enabled = YES;
    }else{
        _priceLabel.text = [NSString stringWithFormat:@"暂无价格"];
        _stockLabel.text = [NSString stringWithFormat:@"0"];
        _defineBtn.enabled = NO;
        _buyNowBtn.enabled = NO;
        _addShoppingCarBtn.enabled = NO;
    }
}

- (IBAction)disView:(id)sender {
    self.dismissView();
}

- (IBAction)define:(id)sender {
    self.dismissView();
    [self addShoppingCar:nil];
}

- (IBAction)buyNow:(id)sender{
    self.dismissView();
}

#pragma mark - 12.添加购物车(1)
/**  12.添加购物车(1) http://app.czctgw.com/api/shoppingcart/ */
- (IBAction)addShoppingCar:(id)sender {
    if(_priceObject){
        NSString *specificationName = [NSString stringWithFormat:@""];
        for(int i = 0; i<_specificationArray.count; i++){
            SpecificationAllObject *speAllObject = [_specificationArray objectAtIndex:i];
            SpecificationObject *selectedSpecObject = [_selectedSpecificationDic objectForKey:speAllObject.specValueName];
            if (selectedSpecObject) {
                if (i == 0) {
                    specificationName = [NSString stringWithFormat:@"%@:%@",speAllObject.specValueName,selectedSpecObject.specName];
                }else{
                    specificationName = [NSString stringWithFormat:@"%@;%@:%@",specificationName,selectedSpecObject.specValueName,selectedSpecObject.specName];
                }
            }else{
                NSLog(@"Str=========return");
                return;
            }
        }
        NSString *memLoginID = [NSString stringWithFormat:@"111111"];
        NSString *productGuid = _priceObject.productGuid;
        NSString *buyNumber = [NSString stringWithFormat:@"%ld",_productNum];
        NSString *buyPrice = [NSString stringWithFormat:@"%f",_priceObject.goodsPrice];
        NSString *attributes = [NSString stringWithFormat:@""];
        NSString *extensionAttriutes = [NSString stringWithFormat:@"M"];
        NSString *specificationValue = _priceObject.specDetail;
        
        NSArray *keysArray = [[NSArray alloc]initWithObjects:@"MemLoginID",@"ProductGuid", @"BuyNumber", @"BuyPrice", @"Attributes", @"ExtensionAttriutes", @"SpecificationName", @"SpecificationValue", nil];
        NSArray *valueArray = [[NSArray alloc]initWithObjects:memLoginID,productGuid,buyNumber,buyPrice,attributes,extensionAttriutes,specificationName,specificationValue, nil];
        NSDictionary *paramesDic = [NSDictionary dictionaryWithObjects:valueArray forKeys:keysArray];

        [CZCService POSTmethod:kShoppingCartAdd_URL andDicParameters:paramesDic andHandle:^(NSDictionary *myresult) {
            if (myresult) {
                NSString *result = [myresult objectForKey:@"return"];
                NSLog(@"添加购物车结果 ------%@",result);
                self.dismissView();
            }
            else{
                NSLog(@"失败");
            }
        }];
    }
    
}

@end
