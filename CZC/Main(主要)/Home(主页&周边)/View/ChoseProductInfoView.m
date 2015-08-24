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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect {
    
    _productNum = 1;
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView setTableFooterView:[[UIView alloc]init]];
    //[_tableView setSeparatorColor:[UIColor clearColor]];
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 60;
    
    [PublicObject drawHorizontalLineOnView:self.titleView andX:0 andY:self.titleView.frame.size.height-1 andWidth:SCREEN_WIDTH andColor:[UIColor lightGrayColor]];
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        _selectedSpecificationArray = [[NSMutableArray alloc]init];
    }
    return self;
}

+(ChoseProductInfoView *)instanceView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"ChoseProductInfoView" owner:nil options:nil];
    return [nibView objectAtIndex:0];
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
        for (int i = 0; i<_selectedSpecificationArray.count; i++) {
            SpecificationObject *selectedSpecObject = [_selectedSpecificationArray objectAtIndex:i];
            if ([speAllObject.specValueName isEqualToString:selectedSpecObject.specName]) {
                cell.tag = selectedSpecObject.specValueid;
                break;
            }
        }
        //回调输出规格
        cell.specificationBlock = ^(SpecificationObject *specObject){
            NSLog(@"specStr=========%@----%@----%ld",specObject.specName,specObject.specValueName,specObject.specValueid);
            //判断选中的规格是否存在相同类型，存在替换，不存在添加
            BOOL isNotHave = YES;
            for (int i = 0; i<_selectedSpecificationArray.count; i++) {
                SpecificationObject *selectedSpecObject = [_selectedSpecificationArray objectAtIndex:i];
                if ([selectedSpecObject.specName isEqualToString:specObject.specName]) {
                    [_selectedSpecificationArray replaceObjectAtIndex:i withObject:specObject];
                    isNotHave = NO;
                    break;
                }
            }
            if (isNotHave) {
                [_selectedSpecificationArray addObject:specObject];
            }
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
//    for (int i = 0; i<_selectedSpecificationArray.count; i++) {
//        SpecificationObject *selectedSpecObject = [_selectedSpecificationArray objectAtIndex:i];
//        if (i == 0) {
//            params = [NSString stringWithFormat:@"%@%@,%ld",params,selectedSpecObject.specValueName,selectedSpecObject.specValueid];
//        }else{
//            params = [NSString stringWithFormat:@"%@|%@,%ld",params,selectedSpecObject.specValueName,selectedSpecObject.specValueid];
//        }
//        
//    }
//    NSLog(@"Str=========%@",params);
    
    NSString *params = @"8bf39849-c3b8-4529-abe6-6d3e1da5227d?Detail=牛仔蓝,234|M,665";

    [CZCService GETmethod:kPriceBySpecification_URL andParameters:params andHandle:^(NSDictionary *myresult) {
        NSDictionary *result = myresult;
        if (result) {
            NSArray *dataArr = [result objectForKey:@"Specification"];
            NSDictionary *dic = [dataArr objectAtIndex:0];
            //NSArray *list = [SpecificationOfPriceObject objectArrayWithKeyValuesArray:dataArr];
            NSLog(@"8.产品规格获得价格 ------%@",dic);
            if (dic) {
               // _priceArray = [[NSMutableArray alloc]initWithArray:list];
                _priceObject = [SpecificationOfPriceObject objectWithKeyValues:dic];
                _onePrice = _priceObject.goodsPrice;
                _stockNum = _priceObject.goodsStock;
                _stockLabel.text = [NSString stringWithFormat:@"￥%ld",_stockNum];
                [self showPrice];
//                NSDictionary *dic = @{
//                                      @"MemLoginID":@"111111",
//                                      @"ProductGuid":@"af0c9869-d790-482b-af24-6c8e1e5ada1c",
//                                      @"BuyNumber":@"1",
//                                      @"BuyPrice":@"234",
//                                      @"Attributes":@"",
//                                      @"ExtensionAttriutes":@"M",
//                                      @"SpecificationName":@"颜色:褐色;鞋码:40",
//                                      @"SpecificationValue":_priceObject.specDetail
//                                      };
            }
        }
        else{
            NSLog(@"失败");
        }
    }];
}

/**
 *	计算价格
 */
- (void)showPrice{
    if (_onePrice) {
        _allPrice = _priceObject.goodsPrice*_productNum;
        NSLog(@"prcie======%.2f",_allPrice);
        _priceLabel.text = [NSString stringWithFormat:@"￥%.2f",_allPrice];
        _stockLabel.text = [NSString stringWithFormat:@"%ld",_stockNum];
    }
}

/**
 *	刷新对象
 */
- (void)reloadProduct:(ProductsObject *)object{
    self.product = object;
    _priceLabel.text = [NSString stringWithFormat:@"￥%.2f",_product.shopPrice];
    _stockLabel.text = [NSString stringWithFormat:@"%ld",_product.repertoryCount];
    [_imgView setImage:[UIImage imageNamed:@"cpsc-p1"]];
}


- (IBAction)disView:(id)sender {
    self.dismissView();
}

- (IBAction)define:(id)sender {
    self.dismissView();
}

- (IBAction)buyNow:(id)sender{
    self.dismissView();
}

- (IBAction)addShoppingCar:(id)sender {
    self.dismissView();
}

@end
