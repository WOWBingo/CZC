//
//  EditAddressViewController.m
//  CZC
//
//  Created by 张浩 on 15/8/4.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "EditAddressViewController.h"
#import "EditAddressTableViewCell.h"
#import "RegionObject.h"
#
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
    
    self.regionArr = [[NSMutableArray alloc]init];
    self.provinceArr = [[NSMutableArray alloc]init];
    self.cityArr = [[NSMutableArray alloc]init];
    self.districtArr = [[NSMutableArray alloc]init];
    if (!self.isAdd) {
        self.consignee = self.addressObj.name;
        self.telNum = self.addressObj.tel;
        self.addressStr = self.addressObj.addressValue;
        self.postalCode = self.addressObj.postalcode;
        self.detailAddress = self.addressObj.address;
    }
    //获取省信息
    [self getRegionInfo:@"0" andRegionArr:self.provinceArr];
    //获取市信息
    [self getRegionInfo:@"1" andRegionArr:self.cityArr];//
    //获取区信息
    [self getRegionInfo:@"2" andRegionArr:self.districtArr];//

    
}
#pragma mark - 50.获取省、市、区
/** 49.获取省、市、区 http://app.czctgw.com/api/region/0*/
-(void)getRegionInfo:(NSString *)params andRegionArr:(NSMutableArray *)arr{
    [CZCService GETmethod:kRegion_URL andParameters:params andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            NSArray *resultArr = [myresult objectForKey:@"RegionList"];
            NSLog(@"获取省市区 ------%@",resultArr);
            NSArray *regionArr = [RegionObject objectArrayWithKeyValuesArray:resultArr];
            NSLog(@"经过封装的Arr%@",regionArr);
            //遍历regionArr,判断是否还有下一子类，如果有，继续请求
            for (RegionObject *regionObj in regionArr) {
                [arr addObject:regionObj];
            }
            NSLog(@"%@",arr);
        }
        else{
            NSLog(@"失败");
        }
        //刷新
        [self.pickView reloadAllComponents];
    }];
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
    cell.infoText.tag = indexPath.row;
    switch (indexPath.row) {
        case 0:{
            cell.titleLab.text = @"收货人";
            cell.infoLab.hidden = YES;
            cell.infoText.hidden = NO;
            cell.infoText.text = self.consignee;
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
            cell.infoText.text = self.telNum;
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
            cell.infoLab.text = self.addressStr;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        case 3:{
            cell.titleLab.text = @"邮政编码";
            cell.infoLab.hidden = YES;
            cell.infoText.hidden = NO;
            cell.infoText.keyboardType = UIKeyboardTypeNumberPad;
            cell.infoText.text = self.postalCode;
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
        case 4:{
            cell.titleLab.text = @"详细地址";
            cell.infoLab.hidden = YES;
            cell.infoText.hidden = NO;
            cell.infoText.text = self.detailAddress;
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
        _indexPath=indexPath;
        [self hidenKeyboard];
        // 为UIPickerView控件设置dataSource和delegate
        self.pickView.hidden = NO;
        [self setUpToolBar];
    }
    
}
#pragma mark ToolBar
- (void)setUpToolBar {
    self.toolbar = [self setToolbarStyle];
    [self.view addSubview:self.toolbar];
}

- (UIToolbar *)setToolbarStyle {
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    toolbar.frame = CGRectMake(0, SCREEN_HEIGHT-256 ,SCREEN_WIDTH, 40);
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelSelected)];
    UIBarButtonItem *centerSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(buttobClicked)];
    toolbar.items = @[leftItem,centerSpace,rightItem];
    return toolbar;
}

