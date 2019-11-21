//
//  AppDelegate.m
//  UI
//
//  Created by release on 2019/11/7.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "UseViewController.h"
#import "ToolsViewController.h"
#import "TabBarController.h"

@interface AppDelegate()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];


    TabBarController* tabBar = [[TabBarController alloc]init];
    self.window.rootViewController = tabBar;
    [self.window makeKeyAndVisible];
    
//    HomeViewController* uiViewCtrl = [[HomeViewController alloc]init];
//    UINavigationController* uiViewNavi = [[UINavigationController alloc]initWithRootViewController:uiViewCtrl];
//    uiViewCtrl.title = @"基础控件";
//    uiViewCtrl.edgesForExtendedLayout = UIRectEdgeNone;
//    uiViewCtrl.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor],
//        NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Bold" size:17]};
//    uiViewNavi.navigationBar.tintColor = [UIColor whiteColor];
//    uiViewNavi.navigationBar.barTintColor = [UIColor brownColor];
//    [uiViewNavi.navigationBar setBarStyle:UIBarStyleBlack];
//    uiViewNavi.navigationBar.tag = 101;
//    
//    UseViewController* useCtrl = [[UseViewController alloc]init];
//    UINavigationController* useNavi = [[UINavigationController alloc]initWithRootViewController:useCtrl];
//    useCtrl.title = @"基础运用";
//    useCtrl.edgesForExtendedLayout = UIRectEdgeNone;
//    useCtrl.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor],
//           NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Bold" size:17]};
//    useNavi.navigationBar.tintColor = [UIColor whiteColor];
//    useNavi.navigationBar.barTintColor = [UIColor brownColor];
//    [useNavi.navigationBar setBarStyle:UIBarStyleBlack];
//    
//    ToolsViewController* toolsCtrl = [[ToolsViewController alloc]init];
//    UINavigationController* toolsNavi = [[UINavigationController alloc]initWithRootViewController:toolsCtrl];
//    toolsCtrl.title = @"基础工具";
//    toolsCtrl.edgesForExtendedLayout = UIRectEdgeNone;
//    toolsCtrl.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor],
//    NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Bold" size:17]};
//    toolsNavi.navigationBar.tintColor = [UIColor whiteColor];
//    toolsNavi.navigationBar.barTintColor = [UIColor brownColor];
//    [toolsNavi.navigationBar setBarStyle:UIBarStyleBlack];
//    
//    UITabBarController* tbController = [[UITabBarController alloc]init];
//    NSArray* tabBarArray = [NSArray arrayWithObjects:uiViewNavi,useNavi,toolsNavi, nil];
//    
//    tbController.viewControllers = tabBarArray;
//    tbController.tabBar.translucent = NO;
//    tbController.tabBar.tintColor = [UIColor brownColor];
//    tbController.delegate = self;
//    tbController.tabBar.hidden = NO;
    
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers{
    NSLog(@"将要开始");
}

- (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed{
    NSLog(@"将要结束");
}

- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed{
    NSLog(@"已经结束");
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"选中控制器");
    switch (tabBarController.tabBarItem.tag) {
        case 101:{
            
        }
            break;
            
        default:
            break;
    }
}

@end
