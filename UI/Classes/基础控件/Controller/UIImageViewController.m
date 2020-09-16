//
//  UIImageViewController.m
//  UI
//
//  Created by release on 2020/7/10.
//  Copyright © 2020 Mr. release. All rights reserved.
//

#import "UIImageViewController.h"

@interface UIImageViewController ()

@end

@implementation UIImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UIImageView";
    
    [self initView];
}

-(void)initView{
   
    //方式一：
//    UIImageView *imageView  = [[UIImageView alloc]init];
//    imageView.image =  [UIImage imageNamed:@"heart1"];
//
////    imageView.frame = CGRectMake(0, 0, 300, 150);
//    imageView.frame = (CGRect){{0,0},{300,150}};
    
    //方式二：
//    UIImageView *imageView  = [[UIImageView alloc]init];
//    UIImage *image =[UIImage imageNamed:@"heart1"];
//    imageView.image =image;
//
//    imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
       
    //方式三：
//    UIImage *image =[UIImage imageNamed:@"heart1"];
//    UIImageView *imageView  = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
//    imageView.image = image;
    
    //方式四：
    UIImageView *imageView  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"heart1"]];
    
    imageView.center = CGPointMake(self.view.center.x, self.view.frame.size.height/5);
    imageView.backgroundColor = [UIColor greenColor];
    
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.clipsToBounds = YES;
    
//    UIViewContentModeRedraw
    
//    UIViewContentModeScaleToFill,//默认 完全压缩或拉伸
//    UIViewContentModeScaleAspectFit,//宽高比不变，Fit 适应
//    UIViewContentModeScaleAspectFill,//宽高比不变，Fill 填充

//    UIViewContentModeCenter,
//    UIViewContentModeTop,
//    UIViewContentModeBottom,
//    UIViewContentModeLeft,
//    UIViewContentModeRight,
//    UIViewContentModeTopLeft,
//    UIViewContentModeTopRight,
//    UIViewContentModeBottomLeft,
//    UIViewContentModeBottomRight,
    
    
    NSMutableArray<UIImage*> *imageArr = [NSMutableArray array];
    for (int i=0; i<12; i++) {
        NSString *imageName = [NSString stringWithFormat:@"heart%d",i];
        UIImage *image = [UIImage imageNamed:imageName];
        [imageArr addObject:image];
    }
    imageView.animationImages = imageArr;
    imageView.animationRepeatCount = 0;
    imageView.animationDuration = 3;
    [imageView startAnimating];
    [self.view addSubview:imageView];
    
    //图片拉伸问题
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth/2, kScreenHeight/3)];
    btn.center =CGPointMake(kScreenWidth/2, kScreenHeight/2);
    [self.view addSubview:btn];
    UIImage *imagev = [UIImage resizableImageWithLocalImageName:@"chat_send_nor"];
    [btn setBackgroundImage:imagev forState:UIControlStateNormal];
    
}

@end
