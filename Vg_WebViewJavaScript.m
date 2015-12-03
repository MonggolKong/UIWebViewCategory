//
//  Vg_WebViewJavaScript.m
//  DataKong
//
//  Created by Kong on 15/12/3.
//  Copyright © 2015年 lq. All rights reserved.
//

#import "Vg_WebViewJavaScript.h"

@implementation Vg_WebViewJavaScript

+ (NSString *)getTitleFromWebView:(UIWebView *)webView
{
    return [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

@end
