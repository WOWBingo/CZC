//
//  LoginViewController.h
//  CZC
//
//  Created by 张浩 on 15/7/6.
//  Copyright (c) 2015年 周德艺. All rights reserved.
//

#import "ProvisionViewController.h"

@interface ProvisionViewController ()

@end

@implementation ProvisionViewController
@synthesize webView;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"服务协议";
//    self.navigationItem.leftBarButtonItem = self.backMenuBtn;
    
    UISwipeGestureRecognizer* recognizer;
    // handleSwipeFrom 是偵測到手势，所要呼叫的方法
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeFrom:)];
    recognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:recognizer];
    
    //加载本地的html文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"serviceTerm.html" ofType:nil];
    NSString *htmlString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    [self.webView loadHTMLString:htmlString baseURL:nil];
    [webView.scrollView setBounces:NO];
}


#pragma mark- 手势操作
- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)gesture {
    if (!self.webView.loading) {
        [self.webView stopLoading];
    }
    UISwipeGestureRecognizerDirection direction = gesture.direction;
    switch (direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            break;
        case UISwipeGestureRecognizerDirectionRight:
            [self back:nil];
            break;
        default:
            break;
    }
}

#pragma mark 获取指定URL的MIMEType类型
- (NSString *)mimeType:(NSURL *)url {
    //1NSURLRequest
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //2NSURLConnection
    
    //3 在NSURLResponse里，服务器告诉浏览器用什么方式打开文件。
    
    //使用同步方法后去MIMEType
    NSURLResponse *response = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    NSLog(@"textEncodingName:%@",response.textEncodingName);
    return response.MIMEType;
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
