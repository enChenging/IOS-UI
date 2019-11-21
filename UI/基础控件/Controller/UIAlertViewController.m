//
//  UIAlertViewController.m
//  UI
//
//  Created by release on 2019/11/11.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import "UIAlertViewController.h"

@interface UIAlertViewController ()<UIAlertViewDelegate>
{
 
    UIButton* _alertBtn;
    UIAlertController* _alertController;
    UIAlertController* _alertController2;
    UIAlertController* _alertController3;
    UIActivityIndicatorView* _indicator;
}

@end

@implementation UIAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"UIAlert";
    [self initView];
}

-(void)initView{
    
    for (int i = 0; i<4; i++) {
        _alertBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100+100*i, 180, 40)];
        if (i == 0) {
            [_alertBtn setTitle:@"普通提示框" forState:UIControlStateNormal];
        }else if(i == 1){
            [_alertBtn setTitle:@"输入文本框" forState:UIControlStateNormal];
        }else if(i == 2){
            [_alertBtn setTitle:@"底部选择框" forState:UIControlStateNormal];
        }else if(i == 3){
            [_alertBtn setTitle:@"等待提示器" forState:UIControlStateNormal];
        }
        [_alertBtn setTag:(101+i)];
        [_alertBtn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_alertBtn setTitleColor:[UIColor magentaColor] forState:UIControlStateNormal];
        [self.view addSubview:_alertBtn];
    }
   
    
    _alertController = [UIAlertController alertControllerWithTitle:@"标题" message:@"内容" preferredStyle:UIAlertControllerStyleAlert];
        
    //确认按钮
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        for (UITextField* text in  _alertController2.textFields) {
            NSLog(@"action = %@",text.text);
        }
    }];
    
    //取消按钮
    UIAlertAction* cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
       
        for (UITextField* text in  _alertController2.textFields) {
                   NSLog(@"action = %@",text.text);
        }
    }];
    
    [_alertController addAction:confirm];
    [_alertController addAction:cancle];

    
    _alertController2 = [UIAlertController alertControllerWithTitle:@"标题" message:@"内容" preferredStyle:UIAlertControllerStyleAlert];

    //添加文本框
    [_alertController2 addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"用户名";
    }];
    
    [_alertController2 addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"密码";
        textField.secureTextEntry = YES;
    }];

    [_alertController2 addAction:confirm];
    [_alertController2 addAction:cancle];
    
    
    _alertController3 = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"打开相机");
    }];

    UIAlertAction *picture = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"打开相册");
    }];
    
    [_alertController3 addAction:camera];
    [_alertController3 addAction:picture];
    [_alertController3 addAction:cancle];
    
}

-(void)pressBtn:(UIButton*)btn{
    
    switch (btn.tag) {
        case 101:
            [self presentViewController:_alertController animated:YES completion:nil];
            break;
        case 102:
            [self presentViewController:_alertController2 animated:YES completion:nil];
            break;
        case 103:
            [self presentViewController:_alertController3 animated:YES completion:nil];
            break;
        case 104:
            if(!_indicator){
                _indicator = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(170, 30, 50, 50)];
                _indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
                _indicator.backgroundColor = [UIColor whiteColor];
                [_indicator startAnimating];
                [self.view addSubview:_indicator];
            }
            break;
        default:
            break;
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
