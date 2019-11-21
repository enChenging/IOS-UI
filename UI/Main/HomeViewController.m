//
//  ViewController.m
//  UI
//
//  Created by release on 2019/11/7.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import "HomeViewController.h"
#import "UIViewTableViewCell.h"
#import "UILableViewController.h"
#import "UIButtonViewController.h"
#import "UIViewViewController.h"
#import "TimerViewController.h"
#import "UISwitchViewController.h"
#import "UISlide_ProgressViewController.h"
#import "UIStepper_UISegmentedControlViewController.h"
#import "UIAlertViewController.h"
#import "UITextFieldViewController.h"
#import "UIScrollViewViewController.h"
#import "UITouchViewController.h"
#import "UIGestureViewController.h"
#import "ManualLayoutViewController.h"
#import "AutoLayoutViewController.h"
#import "UiPickerViewController.h"


@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView* _tableView;
    NSArray* ceshiArray;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor grayColor];
    
    
    [self initTitle];
    [self getInfo];
    [self createTableView];
}

-(void)initTitle{
    UIBarButtonItem* rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(pressRight)];
    
    UILabel* _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    [_label setText:@"选择"];
    [_label setTextColor:[UIColor whiteColor]];
    [_label setFont:[UIFont systemFontOfSize:18]];
    [_label setTextAlignment:NSTextAlignmentCenter];
    
    UIBarButtonItem* rightBtn2 = [[UIBarButtonItem alloc]initWithCustomView:_label];
    NSArray* arryTopBtn = [NSArray arrayWithObjects:rightBtn,rightBtn2, nil];
    self.navigationItem.rightBarButtonItems = arryTopBtn;
    self.navigationItem.leftBarButtonItem = nil;
    
    self.tabBarItem.badgeValue = @"100";
}


-(void)pressRight{
    NSLog(@"编辑");
}

- (void)getInfo{
    
    ceshiArray = @[@"UILabel",@"UIButton",@"UIView",@"TimerView",@"UISwitch",@"UISlide_ProgressView",@"UIStepper_UISegmentedControl",@"UIAlert",@"UITextField",@"UIScrollView",@"UITouch",@"UIGesture",@"ManualLayout",@"AutoLayout",@"UiPickerView"];
}


-(void)createTableView{
    // 状态栏(statusbar)
//    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
//    NSLog(@"status width - %f", rectStatus.size.width); // 宽度
//    NSLog(@"status height - %f", rectStatus.size.height);  // 高度

    // 导航栏（navigationbar）
//    CGRect rectNav = self.navigationController.navigationBar.frame;
//    NSLog(@"nav width - %f", rectNav.size.width); // 宽度
//    NSLog(@"nav height - %f", rectNav.size.height);  // 高度
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorInset = UIEdgeInsetsMake(0, 50, 0, 0);
    //    _tableView.separatorInset = UIEdgeInsetsZero;
    //    _tableView.separatorColor = [UIColor blueColor];
    //    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //    _tableView.backgroundColor = [UIColor clearColor];
    
    _tableView.scrollEnabled = YES;//石否可以有滚动效果
    _tableView.bounces = YES;//是否可以边缘弹动效果
    _tableView.alwaysBounceVertical = YES;
    _tableView.showsVerticalScrollIndicator = YES;
    _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 120)];
    [self.view addSubview:_tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ceshiArray.count;
}

