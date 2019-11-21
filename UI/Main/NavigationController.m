//
//  NavigationController.m
//  UI
//
//  Created by release on 2019/11/21.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationBar setTitleTextAttributes: @{NSForegroundColorAttributeName : [UIColor whiteColor],
           NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Bold" size:17]}];
    
    [self.navigationBar setBarTintColor:[UIColor brownColor]];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
 
    [super pushViewController:viewController animated:NO];
    
    [self addbackBtn:viewController];
}

-(void)addbackBtn:(UIViewController *)viewController{

    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backBtnClick)];
    
    
    viewController.navigationItem.leftBarButtonItems = @[back];
    


}

-(void)backBtnClick{

    [self popViewControllerAnimated:NO];
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
