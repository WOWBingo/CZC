//
//  HundredViewController.m
//  CZC
//
//  Created by 周德艺 on 15/7/15.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "HundredViewController.h"
#import "HundredTableViewCell.h"

@interface HundredViewController ()

@end

@implementation HundredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"百元专区";
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
}

-(void)viewWillAppear:(BOOL)animated{
    
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
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        return SCREEN_WIDTH*0.3;
//    }
//    return UITableViewAutomaticDimension;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"HundredTableViewCell";
    HundredTableViewCell *cell = (HundredTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:cellIdentifier owner:self options:nil];
        cell = (HundredTableViewCell *)[nibArray objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return cell;
}


@end
