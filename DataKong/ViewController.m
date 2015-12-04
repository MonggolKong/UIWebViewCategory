//
//  ViewController.m
//  DataKong
//
//  Created by Kong on 15/12/1.
//  Copyright (c) 2015年 lq. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Frame.h"
#import "UIWebView+UIWebView_JavaScript.h"

@interface ViewController ()<UIWebViewDelegate>
@property (nonatomic, retain) UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http://115.28.81.87/jushihui/wap/mall/index.html"];
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 100)];
    [self.webView loadRequest:urlRequest];
    self.webView.delegate = self;
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"web 开始加载");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [webView deleteNodeByElementClass:@"pa left0 top10 bradius5"];
    [Vg_WebViewJavaScript deleteNodeByElementClass:webView elementClass:@"mui-bar mui-bar-nav"];//通过 class 名字删除 JS中的消息
    [self.view addSubview:self.webView];
    NSLog(@"web 完成加载");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
