//
//  PayViewController.m
//  CZC
//
//  Created by 张浩 on 15/7/16.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "PayViewController.h"
#import "PayAddressTableViewCell.h"
#import "ShoppingCarTableViewCell.h"
#import "PayDeliverTableViewCell.h"
#import "PayInfoTableViewCell.h"
@interface PayViewController ()

@end

@implementation PayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"支付";

    //设置tableView的cel有内容时显示分割线，无内容时，不显示分割线
    self.tableView.tableFooterView = [[UIView alloc]init];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController.navigationBar setShadowImage:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        static NSString *CellIdentifier = @"PayAddressTableViewCell";
        PayAddressTableViewCell *cell = (PayAddressTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            NSBundle *bundle = [NSBundle mainBundle];
            NSArray *nibArray = [bundle loadNibNamed:CellIdentifier owner:self options:nil];
            cell = (PayAddressTableViewCell *)[nibArray objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    
    else if (indexPath.row == 1){
        static NSString *CellIdentifier = @"ShoppingCarTableViewCell";
        ShoppingCarTableViewCell *cell = (ShoppingCarTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            NSBundle *bundle = [NSBundle mainBundle];
            NSArray *nibArray = [bundle loadNibNamed:CellIdentifier owner:self options:nil];
            cell = (ShoppingCarTableViewCell *)[nibArray objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        return cell;
    }
    else if (indexPath.row == 2){
        static NSString *CellIdentifier = @"PayDeliverTableViewCell";
        PayDeliverTableViewCell *cell = (PayDeliverTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            NSBundle *bundle = [NSBundle mainBundle];
            NSArray *nibArray = [bundle loadNibNamed:CellIdentifier owner:self options:nil];
            cell = (PayDeliverTableViewCell *)[nibArray objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        return cell;
        
    }
    else if (indexPath.row == 3){
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
            cell.backgroundColor = [UIColor clearColor];
            cell.contentView.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        UITextView *messageText = [[UITextView alloc]initWithFrame:CGRectMake(20, 11, SCREEN_WIDTH-40, 30)];
        messageText.text = @"给卖家留言";
        messageText.backgroundColor = [UIColor grayColor];
        messageText.delegate = self;
        return cell;
     }
    else if (indexPath.row == 4){
        static NSString *CellIdentifier = @"PayInfoTableViewCell";
        PayInfoTableViewCell *cell = (PayInfoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            NSBundle *bundle = [NSBundle mainBundle];
            NSArray *nibArray = [bundle loadNibNamed:CellIdentifier owner:self options:nil];
            cell = (PayInfoTableViewCell *)[nibArray objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        return cell;

    }
    else{
        static NSString *CellIdentifier = @"Cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
            cell.backgroundColor = [UIColor clearColor];
            cell.contentView.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        UITextView *messageText = [[UITextView alloc]initWithFrame:CGRectMake(20, 8, SCREEN_WIDTH-40, 30)];
        messageText.text = @"给卖家留言";
        messageText.backgroundColor = [UIColor grayColor];
        messageText.delegate = self;
        [cell.contentView addSubview:messageText];
        return cell;
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            return 70;
            break;
        case 1:
            return 110;
            break;
        case 2:
            return 44;
            break;
        case 3:
            return 44;
            break;
        case 4:
            return 44;
            break;
        default:
            break;
    };
    return 44;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    //    switch (indexPath.section) {
    
}

@end
