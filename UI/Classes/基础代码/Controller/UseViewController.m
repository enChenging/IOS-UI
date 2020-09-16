//
//  HomeViewController.m
//  UI
//
//  Created by release on 2019/11/13.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import "UseViewController.h"
#import "UIViewTableViewCell.h"
#import "VCImageShow.h"
#import "VCNSUserDefaults.h"
#import "VCPassByValue.h"
#import "VCParseJson.h"
#import "VCNSURLConnect.h"
#import "VCNSThread.h"
#import "VCNSOperation.h"
#import "VCAFNetwork.h"
#import "VCMusicPlayer.h"
#import "VCVideoPlayer.h"
#import "VCAnimation.h"
#import "VCNavigationAnimator.h"
#import "BlockViewController.h"
#import "YCDictionaryToModel.h"
#import "YCUIApplicationController.h"
#import "YCUIPickViewController.h"
#import "YCUserInfoVC.h"
#import "YCHitTestVC.h"
#import "YCHitTest2VC.h"
#import "DragerViewController.h"
#import "YCDrawLineVC.h"
#import "YCProgressVC.h"
#import "YCPieVC.h"
#import "YCSnowflakeVC.h"
#import "YCGraphicsContextVC.h"
#import "YCWaterMarkVC.h"
#import "YCImageCropVC.h"
#import "YCImageSwipeVC.h"
#import "YCDeblockVC.h"
#import "YCDrawingBoardVC.h"
#import "YCClockVC.h"

@interface UseViewController ()<UITableViewDelegate,UITableViewDataSource>

    @property(nonatomic,strong)UITableView* tableView;
    @property(nonatomic,strong)NSArray* ceshiArray;

@end

@implementation UseViewController

/**
 懒加载
 */
- (NSArray *)ceshiArray{
    if (_ceshiArray == nil) {
        NSString *dataPath = [[NSBundle mainBundle]pathForResource:@"useUI.plist" ofType:nil];
        self.ceshiArray = [NSArray arrayWithContentsOfFile:dataPath];
    }
    return _ceshiArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = nil;
    
//    NSArray *ceshiArray = @[@"照片墙",@"NSUserDefaults",@"多界面传值",@"Json数据解析",@"NSURLConnect",@"NSThread",@"NSOperation",@"AFNetwork",@"音频播放",@"视频播放",@"动画",@"导航控制器动画",@"Block"];
//    BOOL flag = [ceshiArray writeToFile:@"/Users/releasemr./Desktop/useUI.plist" atomically:YES];
//    if (flag) {
//        YCLog(@"写入成功");
//    }
    [self initView];
}


