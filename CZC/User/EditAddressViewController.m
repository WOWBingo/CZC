//
//  EditAddressViewController.m
//  CZC
//
//  Created by 张浩 on 15/8/4.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "EditAddressViewController.h"
#import "EditAddressTableViewCell.h"
@interface EditAddressViewController ()

@end

@implementation EditAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"编辑收货人";
    //tableView不可滑动
    self.tableView.scrollEnabled = NO;
    
    UIButton *delBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    [delBtn setTitle:@"删除" forState:UIControlStateNormal];
    [delBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [delBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    delBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [delBtn addTarget:self action:@selector(delClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:delBtn];

//    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenKeyboard)];
//    gesture.numberOfTapsRequired = 1;
//    [self.view addGestureRecognizer:gesture];
    
    
    //获取plist数据
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"area" ofType:@"plist"];
    areaDic = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    NSArray *components = [areaDic allKeys];
    NSArray *sortedArray = [components sortedArrayUsingComparator: ^(id obj1, id obj2) {
        
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    NSMutableArray *provinceTmp = [[NSMutableArray alloc] init];
    for (int i=0; i<[sortedArray count]; i++) {
        NSString *index = [sortedArray objectAtIndex:i];
        NSArray *tmp = [[areaDic objectForKey: index] allKeys];
        [provinceTmp addObject: [tmp objectAtIndex:0]];
    }
    
    province = [[NSArray alloc] initWithArray: provinceTmp];
    
    NSString *index = [sortedArray objectAtIndex:0];
    NSString *selected = [province objectAtIndex:0];
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary: [[areaDic objectForKey:index]objectForKey:selected]];
    
    NSArray *cityArray = [dic allKeys];
    NSDictionary *cityDic = [NSDictionary dictionaryWithDictionary: [dic objectForKey: [cityArray objectAtIndex:0]]];
    city = [[NSArray alloc] initWithArray: [cityDic allKeys]];
    
    
    NSString *selectedCity = [city objectAtIndex: 0];
    district = [[NSArray alloc] initWithArray: [cityDic objectForKey: selectedCity]];

}
#pragma mark- button clicked

- (void) buttobClicked:(id)sender {
    NSInteger provinceIndex = [picker selectedRowInComponent: PROVINCE_COMPONENT];
    NSInteger cityIndex = [picker selectedRowInComponent: CITY_COMPONENT];
    NSInteger districtIndex = [picker selectedRowInComponent: DISTRICT_COMPONENT];
    
    NSString *provinceStr = [province objectAtIndex: provinceIndex];
    NSString *cityStr = [city objectAtIndex: cityIndex];
    NSString *districtStr = [district objectAtIndex:districtIndex];
    
    if ([provinceStr isEqualToString: cityStr] && [cityStr isEqualToString: districtStr]) {
        cityStr = @"";
        districtStr = @"";
    }
    else if ([cityStr isEqualToString: districtStr]) {
        districtStr = @"";
    }
    
    NSString *showMsg = [NSString stringWithFormat: @"%@ %@ %@.", provinceStr, cityStr, districtStr];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"alert"
                                                    message: showMsg
                                                   delegate: self
                                          cancelButtonTitle:@"ok"
                                          otherButtonTitles: nil, nil];
    
    [alert show];
    
    [self.toolbar removeFromSuperview];
    [picker removeFromSuperview];
}
- (void)cancelSelected {
    [self.toolbar removeFromSuperview];
    [picker removeFromSuperview];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"EditAddressTableViewCell";
    EditAddressTableViewCell *cell = (EditAddressTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSBundle *bundle = [NSBundle mainBundle];
        NSArray *nibArray = [bundle loadNibNamed:CellIdentifier owner:self options:nil];
        cell = (EditAddressTableViewCell *)[nibArray objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    //隐藏textfield边框
    cell.infoText.borderStyle=UITextBorderStyleNone;
    cell.infoText.delegate = self;
    switch (indexPath.row) {
        case 0:{
            cell.titleLab.text = @"收货人";
            cell.infoLab.hidden = YES;
            cell.infoText.hidden = NO;
            cell.infoText.text = @"小小";
            //在弹出的键盘上面加一个view来放置退出键盘的Done按钮
            UIToolbar * topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
            [topView setBarStyle:UIBarStyleDefault];
            UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
            UIBarButtonItem * doneButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(hidenKeyboard)];
            NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace, doneButton, nil];
            [topView setItems:buttonsArray];
            [cell.infoText setInputAccessoryView:topView];
        }
            break;
        case 1:{
            cell.titleLab.text = @"联系方式";
            cell.infoLab.hidden = YES;
            cell.infoText.hidden = NO;
            cell.infoText.keyboardType = UIKeyboardTypeNumberPad;
            cell.infoText.text = @"133333333333";
            //在弹出的键盘上面加一个view来放置退出键盘的Done按钮
            UIToolbar * topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
            [topView setBarStyle:UIBarStyleDefault];
            UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
            UIBarButtonItem * doneButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(hidenKeyboard)];
            NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace, doneButton, nil];
            [topView setItems:buttonsArray];
            [cell.infoText setInputAccessoryView:topView];
        }
            break;
        case 2:
            cell.titleLab.text = @"所在地区";
            cell.infoLab.hidden = NO;
            cell.infoText.hidden = YES;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        case 3:
            cell.titleLab.text = @"街道";
            cell.infoLab.hidden = NO;
            cell.infoText.hidden = YES;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        case 4:{
            cell.titleLab.text = @"详细地址";
            cell.infoLab.hidden = YES;
            cell.infoText.hidden = NO;
            cell.infoText.text = @"山东科技大学";
            //在弹出的键盘上面加一个view来放置退出键盘的Done按钮
            UIToolbar * topView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
            [topView setBarStyle:UIBarStyleDefault];
            UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
            UIBarButtonItem * doneButton = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(hidenKeyboard)];
            NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace, doneButton, nil];
            [topView setItems:buttonsArray];
            [cell.infoText setInputAccessoryView:topView];
        }
            break;
        default:
            break;
    }
    return cell;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    //    switch (indexPath.section) {
    if (indexPath.row == 2) {
        picker = [[UIPickerView alloc] initWithFrame: CGRectMake(0, SCREEN_HEIGHT-240, SCREEN_WIDTH, 240)];
        picker.dataSource = self;
        picker.delegate = self;
        picker.showsSelectionIndicator = YES;
        [picker selectRow: 0 inComponent: 0 animated: YES];
        [self.view addSubview: picker];
        [self setUpToolBar];
        selectedProvince = [province objectAtIndex: 0];
    }
    
}
#pragma mark ToolBar
- (void)setUpToolBar {
    self.toolbar = [self setToolbarStyle];
    [self.view addSubview:self.toolbar];
}

