//
//  VCParseXml.m
//  UI
//
//  Created by release on 2019/11/16.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import "VCNSURLConnect.h"

@interface VCNSURLConnect ()<NSURLConnectionDelegate,NSURLConnectionDataDelegate>
{
    NSURLConnection* _connect;
    NSMutableData* _data;
    UILabel* _label;
}

@end

@implementation VCNSURLConnect

@synthesize mLabel = _label;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

-(void)initView{
    _data = [[NSMutableData alloc]init];
    UIButton* btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 40)];
    [btn setTitle:@"发起请求" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 150, 413, 600)];
    _label.textAlignment = NSTextAlignmentLeft;
    _label.numberOfLines = 0;
    [self.view addSubview:_label];
}

-(void)pressBtn:(UIButton*)btn{
 
    NSString* strUrl = @"http://m2.qiushibaike.com/article/list/suggest?page=1";
    NSURL* url = [NSURL URLWithString:strUrl];

    //NSURLConnection已过时
//    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    //    _connect = [NSURLConnection connectionWithRequest:request delegate:self];
    
        NSURLSession* _session = [NSURLSession sharedSession];
        NSURLSessionDataTask* _task = [_session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSString* str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            dispatch_sync(dispatch_get_main_queue(), ^{
                [self.mLabel setText:str];
            });
        }];
        [_task resume];
}

//- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
//
//    YCLog(@"error == %@",error);
//}
//
//- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
//
//    NSHTTPURLResponse* res = (NSHTTPURLResponse*)response;
//
//    if (res.statusCode == 200) {
//        YCLog(@"连接成功");
//    }else if (res.statusCode == 404){
//        YCLog(@"服务器正常，请求地址不对");
//    }else if (res.statusCode == 500){
//        YCLog(@"服务器宕机");
//    }
//}
//
//- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
//    [_data appendData:data];
//}
//
//- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
//    //将二进制数据转化为字符串数据
//    NSString* str = [[NSString alloc]initWithData:_data encoding:NSUTF8StringEncoding];
//    [_label setText:str];
//    YCLog(@"请求成功后的数据-----------------------------------------------------%@",str);
//}

@end