-(void)initView{
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorInset = UIEdgeInsetsMake(0, 50, 0, 0);
    
    _tableView.scrollEnabled = YES;//石否可以有滚动效果
    _tableView.bounces = YES;//是否可以边缘弹动效果
    _tableView.alwaysBounceVertical = YES;
    _tableView.showsVerticalScrollIndicator = YES;
    _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 80)];
    [self.view addSubview:_tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.ceshiArray.count;
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
    
    cell.nameLable.text = self.ceshiArray[indexPath.row];
    cell.FistImage.image=[UIImage imageNamed:[NSString stringWithFormat:@"heart%zd",indexPath.row%11]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    YCLog(@"点击条目%zd",indexPath.row);
    NSString *title =  self.ceshiArray[indexPath.row];
    switch (indexPath.row) {
        case 0:{
            [self pushVC:[[VCImageShow alloc]init] withTitile:title];
        }
            break;
        case 1:{
            [self pushVC:[[VCNSUserDefaults alloc]initWithNibName:NSStringFromClass(VCNSUserDefaults.class) bundle:nil] withTitile:title];
        }
            break;
        case 2:{
            [self pushVC:[[YCDictionaryToModel alloc]init] withTitile:title];
        }
            break;
        case 3:{
            [self pushVC:[[VCPassByValue alloc]init] withTitile:title];
        }
            break;
        case 4:{
            [self pushVC:[[VCParseJson alloc]init] withTitile:title];
        }
            break;
        case 5:{
            [self pushVC:[[VCNSURLConnect alloc]init] withTitile:title];
        }
            break;
        case 6:{
            [self pushVC:[[VCNSThread alloc]init] withTitile:title];
        }
            break;
        case 7:{
            [self pushVC:[[VCNSOperation alloc]init] withTitile:title];
        }
            break;
        case 8:{
            [self pushVC:[[VCAFNetwork alloc]init] withTitile:title];
        }
            break;
        case 9:{
            [self pushVC:[[VCMusicPlayer alloc]init] withTitile:title];
        }
            break;
        case 10:{
            [self pushVC:[[VCVideoPlayer alloc]init] withTitile:title];
        }
            break;
        case 11:{
            [self pushVC:[[VCAnimation alloc]init] withTitile:title];
        }
            break;
        case 12:{
            [self pushVC:[[VCNavigationAnimator alloc]init] withTitile:title];
        }
            break;
        case 13:{
            [self pushVC:[[BlockViewController alloc]init] withTitile:title];
        }
            break;
        case 14:{
            [self pushVC:[[YCUIApplicationController alloc]initWithNibName:@"UIApplicationView" bundle:nil] withTitile:title];
        }
            break;
        case 15:{
            [self pushVC:[[YCUIPickViewController alloc]initWithNibName:@"UIPickView" bundle:nil] withTitile:title];
        }
            break;
        case 16:{
//            [self pushStorybVC:NSStringFromClass(YCUserInfoVC.class) withTitle:title];
            [self pushStorybVC:@"YCUserInfoVC" withTitle:title];
            
        }
            break;
        case 17:{
             [self pushVC:[[YCHitTestVC alloc]initWithNibName:NSStringFromClass(YCHitTestVC.class) bundle:nil] withTitile:title];
        }
            break;
        case 18:{
            [self pushVC:[[YCHitTest2VC alloc]initWithNibName:NSStringFromClass(YCHitTest2VC.class) bundle:nil] withTitile:title];
        }
            break;
        case 19:{
            [self pushVC:[[DragerViewController alloc]init] withTitile:title];
        }
            break;
        case 20:{
            [self pushVC:[[YCDrawLineVC alloc]initWithNibName:NSStringFromClass(YCDrawLineVC.class) bundle:nil] withTitile:title];
        }
            break;
        case 21:{
            [self pushVC:[[YCProgressVC alloc]initWithNibName:NSStringFromClass(YCProgressVC.class) bundle:nil] withTitile:title];
        }
            break;
        case 22:{
            [self pushVC:[[YCPieVC alloc]initWithNibName:NSStringFromClass(YCPieVC.class) bundle:nil] withTitile:title];
        }
            break;
        case 23:{
            [self pushVC:[[YCSnowflakeVC alloc]initWithNibName:NSStringFromClass(YCSnowflakeVC.class) bundle:nil] withTitile:title];
        }
            break;
        case 24:{
            [self pushVC:[[YCGraphicsContextVC alloc]initWithNibName:NSStringFromClass(YCGraphicsContextVC.class) bundle:nil] withTitile:title];
        }
            break;
        case 25:{
            [self pushVC:[[YCWaterMarkVC alloc]initWithNibName:NSStringFromClass(YCWaterMarkVC.class) bundle:nil] withTitile:title];
        }
            break;
        case 26:{
            [self pushVC:[[YCImageCropVC alloc]initWithNibName:NSStringFromClass(YCImageCropVC.class) bundle:nil] withTitile:title];
        }
            break;
        case 27:{
            [self pushVC:[[YCImageSwipeVC alloc]initWithNibName:NSStringFromClass(YCImageSwipeVC.class) bundle:nil] withTitile:title];
        }
            break;
        case 28:{
            [self pushVC:[[YCDeblockVC alloc]initWithNibName:NSStringFromClass(YCDeblockVC.class) bundle:nil] withTitile:title];
        }
            break;
        case 29:{
            [self pushVC:[[YCDrawingBoardVC alloc]initWithNibName:NSStringFromClass(YCDrawingBoardVC.class) bundle:nil] withTitile:title];
        }
            break;
        case 30:{
            [self pushVC:[[YCClockVC alloc]initWithNibName:NSStringFromClass(YCClockVC.class) bundle:nil] withTitile:title];
        }
            break;
        default:
            break;
    }
}

-(void)pushVC:(UIViewController *)vc withTitile:(NSString *)title {
    vc.title = title;
    vc.modalPresentationStyle=UIModalPresentationFullScreen;
    [self.navigationController pushViewController:vc animated:NO];
}

-(void)pushStorybVC:(NSString *)name withTitle:(NSString *)title{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:name bundle:nil];
    UIViewController *vc = [sb instantiateInitialViewController];
    vc.title = title;
    [self.navigationController pushViewController:vc animated:NO];
}

-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}

@end
