//
//  UserInfoViewController.m
//  CZC
//
//  Created by 张浩 on 15/7/8.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "UserInfoViewController.h"
#import "ChangeUseInfoViewController.h"
#import "AddressViewController.h"
#import "AccountSecurityViewController.h"
@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人信息";
    //设置tableView的cel有内容时显示分割线，无内容时，不显示分割线
    self.tableView.tableFooterView = [[UIView alloc]init];
    //tableView背景
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.trueName = [[UILabel alloc]init];
    self.userName = [[UILabel alloc]init];
    self.sex = [[UILabel alloc]init];
    self.age = [[UILabel alloc]init];
    self.tel = [[UILabel alloc]init];
    
    // 修改navigation下边框
    [self.navigationController.navigationBar setShadowImage:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeDate:) name:@"date"object:nil];
    self.dateStr = @"2011-11-08";
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//异步加载图片
- (void)updateImage:(UIImage *)img{
    if (img != nil) {
        [self.iconBtn setImage:img forState:UIControlStateNormal];
    } else {
        [self.iconBtn setImage:[UIImage imageNamed:@"cpsc-p1"] forState:UIControlStateNormal];
    }
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 5;
            break;
        case 1:
            return 2;
            break;
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    switch (indexPath.section) {
        case 0:
            if(indexPath.row == 0){
                //头像
                UILabel *iconLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 60, 40)];
                iconLab.text = @"头像";
                iconLab.textColor = [UIColor blackColor];
                iconLab.font = [UIFont systemFontOfSize:15];
                [cell addSubview:iconLab];
                
                self.iconBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-60, 10, 40, 40)];
                self.iconBtn.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
                self.iconBtn.layer.borderWidth = 3.0f;
                self.iconBtn.layer.rasterizationScale = [UIScreen mainScreen].scale;
                self.iconBtn.layer.shouldRasterize = YES;
                self.iconBtn.clipsToBounds = YES;
                self.iconBtn.layer.masksToBounds = YES;
                self.iconBtn.layer.cornerRadius = self.iconBtn.frame.size.width / 2;
                [self.iconBtn addTarget:self action:@selector(changePhoto) forControlEvents:UIControlEventTouchUpInside];
                //                NSString *imgurl = [NSString stringWithFormat:@"%@%@",KGetImage_URL,self.user.photourl];
                //                [self.iconBtn sd_setImageWithURL:[NSURL URLWithString:imgurl] forState:UIControlStateNormal placeholderImage:self.photo];
                //加载图片
                NSString *imgURL = @"";
                imgURL = [PublicObject convertNullString:kAccountObject.url];
                if ([imgURL isEqualToString:@""]||imgURL == nil) {
                    [self.iconBtn setImage:[UIImage imageNamed:@"cpsc-p1"] forState:UIControlStateNormal];
                } else {
                    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                        NSString *urlString = [NSString stringWithFormat:@"%@",imgURL];
                        NSURL *imageUrl = [NSURL URLWithString:urlString];
                        NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
                        UIImage *img = [UIImage imageWithData:imageData];
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [self updateImage:img];
                        });
                    });
                }
                [cell addSubview:self.iconBtn];
            }
            if (indexPath.row == 1) {
                //用户名
                UILabel *trueNameLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 4, 60, 40)];
                trueNameLab.text = @"用户名";
                trueNameLab.textColor = [UIColor blackColor];
                trueNameLab.font = [UIFont systemFontOfSize:15];
                [cell addSubview:trueNameLab];
                
                [self.trueName setFrame:CGRectMake(20, 4, SCREEN_WIDTH-50, 40)];
                self.trueName.textAlignment = NSTextAlignmentRight;
                self.trueName.text = kAccountObject.memLoginID;
                self.trueName.textColor = [UIColor grayColor];
                self.trueName.font = [UIFont systemFontOfSize:15];
                cell.accessoryType = UITableViewCellSelectionStyleNone;
                [cell addSubview:self.trueName];
            }
            if (indexPath.row == 2) {
                //昵称
                UILabel *userNameLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 4, 60, 40)];
                userNameLab.text = @"昵称";
                userNameLab.textColor = [UIColor blackColor];
                userNameLab.font = [UIFont systemFontOfSize:15];
                [cell addSubview:userNameLab];
                
                [self.userName setFrame:CGRectMake(20, 4, SCREEN_WIDTH-50, 40)];
                self.userName.textAlignment = NSTextAlignmentRight;
                self.userName.text = kAccountObject.name;
                self.userName.textColor = [UIColor grayColor];
                self.userName.font = [UIFont systemFontOfSize:15];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                [cell addSubview:self.userName];
            }
            if (indexPath.row == 3) {
                //性别
                UILabel *sexLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 4, 60, 40)];
                sexLab.text = @"性别";
                sexLab.textColor = [UIColor blackColor];
                sexLab.font = [UIFont systemFontOfSize:15];
                [cell addSubview:sexLab];
                
                [self.sex setFrame:CGRectMake(20, 4, SCREEN_WIDTH-50, 40)];
                self.sex.textAlignment = NSTextAlignmentRight;
                self.sex.text = @"保密";
                self.sex.textColor = [UIColor grayColor];
                self.sex.font = [UIFont systemFontOfSize:15];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                [cell addSubview:self.sex];
            }
            if (indexPath.row == 4){
                //出生日期
                UILabel *ageLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 4, 80, 40)];
                ageLab.text = @"出生日期";
                ageLab.textColor = [UIColor blackColor];
                ageLab.font = [UIFont systemFontOfSize:15];
                [cell addSubview:ageLab];
                
                [self.age setFrame:CGRectMake(20, 4, SCREEN_WIDTH-50, 40)];
                self.age.textAlignment = NSTextAlignmentRight;
                self.age.text = self.dateStr;
                self.age.textColor = [UIColor grayColor];
                self.age.font = [UIFont systemFontOfSize:15];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                [cell addSubview:self.age];
            }
            break;
        case 1:
            if (indexPath.row == 0) {
                //地址管理
                UILabel *addressLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 4, 80, 40)];
                addressLab.text = @"地址管理";
                addressLab.textColor = [UIColor blackColor];
                addressLab.font = [UIFont systemFontOfSize:15];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                [cell addSubview:addressLab];
            }
            if (indexPath.row == 1) {
                //账户安全
                UILabel *accountLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 4, 80, 40)];
                accountLab.text = @"账户安全";
                accountLab.textColor = [UIColor blackColor];
                accountLab.font = [UIFont systemFontOfSize:15];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                [cell addSubview:accountLab];
            }
            break;
        default:
            break;
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.0001;
    }
    else{
        return 13;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 60;
        }
    }
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                [self changePhoto];
            }
            if(indexPath.row == 2){
                ChangeUseInfoViewController *changeInfoVC = [[ChangeUseInfoViewController alloc]initWithNibName:@"ChangeUseInfoViewController" bundle:nil];
                changeInfoVC.title = @"昵称";
                //                changeInfoVC.infoStr = self.user.truename;
                changeInfoVC.isTrueName = YES;
                changeInfoVC.isSex = NO;
                [self.navigationController pushViewController:changeInfoVC animated:YES];
            }
            if (indexPath.row == 3) {
                ChangeUseInfoViewController *changeInfoVC = [[ChangeUseInfoViewController alloc]initWithNibName:@"ChangeUseInfoViewController" bundle:nil];
                changeInfoVC.title = @"性别";
                //                changeInfoVC.infoStr = self.user.sex;
                changeInfoVC.isTrueName = NO;
                changeInfoVC.isSex = YES;
                [self.navigationController pushViewController:changeInfoVC animated:YES];
            }
            if (indexPath.row == 4) {
                _indexPath=indexPath;
                [_pickview remove];
                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                [dateFormatter setDateFormat:@"yyyy-MM-dd"];
                NSDate *date = [dateFormatter dateFromString:@"2011-11-08"];
                NSLog(@"%@", date);
                _pickview=[[ZHPickView alloc] initDatePickWithDate:date datePickerMode:UIDatePickerModeDate isHaveNavControler:NO];
                _pickview.delegate=self;
                [_pickview show];
            }
            break;
            
        case 1:
            if(indexPath.row == 0){
                AddressViewController *addressVC = [[AddressViewController alloc]initWithNibName:@"AddressViewController" bundle:nil];
                addressVC.title = @"地址管理";
                [self.navigationController pushViewController:addressVC animated:YES];
            }
            if(indexPath.row == 1){
                AccountSecurityViewController *accountVC = [[AccountSecurityViewController alloc]initWithNibName:@"AccountSecurityViewController" bundle:nil];
                accountVC.title = @"账户安全";
                [self.navigationController pushViewController:accountVC animated:YES];
            }
            break;
        default:
            break;
    }
}
- (void)changePhoto {
    UIActionSheet *sheet;
    // 判断是否支持相机
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        sheet  = [[UIActionSheet alloc] initWithTitle:@"选择头像" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"拍照",@"从相册选择", nil];
    }
    else {
        sheet = [[UIActionSheet alloc] initWithTitle:@"选择头像" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"取消" otherButtonTitles:@"从相册选择", nil];
    }
    sheet.tag = 255;
    [sheet showInView:self.view];
}
#pragma mark 选择照片
//上传图片

