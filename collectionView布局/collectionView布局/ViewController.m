//
//  ViewController.m
//  collectionView布局
//
//  Created by 王明申 on 15/11/1.
//  Copyright © 2015年 晨曦的Mac. All rights reserved.
//

#import "MyStackLayout.h"
#import "MyCircleLayout.h"
#import "ViewController.h"
#import "MyCollectionViewCell.h"
#import "MyLayout.h"
static NSString *registerNib = @"registerNib";
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)NSMutableArray *imageArray;
@property(nonatomic,strong)UICollectionView *collectionview;
@end

@implementation ViewController
-(NSMutableArray *)imageArray {
    if (_imageArray == nil) {
        _imageArray = [NSMutableArray array];
        for (int i = 1; i<=20; i++) {
            [_imageArray addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    return  _imageArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat w = self.view.frame.size.width;
    CGRect rect = CGRectMake(0, 100, w,300);
     MyCircleLayout*flowLayout = [[MyCircleLayout alloc]init];
    UICollectionView *collectionview = [[UICollectionView alloc]initWithFrame:rect collectionViewLayout:flowLayout];
    collectionview.delegate = self;
    collectionview.dataSource = self;
    [collectionview registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:registerNib];
        [self.view addSubview:collectionview];
    self.collectionview = collectionview;
    }
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if ([self.collectionview.collectionViewLayout isKindOfClass:[MyCircleLayout class]]) {
        [self.collectionview setCollectionViewLayout:[[MyStackLayout alloc]init] animated:YES];
    } else if ([self.collectionview.collectionViewLayout isKindOfClass:[MyStackLayout class]]) {
        [self.collectionview setCollectionViewLayout:[[MyLayout alloc]init] animated:YES];
    } else if ([self.collectionview.collectionViewLayout isKindOfClass:[MyLayout class]]) {
     [self.collectionview setCollectionViewLayout:[[MyCircleLayout alloc]init] animated:YES];
    }

}

//数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imageArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:registerNib forIndexPath:indexPath];
        cell.images = self.imageArray[indexPath.row];
    return cell;
}
//代理方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//删除点击的cell对应的数据
    [self.imageArray removeObjectAtIndex:indexPath.item];
    [self.collectionview deleteItemsAtIndexPaths:@[indexPath] ];

}

@end
