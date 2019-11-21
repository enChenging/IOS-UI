//
//  UIGestureViewController.m
//  UI
//
//  Created by release on 2019/11/12.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import "UIGestureViewController.h"

@interface UIGestureViewController ()<UIGestureRecognizerDelegate>
{
    UIImageView* _imageView;
    CGPoint _lastPoint;
    UIPinchGestureRecognizer* _pinchGes;
    UIRotationGestureRecognizer* _rotationGes;
    UIPanGestureRecognizer* _panGes;
    UISwipeGestureRecognizer* _swipeGes;
    UILongPressGestureRecognizer* _longPressGes;
}
@end

@implementation UIGestureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"UIGesture";
    [self initView];
}

-(void)initView{
    _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guide_1"]];
    _imageView.frame = CGRectMake(100, 100, 200, 340);
    [self.view addSubview:_imageView];
    _imageView.userInteractionEnabled = YES;//开启交互响应事件
    
    UITapGestureRecognizer* tapOnce = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapOnceGes:)];
    tapOnce.numberOfTapsRequired = 1;//几次点击触发
    tapOnce.numberOfTouchesRequired = 1;//几个手指点击触发
    [_imageView addGestureRecognizer:tapOnce];
    
    UITapGestureRecognizer* tapTwo = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTwoGes:)];
    tapTwo.numberOfTapsRequired = 2;//几次点击触发
    tapTwo.numberOfTouchesRequired = 1;//几个手指点击触发
    [_imageView addGestureRecognizer:tapTwo];
    
    [tapOnce requireGestureRecognizerToFail:tapTwo];//当单击操作遇到双击操作时，单击操作失败
    
    //创建捏合手势
    _pinchGes = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchGes:)];
    [_imageView addGestureRecognizer:_pinchGes];
    
    //创建旋转手势
    _rotationGes = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotationGes:)];
    [_imageView addGestureRecognizer:_rotationGes];
    
    _pinchGes.delegate = self;
    _rotationGes.delegate = self;
    
    //创建平移手势
    _panGes = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGes:)];
    [_imageView addGestureRecognizer:_panGes];
    [_imageView removeGestureRecognizer:_panGes];
    
    //创建滑动手势
    _swipeGes = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGes:)];
    _swipeGes.direction = UISwipeGestureRecognizerDirectionUp;
    [_imageView addGestureRecognizer:_swipeGes];
    
    //创建长按手势
    _longPressGes = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressGes:)];
    [_imageView addGestureRecognizer:_longPressGes];
    _longPressGes.minimumPressDuration = 2;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
 
    return YES;//是否可以同时接受2个手势
}

-(void)tapOnceGes:(UITapGestureRecognizer*)tap{
    NSLog(@"单击操作");
    UIImageView* imageView = (UIImageView*)tap.view;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    imageView.frame = CGRectMake(0, 0, 413, 736);
    [UIView commitAnimations];
}

-(void)tapTwoGes:(UITapGestureRecognizer*)tap{
    NSLog(@"双击操作");
    UIImageView* imageView = (UIImageView*)tap.view;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    imageView.frame = CGRectMake(100, 100, 200, 340);
    [UIView commitAnimations];
}


-(void)pinchGes:(UIPinchGestureRecognizer*)pinch{
 
    UIImageView* imageView = (UIImageView*)pinch.view;
    imageView.transform = CGAffineTransformScale(imageView.transform, pinch.scale, pinch.scale);
    pinch.scale = 1;
}

-(void)rotationGes:(UIRotationGestureRecognizer*)rotation{
    UIImageView* imageView = (UIImageView*)rotation.view;
    imageView.transform = CGAffineTransformRotate(imageView.transform, rotation.rotation);
    rotation.rotation = 0;
}


-(void)panGes:(UIPanGestureRecognizer*)pan{
    
    //获取平移时的相对速度
    CGPoint pt = [pan velocityInView:self.view];
    
    NSLog(@"pt.x = %.1f pt.y = %.1f",pt.x,pt.y);
}

-(void)swipeGes:(UISwipeGestureRecognizer*)swipe{
  
    switch (swipe.direction) {
        case UISwipeGestureRecognizerDirectionUp:
            NSLog(@"向上滑动个");
            break;
        case UISwipeGestureRecognizerDirectionDown:
            NSLog(@"向下滑动个");
            break;
        case UISwipeGestureRecognizerDirectionLeft:
            NSLog(@"向左滑动个");
            break;
        case UISwipeGestureRecognizerDirectionRight:
            NSLog(@"向右滑动个");
            break;
        default:
            break;
    }
    
}

-(void)longPressGes:(UILongPressGestureRecognizer*)longpress{
 
    if (longpress.state == UIGestureRecognizerStateBegan) {
        NSLog(@"状态开始");
    }else if (longpress.state == UIGestureRecognizerStateEnded){
        NSLog(@"状态结束");
    }
    NSLog(@"长按手势");
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
