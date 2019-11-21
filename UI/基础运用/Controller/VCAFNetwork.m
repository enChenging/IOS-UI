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
    // Do any additional setup after loading the view.
    self.title = @"AFNetwork网络请求";
    [self initView];
    [self AFNet];
}

-(void)AFNet{
 
    [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"无网络连接");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"wifi链接网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"通过移动4g网络");
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

-(void)pressBtn:(UIButton*)btn{
 
    switch (btn.tag) {
        case 101:{
            [manager GET:@"http://api.tianapi.com/it?key=4a0090627cf07a50def18da875165740&num=20" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"成功");
                if ([responseObject isKindOfClass:[NSDictionary class]]) {
                    NSLog(@"responseObject--%@",responseObject);
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"失败");
            }];
        }
            break;
        case 102:{
            NSDictionary* _parameters = @{
                @"username":@"陈延成"
            };
            [manager POST:@"http://api.erp.ctrl.com.cn/app/user/selectUser" parameters:_parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"成功");
                if ([responseObject isKindOfClass:[NSDictionary class]]) {
                    NSLog(@"responseObject--%@",responseObject);
//                    dispatch_sync(dispatch_get_main_queue(), ^{
//                        [self.mLabel setText:responseObject];
//                    });
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"失败");
            }];
        }
            break;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
