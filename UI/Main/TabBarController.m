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
#import "ToolsViewController.h"
#import "NavigationController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tabBar setTintColor:[UIColor brownColor]];
    [self addChildViewControllers];
}

-(void)addChildViewControllers{

    HomeViewController *homeVc = [[HomeViewController alloc]init];
    [self addChildViewController:homeVc WithTitle:@"基础控件" image:@"tab_home"];
    
    UseViewController *site = [[UseViewController alloc]init];
    [self addChildViewController:site WithTitle:@"基础运用" image:@"tab_site"];
    
    ToolsViewController *topic = [[ToolsViewController alloc]init];
    [self addChildViewController:topic WithTitle:@"基础工具" image:@"tab_user"];
}


-(void)addChildViewController:(UIViewController *)childController WithTitle:(NSString *)title image:(NSString *)imageName{
    
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    
    childController.title = title;
    
    NavigationController *nav = [[NavigationController alloc]initWithRootViewController:childController];
    
    [self addChildViewController:nav];

}


@end
