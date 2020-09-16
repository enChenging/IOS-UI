//
//  PersonalViewController.m
//  UI
//
//  Created by release on 2019/11/13.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import "DemosViewController.h"
#import "YCLoginVC.h"
#import "YCLuckyVC.h"
#import "YCImageFold.h"
#import "YCVolumeShakeVC.h"
#import "YCInvertedImageVC.h"
#import "YCParticleEffectVC.h"
#import "YCQQStickLayoutVC.h"

@interface DemosViewController ()

@property(nonatomic,strong)NSArray *array;
@end

@implementation DemosViewController

- (NSArray *)array{
    if (!_array) {
        _array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"demoList.plist" ofType:nil]];
    }
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = nil;
}

#pragma mark - 数据源方法
/**
 返回多少条
 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

/**
 每条ui
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"demoListID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = self.array[indexPath.row];
    
    return cell;
}

/**
 条目点击事件
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *title =  self.array[indexPath.row];
    switch (indexPath.row) {
        case 0:{
            [self pushStorybVC:@"AddressBook" withTitle:title];
        }
            break;
        case 1:{
            [self pushVC:[[YCLuckyVC alloc]initWithNibName:NSStringFromClass(YCLuckyVC.class) bundle:nil] withTitile:title];
        }
            break;
        case 2:{
            [self pushVC:[[YCImageFold alloc]initWithNibName:NSStringFromClass(YCImageFold.class) bundle:nil] withTitile:title];
        }
            break;
        case 3:{
            [self pushVC:[[YCVolumeShakeVC alloc]initWithNibName:NSStringFromClass(YCVolumeShakeVC.class) bundle:nil] withTitile:title];
        }
            break;
        case 4:{
            [self pushVC:[[YCInvertedImageVC alloc]initWithNibName:NSStringFromClass(YCInvertedImageVC.class) bundle:nil] withTitile:title];
        }
            break;
        case 5:{
            [self pushVC:[[YCParticleEffectVC alloc]initWithNibName:NSStringFromClass(YCParticleEffectVC.class) bundle:nil] withTitile:title];
        }
            break;
        case 6:{
            [self pushVC:[[YCQQStickLayoutVC alloc]initWithNibName:NSStringFromClass(YCQQStickLayoutVC.class) bundle:nil] withTitile:title];
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

@end
