//
//  UITextFieldViewController.m
//  UI
//
//  Created by release on 2019/11/11.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import "UITextFieldViewController.h"

@interface UITextFieldViewController ()<UITextFieldDelegate>
{
    UITextField* _userName;
    UITextField* _password;
}

@end

@implementation UITextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"UITextField";
    [self initView];
}

-(void)initView{
 
    _userName = [[UITextField alloc]initWithFrame:CGRectMake(120, 120, 160, 40)];
    _password = [[UITextField alloc]initWithFrame:CGRectMake(120, 180, 160, 40)];
    
    [_userName setPlaceholder:@"请输入用户名"];
    [_userName setHighlighted:YES];
    [_userName setFont:[UIFont systemFontOfSize:16]];
    [_userName setTextColor:[UIColor grayColor ]];
    //UITextBorderStyleLine线框风格
    //UITextBorderStyleBezel Bezel线框
    //UITextBorderStyleRoundedRect圆角风格
    //UITextBorderStyleNone无风格
    [_userName setBorderStyle:UITextBorderStyleRoundedRect];
    
    [_password setPlaceholder:@"请输入密码"];
    [_password setHighlighted:YES];
    [_password setFont:[UIFont systemFontOfSize:16]];
    [_password setTextColor:[UIColor grayColor ]];
    [_password setSecureTextEntry:YES];
    [_password setBorderStyle:UITextBorderStyleRoundedRect];
    
    [self.view addSubview:_userName];
    [self.view addSubview:_password];
    
    [_userName setDelegate:self];
    [_password setDelegate:self];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
 
    //不在作为第一响应者
    [_userName resignFirstResponder];
    [_password resignFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"开始编辑了");
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"结束编辑");
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
 
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
 
    return YES;
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