- (UIToolbar *)setToolbarStyle {
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    toolbar.frame = CGRectMake(0, SCREEN_HEIGHT-280 ,SCREEN_WIDTH, 40);
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelSelected)];
    UIBarButtonItem *centerSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(buttobClicked:)];
    toolbar.items = @[leftItem,centerSpace,rightItem];
    return toolbar;
}

- (IBAction)saveClick:(id)sender {
    
}
-(void)delClick{
    
}
//隐藏键盘的方法
- (void)hidenKeyboard {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hidenEditAddressTextField"
                                                        object:nil];
}
#pragma mark- Picker Data Source Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == PROVINCE_COMPONENT) {
        return [province count];
    }
    else if (component == CITY_COMPONENT) {
        return [city count];
    }
    else {
        return [district count];
    }
}


#pragma mark- Picker Delegate Methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == PROVINCE_COMPONENT) {
        return [province objectAtIndex: row];
    }
    else if (component == CITY_COMPONENT) {
        return [city objectAtIndex: row];
    }
    else {
        return [district objectAtIndex: row];
    }
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == PROVINCE_COMPONENT) {
        selectedProvince = [province objectAtIndex: row];
        NSDictionary *tmp = [NSDictionary dictionaryWithDictionary: [areaDic objectForKey: [NSString stringWithFormat:@"%d", row]]];
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary: [tmp objectForKey: selectedProvince]];
        NSArray *cityArray = [dic allKeys];
        NSArray *sortedArray = [cityArray sortedArrayUsingComparator: ^(id obj1, id obj2) {
            
            if ([obj1 integerValue] > [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedDescending;//递减
            }
            
            if ([obj1 integerValue] < [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedAscending;//上升
            }
            return (NSComparisonResult)NSOrderedSame;
        }];
        
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (int i=0; i<[sortedArray count]; i++) {
            NSString *index = [sortedArray objectAtIndex:i];
            NSArray *temp = [[dic objectForKey: index] allKeys];
            [array addObject: [temp objectAtIndex:0]];
        }
        
        city = [[NSArray alloc] initWithArray: array];
        
        NSDictionary *cityDic = [dic objectForKey: [sortedArray objectAtIndex: 0]];
        district = [[NSArray alloc] initWithArray: [cityDic objectForKey: [city objectAtIndex: 0]]];
        [picker selectRow: 0 inComponent: CITY_COMPONENT animated: YES];
        [picker selectRow: 0 inComponent: DISTRICT_COMPONENT animated: YES];
        [picker reloadComponent: CITY_COMPONENT];
        [picker reloadComponent: DISTRICT_COMPONENT];
        
    }
    else if (component == CITY_COMPONENT) {
        NSString *provinceIndex = [NSString stringWithFormat: @"%lu", (unsigned long)[province indexOfObject: selectedProvince]];
        NSDictionary *tmp = [NSDictionary dictionaryWithDictionary: [areaDic objectForKey: provinceIndex]];
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary: [tmp objectForKey: selectedProvince]];
        NSArray *dicKeyArray = [dic allKeys];
        NSArray *sortedArray = [dicKeyArray sortedArrayUsingComparator: ^(id obj1, id obj2) {
            
            if ([obj1 integerValue] > [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            
            if ([obj1 integerValue] < [obj2 integerValue]) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            return (NSComparisonResult)NSOrderedSame;
        }];
        
        NSDictionary *cityDic = [NSDictionary dictionaryWithDictionary: [dic objectForKey: [sortedArray objectAtIndex: row]]];
        NSArray *cityKeyArray = [cityDic allKeys];
        
        district = [[NSArray alloc] initWithArray: [cityDic objectForKey: [cityKeyArray objectAtIndex:0]]];
        [picker selectRow: 0 inComponent: DISTRICT_COMPONENT animated: YES];
        [picker reloadComponent: DISTRICT_COMPONENT];
    }
    
}


- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component == PROVINCE_COMPONENT) {
        return 80;
    }
    else if (component == CITY_COMPONENT) {
        return 100;
    }
    else {
        return 115;
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *myView = nil;
    
    if (component == PROVINCE_COMPONENT) {
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 78, 30)];
        myView.textAlignment = UITextAlignmentCenter;
        myView.text = [province objectAtIndex:row];
        myView.font = [UIFont systemFontOfSize:14];
        myView.backgroundColor = [UIColor clearColor];
    }
    else if (component == CITY_COMPONENT) {
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 95, 30)];
        myView.textAlignment = UITextAlignmentCenter;
        myView.text = [city objectAtIndex:row];
        myView.font = [UIFont systemFontOfSize:14];
        myView.backgroundColor = [UIColor clearColor];
    }
    else {
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 110, 30)];
        myView.textAlignment = UITextAlignmentCenter;
        myView.text = [district objectAtIndex:row];
        myView.font = [UIFont systemFontOfSize:14];
        myView.backgroundColor = [UIColor clearColor];
    }
    
    return myView;
}

@end
