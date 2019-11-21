//
//  UIButtonViewController.m
//  UI
//
//  Created by release on 2019/11/8.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import "UIButtonViewController.h"

@interface UIButtonViewController ()

@end

@implementation UIButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"UIButton";
    [self createUIButton];
}

-(void)createUIButton{
    
    UIButton *cButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    cButton.frame=CGRectMake(100, 100, 100, 50);
    cButton.backgroundColor=[UIColor blackColor];
    cButton.titleLabel.font=[UIFont systemFontOfSize:20];
    [cButton setTitle:@"Button" forState:UIControlStateNormal];
    [cButton setTitle:@"selected" forState:UIControlStateHighlighted];
    [cButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    [cButton addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    [cButton addTarget:self action:@selector(touchBtn) forControlEvents:UIControlEventTouchDown];
    cButton.tag=101;
    
    [self.view addSubview:cButton];
    
    UIButton *cButton2=[UIButton buttonWithType:UIButtonTypeCustom];
    
    cButton2.frame=CGRectMake(100, 200, 60, 60);
    UIImage *icon1 = [UIImage imageNamed:@"live_mirror_n.png"];
    UIImage *icon2 = [UIImage imageNamed:@"live_mirror_p.png"];
    [cButton2 setImage:icon1 forState:UIControlStateNormal];
    [cButton2 setImage:icon2 forState:UIControlStateHighlighted];
    
    [cButton2 addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    cButton2.tag=102;
    
    [self.view addSubview:cButton2];
}

-(void)pressBtn:(UIButton*)btn{
    if (btn.tag == 101) {
         NSLog(@"点击按钮cButton");//抬起手指时打印
    }else if(btn.tag == 102){
         NSLog(@"点击按钮cButton2");//抬起手指时打印
    }
   
}

-(void)touchBtn{
    NSLog(@"触摸按钮");//触摸按钮时打印
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
