//
//  VCNavigationAnimator2.m
//  UI
//
//  Created by release on 2019/11/19.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import "VCNavigationAnimator2.h"

@interface VCNavigationAnimator2 ()

@end

@implementation VCNavigationAnimator2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"导航控制器动画2";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initView];
}

-(void)initView{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIImageView* _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guide_9"]];
    [_imageView setFrame:CGRectMake(55, 55, 300, 500)];
    [self.view addSubview:_imageView];
}

@end
