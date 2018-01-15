##WebView-JavaScript
这是一个 OC 和 JS 之间的WebView 的Category

##WebView-JavaScript 有哪些功能？

* 获取到 WebView 中的元素信息
 *  获取到 WebView 的 title
*  删除
 *  根据 ElementsID 删除WebView 中的节点
 *  根据 ElementsClass 删除 WebView 中的节点
 *  根据 ElementsClassTagName 删除 WebView 的节点
* 添加
 *  给 JS 中添加 alertView 可用于对用户信息进行提醒

## 使用方法
*例如根据 WebView 中的 标签对应的 Class 字段删除对应的标签 
```java 
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [webView deleteNodeByElementClass:@"bradius5"];
    [self.view addSubview:self.webView];
}
```

##关于.h 文件

```java
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

```

##关于.m 文件

```java
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

```

##有问题反馈
在使用中有任何问题，欢迎反馈给我，可以用以下联系方式跟我交流

* 邮件(206793787@qq.com)
* QQ: 206793787
* weibo: MongoliaKong
