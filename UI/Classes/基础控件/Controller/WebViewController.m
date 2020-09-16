//
//  WebViewController.m
//  UI
//
//  Created by release on 2019/11/23.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initView];
}

-(void)initView{
   
    UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [imageView setImage:[UIImage imageNamed:@"guide_1"]];
    [self.view addSubview:imageView];
    
    UIWebView* webView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    [self.view addSubview:webView];
    
    //加载本地资源
//    NSURL* url = [NSURL fileURLWithPath:filePath];
//    NSURLRequest* request = [NSURLRequest requestWithURL:url];
//    [webView loadRequest:request];
    
    webView.scalesPageToFit = YES;
    webView.backgroundColor = [UIColor clearColor];
    webView.opaque = NO;//是否是不透明的 no为透明
    webView.delegate = self;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    YCLog(@"开始加载");
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    YCLog(@"加载完成");
    NSString* title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    YCLog(@"title=====%@",title);
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    YCLog(@"加载失败");
}


@end
