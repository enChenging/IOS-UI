//
//  VCVideoPlayer.m
//  UI
//
//  Created by release on 2019/11/18.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import "VCVideoPlayer.h"
#import <AVKit/AVKit.h>

@interface VCVideoPlayer ()
{
    AVPlayerViewController* _playController;
}

@end

@implementation VCVideoPlayer

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"视频播放";
    [self initView];
}

-(void)initView{
    UIButton* btn = [[UIButton alloc]initWithFrame:CGRectMake(150, 80, 120, 40)];
    [btn setTitle:@"播放" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor systemBlueColor]];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)moviePlayer{
    
    NSString* strUrl = @"http://flv3.bn.netease.com/4adfc6e97951b662ebc4b0e3a53606e5ff095e6ab39213030bcfe35de326e6c5eacf645dbd80f9cd4d15cf07a29aeb99d7ab1bd8925afa1a8eed831d7c795913179c43f3f2974f8ef862028807badff3437e4de05c1c4fcfa937255aa0d44a8b1f671a43d888e28f46c8a21609d747f941e48ca78ca8135e.mp4";
    
    NSURL* videoUrl = [NSURL URLWithString:strUrl];
    
    _playController = [[AVPlayerViewController alloc]init];
    _playController.player = [AVPlayer playerWithURL:videoUrl];
    _playController.view.frame = self.view.bounds;
    _playController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    _playController.showsPlaybackControls = YES;//是否显示回放
    [self.view addSubview:_playController.view];
}

-(void)pressBtn:(UIButton*)btn{
    [self moviePlayer];
}

@end
