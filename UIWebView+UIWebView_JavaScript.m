//
//  UIWebView+UIWebView_JavaScript.m
//  WebViewAndJavaScript
//
//  Created by Kong on 15/12/4.
//  Copyright © 2015年 lq. All rights reserved.
//

#import "UIWebView+UIWebView_JavaScript.h"

@implementation UIWebView (UIWebView_JavaScript)
#pragma mark - 获取
/**
 *  获取到 WebView 的 title
 */
- (NSString *)getTitle
{
    return [self stringByEvaluatingJavaScriptFromString:@"document.title"];
}


#pragma mark - 删除
/**
 *  根据 ElementsID 删除WebView 中的节点
 */
- (void )deleteNodeByElementID:(NSString *)elementID
{
    [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"document.getElementById('%@').remove();",elementID]];
}
/**
 *  根据 ElementsClass 删除 WebView 中的节点
 */
- (void )deleteNodeByElementClass:(NSString *)elementClass
{
    NSString *javaScriptString = [NSString stringWithFormat:@"\
                                  function getElementsByClassName(n) {\
                                  var classElements = [],allElements = document.getElementsByTagName('*');\
                                  for (var i=0; i< allElements.length; i++ )\
                                  {\
                                  if (allElements[i].className == n) {\
                                  classElements[classElements.length] = allElements[i];\
                                  }\
                                  }\
                                  for (var i=0; i<classElements.length; i++) {\
                                  classElements[i].style.display = \"none\";\
                                  }\
                                  }\
                                  getElementsByClassName('%@')",elementClass];
    [self stringByEvaluatingJavaScriptFromString:javaScriptString];
}
/**
 *  根据 ElementsClassTagName 删除 WebView 的节点
 */
- (void)deleteNodeByElementClassName:(NSString *)elementClassName
{
    NSString *javaScritptString = [NSString stringWithFormat:@"document.getElementByTagName('%@').remove();",elementClassName];
    [self stringByEvaluatingJavaScriptFromString:javaScritptString];
}


#pragma mark - 添加
/**
 *  给 JS 中添加 alertView 可用于对用户信息进行提醒
 */
- (void )addAlertViewWithMessage:(NSString *)messageStr
{
    NSString *javaScriptString = [NSString stringWithFormat:@"\
                                  function setImageClickFunction(){\
                                  alert(\"%@\");\
                                  }\
                                  setImageClickFunction()",messageStr];
    [self stringByEvaluatingJavaScriptFromString:javaScriptString];
}


@end
