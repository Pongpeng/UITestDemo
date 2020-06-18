//
//  UIPickerViewController.m
//  UITestDemo
//
//  Created by Peng on 2020/6/15.
//  Copyright © 2020 Peng. All rights reserved.
//

#import "UIPickerViewController.h"

@interface UIPickerViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property(nonatomic,strong)UIPickerView *pickerView;
@property(nonatomic,strong)NSArray *dataSource;
@property(nonatomic,strong)UITextField *outputTextField;
@property(nonatomic,strong)UITextView *outputTextView;
@property(nonatomic,strong)UIButton *outputButton;

@end

@implementation UIPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    _dataSource = [NSArray arrayWithObjects:@"登录",@"注册",@"充值",@"注销",@"返回", nil];
    
    _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 320)];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    [self.view addSubview:_pickerView];
    
    _outputButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _outputButton.frame =CGRectMake(0, 350, self.view.bounds.size.width/2, 50);
    [_outputButton setTitle:@"Active" forState:UIControlStateNormal];
    [_outputButton setBackgroundColor:UIColor.brownColor];
    [self.view addSubview:_outputButton];
    
    _outputTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, 350, self.view.bounds.size.width/2, 50)];
    _outputTextField.borderStyle = UITextBorderStyleLine;
    _outputTextField.layer.borderWidth = 1;
    _outputTextField.layer.cornerRadius = 5;
    _outputTextField.clipsToBounds = YES;
    [self.view addSubview:_outputTextField];
    
    // Do any additional setup after loading the view.
}



#pragma mark --UIPickerViewDataSource
//列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

//每列的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [_dataSource count];
}

//行显示的数据
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger) row forComponent:(NSInteger)component {
    return _dataSource[row];
}


#pragma mark --UIPickerViewDelegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSString *selectedItemName = _dataSource[row];
    _outputTextField.text = selectedItemName;
}
@end
