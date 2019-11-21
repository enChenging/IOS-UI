//
//  UiPickerViewController.m
//  UI
//
//  Created by release on 2019/11/14.
//  Copyright © 2019 Mr. release. All rights reserved.
//

#import "UiPickerViewController.h"

@interface UiPickerViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>


@end

@implementation UiPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"UiPickerView";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initView];
}

-(void)initView{
 
    UIPickerView* _pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(30, 100, 300, 200)];
    
    _pickView.delegate = self;
    _pickView.dataSource = self;
    
    [self.view addSubview:_pickView];
}

//返回组数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 2;
}

//每组元素个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if(component == 0){
        return 5;
    }
    
    return 10;
}

//每行元素内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [NSString stringWithFormat:@"第%ld组%ld行",component+1,row+1];
}

//设置每行元素的高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 40;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UIImageView* _view = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"heart%ld",row%11]]];
    
    _view.frame = CGRectMake(0, 0, 30, 30);
    return _view;
}


@end
