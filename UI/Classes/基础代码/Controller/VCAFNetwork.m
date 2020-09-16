//
//  VCAFNetwork.m
//  UI
//
//  Created by release on 2019/11/18.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import "VCAFNetwork.h"
#import <AFNetworking.h>

@interface VCAFNetwork ()
{
    NSArray* _titleArray;
    NSOperationQueue* _queue;
    AFHTTPSessionManager* manager;
}

@end

@implementation VCAFNetwork

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self AFNet];
}

-(void)initView{
    _titleArray = [NSArray arrayWithObjects:@"get请求",@"post请求", nil];
    for (int i=0; i<_titleArray.count; i++) {
        UIButton* btn = [[UIButton alloc]initWithFrame:CGRectMake(100, (i+1)*80, 200, 40)];
        [btn setTitle:_titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTag:101+i];
        [self.view addSubview:btn];
    }
    
    _mLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 200, 413, 600)];
    _mLabel.textAlignment = NSTextAlignmentLeft;
    _mLabel.numberOfLines = 0;
    [self.view addSubview:_mLabel];
}

-(void)AFNet{
 
    [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
                YCLog(@"无网络连接");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                YCLog(@"wifi链接网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                YCLog(@"通过移动4g网络");
                break;
            default:
                break;
        }
    }];
    
    //创建http网络连接对象
    manager = [AFHTTPSessionManager manager];
    //设置请求体数据为json
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    //[manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    //返回格式为json
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //可接收的文本格式规格
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
}



-(void)pressBtn:(UIButton*)btn{
 
    switch (btn.tag) {
        case 101:{
            [manager GET:@"http://m2.qiushibaike.com/article/list/suggest?page=1" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                YCLog(@"成功");
                if ([responseObject isKindOfClass:[NSDictionary class]]) {
                    YCLog(@"responseObject--%@",responseObject);
                    [self.mLabel setText:[self convertToJsonData:responseObject]];
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                YCLog(@"失败");
            }];
        }
            break;
        case 102:{
            NSDictionary* _parameters = @{
                @"username":@"陈延成"
            };
            [manager POST:@"http://api.erp.ctrl.com.cn/app/user/selectUser" parameters:_parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                YCLog(@"成功");
                if ([responseObject isKindOfClass:[NSDictionary class]]) {
                    YCLog(@"responseObject--%@",responseObject);
                    [self.mLabel setText:[self convertToJsonData:responseObject]];
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                YCLog(@"失败");
            }];
        }
            break;
    }
}

-(NSString *)convertToJsonData:(NSDictionary *)dict{

NSError *error;

NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];

NSString *jsonString;

if (!jsonData) {

    YCLog(@"%@",error);

    }else{

        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];

    }

NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];

NSRange range = {0,jsonString.length};

//去掉字符串中的空格

[mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];

NSRange range2 = {0,mutStr.length};

//去掉字符串中的换行符

[mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];

return mutStr;

}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
    return nil;
    }

NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
NSError *err;
NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:NSJSONReadingMutableContainers
                                                      error:&err];
if(err)
{
    YCLog(@"json解析失败：%@",err);
    return nil;
}
    return dic;
}


@end
