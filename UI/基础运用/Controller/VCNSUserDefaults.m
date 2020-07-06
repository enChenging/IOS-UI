//
//  VCNSUserDefaults.m
//  UI
//
//  Created by release on 2019/11/14.
//  Copyright © 2019 Mr. release. All rights reserved.
//
/**
 NSUserDefaults用来存储 用户设置 系统配置等一些小的数据。
 因为数据是明文存储在 plist 文件中，不安全，即使只是修改一个 key 都会 load 整个文件，数据多加载慢(IO 内存)，不适合存储大量数据。
 它是单例的，也是线程安全的，是以键值对 key-value 的形式保存在沙盒中
 存储路径为：沙盒路径的Library——>Preferences文件夹中
 相当于全局的变量
 */

#import "VCNSUserDefaults.h"

@interface VCNSUserDefaults ()

@end

@implementation VCNSUserDefaults

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"NSUserDefaults";
    self.edgesForExtendedLayout = UIRectEdgeNone;//不让view延伸到整个屏幕
    [self initView];
}

-(void)initView{
 
    UIButton* btn01 = [[UIButton alloc]initWithFrame:CGRectMake(30, 30, 100, 40)];
    [btn01 setTitle:@"写入文件" forState:UIControlStateNormal];
    [btn01 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn01 setBackgroundColor:[UIColor brownColor]];
    [btn01 addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn01 setTag:101];
    [self.view addSubview:btn01];
    
    UIButton* btn02 = [[UIButton alloc]initWithFrame:CGRectMake(30, 200, 100, 40)];
    [btn02 setTitle:@"读取文件" forState:UIControlStateNormal];
    [btn02 setBackgroundColor:[UIColor brownColor]];
    [btn02 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn02 addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn02 setTag:102];
    [self.view addSubview:btn02];
    
}

-(void)pressBtn:(UIButton*)btn{
 
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    if (btn.tag == 101) {
        [ud setObject:@"Xiaoming" forKey:@"Name"];
        [ud setBool:YES forKey:@"isName"];
        [ud setFloat:3.1415926 forKey:@"pai"];
        [ud setInteger:100 forKey:@"age"];
        NSArray* array = [NSArray arrayWithObjects:@"1",@"2",@"3", nil];
        [ud setObject:array forKey:@"array"];
    }else{
        NSString* name = [ud objectForKey:@"Name"];
        BOOL boolName = [ud boolForKey:@"isName"];
        float pai = [ud floatForKey:@"pai"];
        NSInteger age = [ud integerForKey:@"age"];
        NSArray* array = [ud objectForKey:@"array"];
        
        NSLog(@"name=%@,  boolName=%@   pai = %f  age = %d  array%@",name,boolName?@"YES":@"NO",pai,age,array);
    }
    
}

@end
