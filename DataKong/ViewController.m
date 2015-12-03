//
//  ViewController.m
//  DataKong
//
//  Created by Kong on 15/12/1.
//  Copyright (c) 2015年 lq. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Frame.h"
#import "Vg_WebViewJavaScript.h"
@interface ViewController ()<UIWebViewDelegate>
@property (nonatomic, retain) UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    NSURL *url = [NSURL URLWithString:@"http://m.ydt.com/login/register.html"];
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
    [self.webView loadRequest:urlRequest];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"web 开始加载");

}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"web 完成加载");
    NSLog(@"web View Title is %@",[Vg_WebViewJavaScript getTitleFromWebView:webView]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
