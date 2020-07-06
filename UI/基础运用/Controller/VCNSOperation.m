//
//  VCNSOperation.m
//  UI
//
//  Created by release on 2019/11/18.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import "VCNSOperation.h"

@interface VCNSOperation ()
{
    NSArray* _titleArray;
    NSOperationQueue* _queue;
    
}
@end

@implementation VCNSOperation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"任务队列";
    [self initView];
}

-(void)initView{
    _titleArray = [NSArray arrayWithObjects:@"添加新任务1到队列中",@"添加新任务2到队列中", nil];
    for (int i=0; i<_titleArray.count; i++) {
        UIButton* btn = [[UIButton alloc]initWithFrame:CGRectMake(100, (1+i)*100, 200, 40)];
        [btn setTitle:_titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTag:101+i];
        [self.view addSubview:btn];
    }
    
    //创建任务队列
    _queue = [[NSOperationQueue alloc]init];
    //设置最大并发任务数量
    [_queue setMaxConcurrentOperationCount:3];
}

-(void)pressBtn:(UIButton*)btn{
 
    switch (btn.tag) {
        case 101:{
            //创建一个执行任务
            NSInvocationOperation* _io = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(oper:) object:nil];
            [_queue addOperation:_io];
        }
            break;
        case 102:{
            //使用block语法块进行处理
            [_queue addOperationWithBlock:^{
                int i = 0;
                   while (true) {
                       i ++;
                       if (i>100) {
                           break;
                       }
                       NSLog(@"Block-----%d",i);
                   }
            }];
        }
            break;
    }
}

-(void)oper:(NSInvocationOperation*)io{
 
    int i = 0;
    while (true) {
        i ++;
        if (i>100) {
            break;
        }
        NSLog(@"thread-----%d",i);
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
