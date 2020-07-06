//
//  VCNSThread.m
//  UI
//
//  Created by release on 2019/11/18.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import "VCNSThread.h"

@interface VCNSThread ()
{
    NSArray* _titleArray;
    NSInteger* _counter;
    NSLock* _lock;
}
@end

@implementation VCNSThread

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"NSThread多线程";
    [self initView];
}

-(void)initView{
    _titleArray = [NSArray arrayWithObjects:@"启动线程一",@"启动线程二",@"启动线程三", nil];
    for (int i=0; i<_titleArray.count; i++) {
        UIButton* btn = [[UIButton alloc]initWithFrame:CGRectMake(100, (1+i)*100, 200, 40)];
        [btn setTitle:_titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTag:101+i];
        [self.view addSubview:btn];
    }
}

-(void)pressBtn:(UIButton*)btn{
 
    switch (btn.tag) {
        case 101:{
            NSThread* _thread = [[NSThread alloc]initWithTarget:self selector:@selector(threadAction:) object:nil];
            [_thread start];
        }
            break;
        case 102:{
            [NSThread detachNewThreadSelector:@selector(threadAction1:) toTarget:self withObject:nil];
        }
            break;
        case 103:{
            NSThread* _thread2 = [[NSThread alloc]initWithTarget:self selector:@selector(threadAction2:) object:nil];
            [_thread2 start];
        }
            break;
        default:
            break;
    }
}

-(void)threadAction:(NSThread*)thread{
 
   
    int i = 0;
    while (true) {
        i++;
        if (i>100) {
            break;
        }
        _counter++;
         NSLog(@"thread-----_counter==%d",(int)_counter);
    }
    
     NSLog(@"thread--finish---_counter==%d",(int)_counter);
}

-(void)threadAction1:(NSThread*)thread{
 
    int i = 0;
    while (true) {
        i++;
        if (i>1000) {
            break;
        }
        //确保加法操作安全性
        [_lock lock];
        _counter++;
        [_lock unlock];
        NSLog(@"thread1-----_counter==%d",(int)_counter);
    }
    NSLog(@"thread1--finish---_counter==%d",(int)_counter);
}

-(void)threadAction2:(NSThread*)thread{
 int i = 0;
    while (true) {
        i++;
        if (i>10000) {
            break;
        }
        [_lock lock];
        _counter++;
        [_lock unlock];
        NSLog(@"thread2-----_counter==%d",(int)_counter);
    }
    NSLog(@"thread2--finish---_counter==%d",(int)_counter);
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
