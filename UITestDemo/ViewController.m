//
//  ViewController.m
//  UITestDemo
//
//  Created by Peng on 2020/6/15.
//  Copyright © 2020 Peng. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "UIPickerViewController.h"
#import "CollectionViewController.h"

@interface ViewController (){
    UITableView *_tableViewSample;
    NSMutableArray *_contacts;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _contacts = [NSMutableArray arrayWithObjects:@"TableView",@"UIPicker",@"UICollectionView",nil];
    
    _tableViewSample = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 400, 400) style:UITableViewStylePlain];
    _tableViewSample.dataSource = self;
    _tableViewSample.delegate = self;
    [self.view addSubview:_tableViewSample];
    // Do any additional setup after loading the view.
}


#pragma mark --UITableViewDataSource
//返回组数
- (NSUInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


//每组返回的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _contacts.count ;
}

//每一行即每个单元格返回的数据内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    NSString *dataString = _contacts[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",dataString];
    return cell;
}


#pragma mark --UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return tableView.frame.size.height/_contacts.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //取消点击按钮之后关闭阴影动画
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if([cell.textLabel.text isEqualToString: @"TableView"]){
        
        TableViewController *vc = [[TableViewController alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
        
    }else if([cell.textLabel.text isEqualToString: @"UIPicker"]){
        
        UIPickerViewController *vc = [[UIPickerViewController alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
        
    }else if([cell.textLabel.text isEqualToString: @"UICollectionView"]){
        
        CollectionViewController *vc = [[CollectionViewController alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
        
    }
    
}

@end
