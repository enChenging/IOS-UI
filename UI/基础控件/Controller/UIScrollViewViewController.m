//
//  UIScrollViewViewController.m
//  UI
//
//  Created by release on 2019/11/11.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import "UIScrollViewViewController.h"

@interface UIScrollViewViewController ()<UIScrollViewDelegate>
{
    UIScrollView* _sv;
}

@end

@implementation UIScrollViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTitle];
    [self initView];
}


-(void)initTitle{
     UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"回到顶部" style:UIBarButtonItemStylePlain target:self action:@selector(pressTop)];
       
    self.title = @"UIScrollView";
    self.navigationItem.rightBarButtonItem = rightBtn;
}

-(void)pressBack{
    [self.navigationController popViewControllerAnimated:NO];
}

-(void)pressTop{
    [_sv scrollRectToVisible:CGRectMake(0, 0, 413, 736) animated:YES];
}

-(void)initView{
    _sv = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0, 414, 736)];
    
    _sv.contentSize  = CGSizeMake(414, 736*5);
    _sv.backgroundColor = [UIColor whiteColor];
    _sv.pagingEnabled  = NO;//是否按照正页来滚动
    _sv.scrollEnabled = YES;//石否可以有滚动效果
    _sv.bounces = YES;//是否可以边缘弹动效果
    _sv.alwaysBounceHorizontal = NO;//开启横向弹动效果
    _sv.alwaysBounceVertical = YES;
    _sv.showsHorizontalScrollIndicator = YES;//显示横向滚动条
    _sv.showsVerticalScrollIndicator = YES;
    _sv.contentOffset = CGPointMake(0, 0);//滚动的初始化位置
    _sv.delegate = self;
    
    for (int i =0; i<5; i++) {
        NSString *strImage = [NSString stringWithFormat:@"guide_%d",i+1];
        UIImage* image = [UIImage imageNamed:strImage];
        UIImageView* _imageView = [[UIImageView alloc]initWithImage:image];
        _imageView.frame = CGRectMake(0, 736*i, 414, 736);
        [_sv addSubview:_imageView];
    }
    
    [self.view addSubview:_sv];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"y == %f",scrollView.contentOffset.y);
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"视图即将减速时调用");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"视图停止瞬间调用");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"视图即将结束拖动时调用");
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
