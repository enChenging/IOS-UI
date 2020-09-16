//
//  TabBarController.m
//  UI
//
//  Created by release on 2019/11/21.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import "TabBarController.h"
#import "HomeViewController.h"
#import "UseViewController.h"
#import "DemosViewController.h"
#import "NavigationController.h"

@interface TabBarController ()

@end

@implementation TabBarController

/**
 作用：用来创建控制器的View
 当控制器的View第一次使用时调用
 loadView底层原理：
 1.先判断当前控制器是不是从storyBoard当中加载的，如果是从storyBoard加载的控制器，
 那么它就会从storyBoard当中加载的控制器的View，设置为当前控制器的view.
 2.当前控制器是不是从xib中加载的，如果是从xib当中加载的话，把xib当中制定的view，
 设置为当前控制器的view
 3.如果也不是从xib中加载的，它就会创建空白的view
 
 一旦重写了loadView方法，就说明要自己定义view
 一般使用场景：当控制器的view一显示时，就是一张图片或者UIWebView。
 节省内存
 */
//- (void)loadView{
//    //如果一个控件不能j够接收事件，那么它里面子控件是不能够接收事件的
//    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"guide_1"]];
//    imageView.userInteractionEnabled = YES;//这样就可以接收事件了
//    self.view = imageView;
//}

//-(UIView *)view{
//    if (_view == nil) {
//        [self loadView];
//        [self viewDidLoad];
//    }
//    return _view;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar setTintColor:[UIColor brownColor]];
    [self addChildViewControllers];
}

-(void)addChildViewControllers{
    HomeViewController *homeVc = [[HomeViewController alloc]init];
    [self addChildViewController:homeVc WithTitle:@"基础控件" image:@"tab_home"];
    UseViewController *site = [[UseViewController alloc]init];
    [self addChildViewController:site WithTitle:@"基础代码" image:@"tab_site"];
    DemosViewController *demo = [[DemosViewController alloc]init];
    [self addChildViewController:demo WithTitle:@"基础demo" image:@"tab_user"];
}


-(void)addChildViewController:(UIViewController *)childController WithTitle:(NSString *)title image:(NSString *)imageName{
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    childController.title = title;
    //initWithRootViewController底层调用pushViewController
    NavigationController *nav = [[NavigationController alloc]initWithRootViewController:childController];
    [self addChildViewController:nav];
}


@end
