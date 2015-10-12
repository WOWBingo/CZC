//
//  CityListViewController.m
//  CityList
//
//  Created by Chen Yaoqiang on 14-3-6.
//
//

#import "CityListViewController.h"
#import "CityObject.h"

@interface CityListViewController ()

@end

@implementation CityListViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"选择城市";
    
    self.arrayHotCity = [NSMutableArray arrayWithObjects:@"广州市",@"北京市",@"天津市",@"西安市",@"重庆市",@"沈阳市",@"青岛市",@"济南市",@"深圳市",@"长沙市",@"无锡市", nil];
    self.keys = [NSMutableArray array];
    self.arrayCitys = [NSMutableArray array];
    
    [self getCityData];
    
	// Do any additional setup after loading the view.
    _tableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(15,16 , 100, 24)];
    lable1.text = @"定位城市";
    UIButton *locationBtn = [[UIButton alloc]initWithFrame:CGRectMake(15,44 , 100, 24)];
    [locationBtn setTitle:@"济南" forState:UIControlStateNormal];
    [locationBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [locationBtn setBackgroundColor:[UIColor whiteColor]];
    
    UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(15,15 , 100, 26)];
    lable2.text = @"热门城市";
    
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    [headView setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [headView addSubview:lable1];
    [headView addSubview:locationBtn];
    [self.tableView setTableHeaderView:headView];
    
}

#pragma mark - 获取城市数据
-(void)getCityData
{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"citydict"
                                                   ofType:@"plist"];
    self.cities = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    [self.keys addObjectsFromArray:[[self.cities allKeys] sortedArrayUsingSelector:@selector(compare:)]];

    [CZCService GETmethod:kCityAllInfo_URL andParameters:@"" andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            NSArray *dataArr = [myresult objectForKey:@"data"];
            NSArray *list = [CityObject objectArrayWithKeyValuesArray:dataArr];
            NSLog(@"城市列表 ------%@",list);
        }
        else{
            NSLog(@"失败");
        }
    }];
    
    
    //添加热门城市
//    NSString *strHot = @"hot";
//    [self.keys insertObject:strHot atIndex:0];
//    [self.cities setObject:_arrayHotCity forKey:strHot];
}

#pragma mark - tableView
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    bgView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 250, 20)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:14];
    
    NSString *key = [_keys objectAtIndex:section];
//    if ([key rangeOfString:@"hot"].location != NSNotFound) {
//        titleLabel.text = @"热门城市";
//    }
//    else
    titleLabel.text = key;    
    [bgView addSubview:titleLabel];
    
    return bgView;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _keys;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [_keys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString *key = [_keys objectAtIndex:section];
    NSArray *citySection = [_cities objectForKey:key];
    return [citySection count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    NSString *key = [_keys objectAtIndex:indexPath.section];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
        cell.backgroundColor = [UIColor clearColor];
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell.textLabel setTextColor:[UIColor blackColor]];
        cell.textLabel.font = [UIFont systemFontOfSize:18];
    }
    cell.textLabel.text = [[_cities objectForKey:key] objectAtIndex:indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
