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


@interface UseViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView* _tableView;
    NSArray* ceshiArray;
}
@end

@implementation UseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = nil;
    [self getInfo];
    [self initView];
}


- (void)getInfo{
    
    ceshiArray = @[@"照片墙",@"NSUserDefaults",@"多界面传值",@"Json数据解析",@"NSURLConnect",@"NSThread",@"NSOperation",@"AFNetwork",@"音频播放",@"视频播放",@"动画",@"导航控制器动画",@"Block"];
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
    cell.FistImage.image=[UIImage imageNamed:[NSString stringWithFormat:@"heart%d",indexPath.row%11]];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"点击条目%d",indexPath.row);
    
    switch (indexPath.row) {
        case 0:{
            VCImageShow *uiControl=[[VCImageShow alloc]init];
            uiControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:uiControl animated:NO];
        }
            break;
        case 1:{
            VCNSUserDefaults *uiControl=[[VCNSUserDefaults alloc]init];
            uiControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:uiControl animated:NO];
        }
            break;
        case 2:{
            VCPassByValue *uiControl=[[VCPassByValue alloc]init];
            uiControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:uiControl animated:NO];
        }
            break;
        case 3:{
            VCParseJson *uiControl=[[VCParseJson alloc]init];
            uiControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:uiControl animated:NO];
        }
            break;
        case 4:{
            VCNSURLConnect *uiControl=[[VCNSURLConnect alloc]init];
            uiControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:uiControl animated:NO];
        }
            break;
        case 5:{
            VCNSThread *uiControl=[[VCNSThread alloc]init];
            uiControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:uiControl animated:NO];
        }
            break;
        case 6:{
            VCNSOperation *uiControl=[[VCNSOperation alloc]init];
            uiControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:uiControl animated:NO];
        }
            break;
        case 7:{
            VCAFNetwork *uiControl=[[VCAFNetwork alloc]init];
            uiControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:uiControl animated:NO];
        }
            break;
        case 8:{
            VCMusicPlayer *uiControl=[[VCMusicPlayer alloc]init];
            uiControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:uiControl animated:NO];
        }
            break;
        case 9:{
            VCVideoPlayer *uiControl=[[VCVideoPlayer alloc]init];
            uiControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:uiControl animated:NO];
        }
            break;
        case 10:{
            VCAnimation *uiControl=[[VCAnimation alloc]init];
            uiControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:uiControl animated:NO];
        }
            break;
        case 11:{
            VCNavigationAnimator *uiControl=[[VCNavigationAnimator alloc]init];
            uiControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:uiControl animated:NO];
        }
            break;
        case 12:{
            BlockViewController *uiControl=[[BlockViewController alloc]init];
            uiControl.modalPresentationStyle=UIModalPresentationFullScreen;
            [self.navigationController pushViewController:uiControl animated:NO];
        }
            break;

        default:
            break;
    }
    
}

-(void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
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
