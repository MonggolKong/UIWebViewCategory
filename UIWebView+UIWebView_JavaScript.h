//
//  UIWebView+UIWebView_JavaScript.h
//  WebViewAndJavaScript
//
//  Created by Kong on 15/12/4.
//  Copyright © 2015年 lq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (UIWebView_JavaScript)<UIWebViewDelegate>

#pragma mark - 获取
/**
 *  获取到 WebView 的 title
 */
- (NSString *)getTitle;


#pragma mark - 删除
/**
 *  根据 ElementsID 删除WebView 中的节点
 */
- (void )deleteNodeByElementID:(NSString *)elementID;
/**
 *  根据 ElementsClass 删除 WebView 中的节点
 */
- (void )deleteNodeByElementClass:(NSString *)elementClass;
/**
 *  根据 ElementsClassTagName 删除 WebView 的节点
 */
- (void)deleteNodeByElementClassName:(NSString *)elementClassName;


#pragma mark - 添加
/**
 *  给 JS 中添加 alertView 可用于对用户信息进行提醒
 */
- (void )addAlertViewWithMessage:(NSString *)messageStr;

@end