////设置数据视图的组数
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 2;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* indentify = @"cellr4rfrklfkre";
    UIViewTableViewCell* cell=[_tableView dequeueReusableCellWithIdentifier:indentify];
    
    if (!cell) {
        cell = [[UIViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentify];
    }
    
    cell.nameLable.text = ceshiArray[indexPath.row];
    cell.FistImage.image=[UIImage imageNamed:[NSString stringWithFormat:@"heart%d",(int)indexPath.row%11]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"点击条目%zd",indexPath.row);
    
    switch (indexPath.row) {
        case 0:{
            UILableViewController *lableControl=[[UILableViewController alloc]init];
            lableControl.modalPresentationStyle=UIModalPresentationFullScreen;
            //            [self presentViewController:lableControl animated:YES completion:nil];//没有导航控制器的跳转
            //            [self.navigationController popToRootViewControllerAnimated:YES];//返回根视图
            //            [self.navigationController popViewControllerAnimated:YES];//返回上级视图
            [self.navigationController pushViewController:lableControl animated:NO];
        }
            break;
        case 1:{
            UIButtonViewController *btnControl=[[UIButtonViewController alloc]init];
            btnControl.modalPresentationStyle=UIModalPresentationFullScreen;
            //            [self presentViewController:btnControl animated:YES completion:nil];
            [self.navigationController pushViewController:btnControl animated:NO];
        }
            break;
        case 2:{
            UIViewViewController *uiViewControl=[[UIViewViewController alloc]init];
            uiViewControl.modalPresentationStyle=UIModalPresentationFullScreen;
            //            [self presentViewController:uiViewControl animated:YES completion:nil];
            [self.navigationController pushViewController:uiViewControl animated:NO];
        }
            break;
        case 3:{
            TimerViewController *timerControl = [[TimerViewController alloc]init];
            timerControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:timerControl animated:NO];
        }
            break;
        case 4:{
            UISwitchViewController *switchControl = [[UISwitchViewController alloc]init];
            switchControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:switchControl animated:NO];
        }
            break;
        case 5:{
            UISlide_ProgressViewController *uiControl = [[UISlide_ProgressViewController alloc]init];
            uiControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:uiControl animated:NO];
        }
            break;
        case 6:{
            UIStepper_UISegmentedControlViewController *uiControl = [[UIStepper_UISegmentedControlViewController alloc]init];
            uiControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:uiControl animated:NO];
        }
            break;
        case 7:{
            UIAlertViewController *uiControl = [[UIAlertViewController alloc]init];
            uiControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:uiControl animated:NO];
            
        }
            break;
        case 8:{
            UITextFieldViewController *uiControl = [[UITextFieldViewController alloc]init];
            uiControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:uiControl animated:NO];
        }
            break;
        case 9:{
            UIScrollViewViewController *uiControl = [[UIScrollViewViewController alloc]init];
            uiControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:uiControl animated:NO];
        }
            break;
        case 10:{
            UITouchViewController *uiControl = [[UITouchViewController alloc]init];
            uiControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:uiControl animated:NO];
        }
            break;
        case 11:{
            UIGestureViewController *uiControl = [[UIGestureViewController alloc]init];
            uiControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:uiControl animated:NO];
        }
            break;
        case 12:{
            ManualLayoutViewController *uiControl = [[ManualLayoutViewController alloc]init];
            uiControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:uiControl animated:NO];
        }
            break;
        case 13:{
            AutoLayoutViewController *uiControl = [[AutoLayoutViewController alloc]init];
            uiControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:uiControl animated:NO];
        }
            break;
        case 14:{
            UiPickerViewController *uiControl = [[UiPickerViewController alloc]init];
            uiControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:uiControl animated:NO];
        }
            break;
        default:
            break;
    }
    
}

-(void)viewWillAppear:(BOOL)animated{
//    NSLog(@"viewWillAppear  视图即将显示");
    self.tabBarController.tabBar.hidden = NO;
}

//- (void)viewDidAppear:(BOOL)animated{
//    NSLog(@"viewDidAppear  视图已经显示");
//}
//
//- (void)viewWillDisappear:(BOOL)animated{
//    NSLog(@"viewWillDisappear  视图即将消失");
//}
//
//- (void)viewDidDisappear:(BOOL)animated{
//    NSLog(@"viewDidDisappear  视图已经消失");
//}

//内存过低警告接受函数
//- (void)didReceiveMemoryWarning{
//    [super didReceiveMemoryWarning];
//}

@end
