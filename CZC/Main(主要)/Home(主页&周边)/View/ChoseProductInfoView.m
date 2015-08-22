//
//  ChoseProductInfoView.m
//  CZC
//
//  Created by 周德艺 on 15/8/20.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ChoseProductInfoView.h"

@implementation ChoseProductInfoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect {
    
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
    return 3;
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
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//        NSBundle *bundle = [NSBundle mainBundle];
//        NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
//        cell = (<#UITableViewCell#> *)[nibArray objectAtIndex:0];
        cell.textLabel.text = [NSString stringWithFormat:@"这是第%ld条",(long)row];
        
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return cell;
}


- (IBAction)disView:(id)sender {
    self.dismissView();
}

- (IBAction)define:(id)sender {
    self.dismissView();
}

@end