- (IBAction)saveClick:(id)sender {
    //判断为空和不合法输入
    if ([self.consignee isEqualToString:@""]) {
        [self showHUDViewTitle:@"请输入收货人姓名" info:@"" andCodes:^{
            
        }];
        return;
    }else if ([self.telNum isEqualToString:@""]){
        [self showHUDViewTitle:@"请输入收货人联系方式" info:@"" andCodes:^{
            
        }];
    }
    else if ([self.addressStr isEqualToString:@""]){
        [self showHUDViewTitle:@"请选择所在地区" info:@"" andCodes:^{
            
        }];
    }
    else if ([self.postalCode isEqualToString:@""]){
        [self showHUDViewTitle:@"请输入邮政编码" info:@"" andCodes:^{
            
        }];
    }
    else if ([self.detailAddress isEqualToString:@""]){
        [self showHUDViewTitle:@"请输入详细地址" info:@"" andCodes:^{
            
        }];
    }
    NSString *addressInfo = [NSString stringWithFormat:@"%@%@",self.addressStr,self.detailAddress];
    NSDictionary *addressDic = @{
                                 @"NAME":self.consignee,
                                 @"Email":@"",
                                 @"Address":self.detailAddress,
                                 @"AddressValue":self.addressStr,
                                 @"Postalcode":self.postalCode,
                                 @"Mobile":self.telNum,
                                 @"Tel":self.telNum,
                                 @"AddressCode":self.addressCode,
                                 @"MemLoginID":kAccountObject.memLoginID,
                                 };
    [CZCService POSTmethod:kAddressAdd_URL andDicParameters:addressDic andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            NSInteger result = [[myresult objectForKey:@"return"] integerValue];
            NSLog(@"38.收货地址结果 ------%ld",(long)result);
            if (result == 201) {
                [self showHUDViewTitle:@"成功" info:@"" andCodes:^{
                    [self.navigationController popViewControllerAnimated:YES];
                }];
            }else{
                [self showHUDViewTitle:@"失败" info:@"" andCodes:^{
                    
                }];
            }
        }
        else{
            NSLog(@"失败");
        }
    }];
}
-(void)delClick{
    
}
-(void)cancelSelected{
    [self.toolbar removeFromSuperview];
    self.pickView.hidden = YES;
}
-(void)buttobClicked{
    self.pickView.hidden = YES;
    [self.toolbar removeFromSuperview];
    NSInteger selectedProvinceIndex = [self.pickView selectedRowInComponent:0];
    NSInteger selectedCityIndex = [self.pickView selectedRowInComponent:1];
    NSInteger selectedDistrictIndex = [self.pickView selectedRowInComponent:2];
    RegionObject *provinceObj = [self.provinceArr objectAtIndex:selectedProvinceIndex];
    RegionObject *cityObj = [self.cityArr objectAtIndex:selectedCityIndex];
    RegionObject *district = [self.districtArr objectAtIndex:selectedDistrictIndex];
    
    self.addressStr = [NSString stringWithFormat:@"%@ %@ %@",provinceObj.name,cityObj.name,district.name];
    self.addressCode = district.code;
    //刷新tableView
    [self.tableView reloadData];
}
//隐藏键盘的方法
- (void)hidenKeyboard {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hidenEditAddressTextField"
                                                        object:nil];
}
#pragma UIPickerViewDataSource
// UIPickerViewDataSource中定义的方法，该方法的返回值决定该控件包含多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
    return 3;
}
// UIPickerViewDataSource中定义的方法，该方法的返回值决定该控件指定列包含多少个列表项
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    int compoentCount = 0;
    switch (component) {
        case 0:
            compoentCount = (int)self.provinceArr.count;
            break;
        case 1:
            compoentCount = (int)self.cityArr.count;
            break;
        case 2:
            compoentCount = (int)self.districtArr.count;
            break;
        default:
            break;
    }
    return compoentCount;
}
// UIPickerViewDelegate中定义的方法，该方法返回的NSString将作为UIPickerView
// 中指定列和列表项的标题文本
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    // 由于该控件只包含一列，因此无须理会列序号参数component
    // 该方法根据row参数返回books中的元素，row参数代表列表项的编号，
    // 因此该方法表示第几个列表项，就使用books中的第几个元素
    NSString *compoentTitle = 0;
    RegionObject *regionObj = [[RegionObject alloc]init];
    switch (component) {
        case 0:{
            regionObj = [self.provinceArr objectAtIndex:row];
            compoentTitle = regionObj.name;
        }
            break;
        case 1:{
            regionObj = [self.cityArr objectAtIndex:row];
            compoentTitle = regionObj.name;
        }
            break;
        case 2:{
            regionObj = [self.districtArr objectAtIndex:row];
            compoentTitle = regionObj.name;
        }
            break;
        default:
            break;
    }
    return compoentTitle;
}
// 当用户选中UIPickerViewDataSource中指定列和列表项时激发该方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component
{
    //根据选中的省市区 更新pickview
    RegionObject *regionObj = [[RegionObject alloc]init];
    switch (component) {
        case 0:{
            [self.cityArr removeAllObjects];
            [self.districtArr removeAllObjects];
            regionObj = [self.provinceArr objectAtIndex:row];
            [self getRegionInfo:regionObj.orderID andRegionArr:self.cityArr];
            [self.pickView reloadComponent:1];
        }
            break;
        case 1:{
            [self.districtArr removeAllObjects];
            regionObj = [self.cityArr objectAtIndex:row];
            [self getRegionInfo:regionObj.orderID andRegionArr:self.districtArr];
            [self.pickView reloadComponent:2];
        }
        default:
            break;
    }
}
#pragma textfield
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    self.pickView.hidden = YES;
    [self.toolbar removeFromSuperview];
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    switch (textField.tag) {
        case 0:
            self.consignee = textField.text;
            break;
        case 1:
            self.telNum = textField.text;
            break;
        case 3:
            self.postalCode = textField.text;
            break;
        case 4:
            self.detailAddress = textField.text;
            break;
        default:
            break;
    }
}
@end
