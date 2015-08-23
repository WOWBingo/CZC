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
        numCell.numBlock = ^(NSInteger num){
            _productNum = num;
            [self showPrice];
        };
        return numCell;
    }else{
        SpecificationAllObject *speObject = [_specificationArray objectAtIndex:row];
        static NSString *cellIdentifier = @"SpecificationChoseCell";
        SpecificationChoseCell *cell = (SpecificationChoseCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (cell == nil) {
            NSBundle *bundle = [NSBundle mainBundle];
            NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
            cell = (SpecificationChoseCell *)[nibArray objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        cell.tag = row;
        //回调输出规格
        cell.specificationBlock = ^(NSString *specStr){
            [self getPriceBySpecification];
        };
        cell.specificationNameLabel.text = speObject.specValueName;
        [cell reloadView:speObject.specificationList];
        return cell;
    }
}


- (IBAction)disView:(id)sender {
    self.dismissView();
}

- (IBAction)define:(id)sender {
    self.dismissView();
}

#pragma mark - 8.规格查询价格
/**
 *8.规格查询价格
 *http://app.czctgw.com/api/Specification/8bf39849-c3b8-4529-abe6-6d3e1da5227d?Detail=%E7%89%9B%E4%BB%94%E8%93%9D,234%7CM,665
 *
 */
- (void)getPriceBySpecification{
    NSString *params = @"8bf39849-c3b8-4529-abe6-6d3e1da5227d?Detail=牛仔蓝,234%7CM,665";
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
                [self showPrice];
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
    }
}

@end