-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == 255) {
        NSUInteger sourceType = 0;
        // 判断是否支持相机
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            switch (buttonIndex) {
                case 0:
                    // 取消
                    return;
                case 1:
                    // 相机
                    sourceType = UIImagePickerControllerSourceTypeCamera;
                    break;
                case 2:
                    // 相册
                    sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    break;
            }
        }
        else {
            if (buttonIndex == 0) {
                return;
            } else {
                sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            }
        }
        // 跳转到相机或相册页面
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = YES;
        imagePickerController.sourceType = sourceType;
        [self presentViewController:imagePickerController animated:YES completion:^{}];
    }
}

#pragma mark - image picker delegte
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *selectImage = [info objectForKey:UIImagePickerControllerEditedImage];
    
    UIImage* newImage = [PublicObject fixOrientation:selectImage];
    
    NSData *imageData = UIImageJPEGRepresentation(newImage,0.5);
    UIImage *newImg = [UIImage imageWithData:imageData];
    
    [self.iconBtn setImage:newImg forState:UIControlStateNormal];
    /**
     *	上传一
     */
    NSDictionary *paramesDic = @{
                                 @"memloginid":kAccountObject.memLoginID,
                                 @"originalimage":[self image2DataURL:newImg]
                                 };
    [self showHUDBeginWithTitle:@"正在上传……"];
    [CZCService POSTUploadWithUrlmethod:@"http://www.czctgw.com/api/main/member/uploadpic.ashx" andDicParameters:paramesDic andHandle:^(NSDictionary *myresult) {
        if (myresult) {
            NSLog(@"imageresult=======%@",myresult);
            NSString *imageURL;
            [self dismissHUDEnd];
            if ([[myresult objectForKey:@"tip"]intValue ] == 1) {
                imageURL = [NSString stringWithFormat:@"http://www.czctgw.com%@",[myresult objectForKey:@"success"]];
                [self showHUDViewTitle:@"上传成功！" info:@"" andCodes:^{
                    
                }];
            }else{
                [self showHUDViewTitle:@"上传失败！" info:@"" andCodes:^{
                    
                }];
            }
        }
    }];
    
}

#pragma mark -方法1图片转base64
- (BOOL) imageHasAlpha: (UIImage *) image
{
    CGImageAlphaInfo alpha = CGImageGetAlphaInfo(image.CGImage);
    return (alpha == kCGImageAlphaFirst ||
            alpha == kCGImageAlphaLast ||
            alpha == kCGImageAlphaPremultipliedFirst ||
            alpha == kCGImageAlphaPremultipliedLast);
}
- (NSString *) image2DataURL: (UIImage *) image
{
    NSData *imageData = nil;
    NSString *mimeType = nil;
    
    if ([self imageHasAlpha: image]) {
        imageData = UIImagePNGRepresentation(image);
        mimeType = @"image/png";
    } else {
        imageData = UIImageJPEGRepresentation(image, 0.5f);
        mimeType = @"image/jpeg";
    }
    
    return [NSString stringWithFormat:@"%@",
            [imageData base64EncodedStringWithOptions: 0]];
    
    //[NSString stringWithFormat:@"data:%@;base64,%@", mimeType,
    //[imageData base64EncodedStringWithOptions: 0]];
    
}



- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}
- (void) changeDate:(NSNotification*) notification
{
    self.dateStr = [notification object];//获取到传递的对象
    [self.tableView reloadData];
}






@end
