//
//  UIViewViewController.m
//  UI
//
//  Created by release on 2019/11/8.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import "UIViewViewController.h"

@interface UIViewViewController ()

@end

@implementation UIViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"UIView";
    [self createUIView];

}

-(void)createUIView{
    
    UIView *cView=[[UIView alloc]init];
    
    cView.frame=CGRectMake(100, 100, 100, 200);
    cView.backgroundColor=[UIColor magentaColor];
    cView.alpha=0.5f;
    cView.hidden=NO;
    cView.opaque=NO;//是否显示不透明
    
    [self.view addSubview:cView];
    
//    [cView removeFromSuperview];//将自己从父视图中删除
    
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
