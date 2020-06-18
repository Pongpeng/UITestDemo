//
//  CollectionViewController.m
//  UITestDemo
//
//  Created by Peng on 2020/6/15.
//  Copyright © 2020 Peng. All rights reserved.
//

#import "CollectionViewController.h"

@interface CollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建一个layout布局类
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置布局方向为垂直瀑布流
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
//    //设置每个item的大小为100*100
//    layout.itemSize = CGSizeMake(130, 130);
    //创建collectionView 通过一个布局策略layout来创建
    UICollectionView *collectview = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    //代理设置
    collectview.dataSource = self;
    collectview.delegate = self;
    //注册item类型
    [collectview registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    [self.view addSubview:collectview];
    // Do any additional setup after loading the view.
}

//设置每个item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row %2 == 0){
        return CGSizeMake(50, 50);
    }else{
        return CGSizeMake(100, 100);
    }
}

#pragma mark --UICollectionViewDataSource
//返回分区个数
- (NSUInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

//返回每个分区的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
}

//返回每个item
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    return cell;
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
