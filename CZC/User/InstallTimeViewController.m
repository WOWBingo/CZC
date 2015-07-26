//
//  InstallTimeViewController.m
//  CZC
//
//  Created by 张浩 on 15/7/22.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "InstallTimeViewController.h"

@interface InstallTimeViewController ()

@end

@implementation InstallTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    self.timeArr = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24", nil];
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 2;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return self.timeArr.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (component == 0) {
        return [self.timeArr objectAtIndex:row];
    }else{
        
        return [self.timeArr objectAtIndex:row];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitClick:(id)sender {
}

- (IBAction)cancelClick:(id)sender {
}
@end
