//
//  AutoLayoutViewController.m
//  UI
//
//  Created by release on 2019/11/13.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import "AutoLayoutViewController.h"

@interface AutoLayoutViewController (){
  
    UIView* _superView;
    UILabel* _label01;
    UILabel* _label02;
    UILabel* _label03;
    UILabel* _label04;
    UIView* _centerView;
}

@end

@implementation AutoLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"AutoLayout";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initView];
}

-(void)initView{
    _superView = [[UIView alloc]initWithFrame:CGRectMake(30, 30, 150, 260)];
    _superView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_superView];
    
    _label01 = [[UILabel alloc]init];
    _label01.frame = CGRectMake(0, 0, 40, 40);
    _label01.backgroundColor = [UIColor orangeColor];
    
    _label02 = [[UILabel alloc]init];
    _label02.frame = CGRectMake(_superView.bounds.size.width - 40, 0, 40, 40);
    _label02.backgroundColor = [UIColor orangeColor];
   
    _label03 = [[UILabel alloc]init];
    _label03.frame = CGRectMake(0, _superView.bounds.size.height - 40, 40, 40);
    _label03.backgroundColor = [UIColor orangeColor];
    
    _label04 = [[UILabel alloc]init];
    _label04.frame = CGRectMake(_superView.bounds.size.width - 40, _superView.bounds.size.height - 40, 40, 40);
    _label04.backgroundColor = [UIColor orangeColor];
    
    _centerView = [[UIView alloc]init];
    _centerView.frame = CGRectMake(30, 0, _superView.bounds.size.width, 40);
    _centerView.center = CGPointMake(150/2, 260/2);
    _centerView.backgroundColor = [UIColor orangeColor];
    
    [_superView addSubview:_label01];
    [_superView addSubview:_label02];
    [_superView addSubview:_label03];
    [_superView addSubview:_label04];
    [_superView addSubview:_centerView];
    
    //自动布局
    _centerView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    _label01.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
    _label02.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    _label03.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleRightMargin;
    _label04.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin;

    UIButton* btn = [[UIButton alloc]initWithFrame:CGRectMake(320, 500, 60, 30)];
    [btn setTitle:@"放大" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor grayColor]];
    [btn addTarget:self action:@selector(pressesBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTag:101];
    [self.view addSubview:btn];
    
    UIButton* btn2 = [[UIButton alloc]initWithFrame:CGRectMake(320, 550, 60, 30)];
    [btn2 setTitle:@"缩小" forState:UIControlStateNormal];
    [btn2 setBackgroundColor:[UIColor grayColor]];
    [btn2 addTarget:self action:@selector(pressesBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setTag:102];
    [self.view addSubview:btn2];
}

-(void)pressesBtn:(UIButton*)btn{
    if (btn.tag == 101) {
        NSLog(@"放大");
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1];
        _superView.frame = CGRectMake(0, 0, 300, 520);
        [UIView commitAnimations];
    }else if (btn.tag == 102){
        NSLog(@"缩小");
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1];
        _superView.frame = CGRectMake(30, 30, 150, 260);
        [UIView commitAnimations];

    }
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
