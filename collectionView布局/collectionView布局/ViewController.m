//
//  ViewController.m
//  collectionView布局
//
//  Created by 王明申 on 15/11/1.
//  Copyright © 2015年 晨曦的Mac. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect rect = CGRectMake(0, 0, 200, 200);
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    UICollectionView *collecV = [[UICollectionView alloc]initWithFrame:rect collectionViewLayout:flowLayout];
    collecV.backgroundColor = [UIColor redColor];
    [self.view addSubview:collecV];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
