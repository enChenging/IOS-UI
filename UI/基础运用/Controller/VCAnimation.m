//
//  VCAnimation.m
//  UI
//
//  Created by release on 2019/11/19.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import "VCAnimation.h"

@interface VCAnimation ()
{
    NSArray* _titleArray;
    UIImageView* _imageView;
}
@end

@implementation VCAnimation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"动画";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initView];
}

-(void)initView{
    
    _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"heart1"]];
    [_imageView setFrame:CGRectMake(180, 50, 50, 50)];
    [self.view addSubview:_imageView];
    
    _titleArray = [NSArray arrayWithObjects:@"移动",@"缩放", nil];
       for (int i=0; i<_titleArray.count; i++) {
           UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
           [btn setFrame:CGRectMake(150,500+ i*60, 120, 40)];
           [btn setTitle:_titleArray[i] forState:UIControlStateNormal];
           [btn setBackgroundColor:[UIColor systemBlueColor]];
           [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
           [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
           [btn setTag:101+i];
           [self.view addSubview:btn];
       }
}

-(void)pressBtn:(UIButton*)btn{
    switch (btn.tag) {
           case 101:{
               [UIView beginAnimations:nil context:nil];
               [UIView setAnimationDuration:2];
               [UIView setAnimationDelay:1];
               [UIView setAnimationDelegate:self];
               //设置动画轨迹方式
               //UIViewAnimationCurveEaseIn 开始时较慢
               //UIViewAnimationCurveEaseOut 结束时较慢
               //UIViewAnimationCurveEaseInOut 开始和结束时较慢
               //UIViewAnimationCurveLinear 整个过程匀速进行
               [UIView setAnimationCurve:UIViewAnimationCurveLinear];
               [UIView setAnimationDidStopSelector:@selector(endAnim)];
               [_imageView setFrame:CGRectMake(180, 600, 50, 50)];
               [UIView commitAnimations];
           }
               break;
           case 102:{
               [UIView beginAnimations:nil context:nil];
               [UIView setAnimationDuration:2];
               [UIView setAnimationDelegate:self];
               [UIView setAnimationDidStopSelector:@selector(endAnim)];
               [_imageView setFrame:CGRectMake(180, 50, 200, 200)];
               [_imageView setAlpha:0.1];
               [UIView commitAnimations];
           }
               break;
           default:
               break;
       }
}

-(void)endAnim{
    NSLog(@"动画结束");
}

@end
