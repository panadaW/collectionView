//
//  MyStackLayout.m
//  collectionView布局
//
//  Created by 王明申 on 15/11/2.
//  Copyright © 2015年 晨曦的Mac. All rights reserved.
//

#import "MyStackLayout.h"

@implementation MyStackLayout
//设置CELL布局
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *arrayM = [NSMutableArray array];
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i< count; i++) {
        //创建i位置cell的对应的IndexPath
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        //        创建i位置cell的属性
        UICollectionViewLayoutAttributes *atts = [self layoutAttributesForItemAtIndexPath:indexPath];
        [arrayM addObject:atts];
    }
    return arrayM;
}
//返回indexPath对应cell 的布局属性
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    //    创建i位置对应cell属性
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    NSInteger count = [self.collectionView numberOfItemsInSection:indexPath.section];
    attrs.size = CGSizeMake(100, 100);
    attrs.center = CGPointMake(self.collectionView.frame.size.width * 0.5, self.collectionView.frame.size.height * 0.5);
    attrs.zIndex = count - indexPath.item;
       if (count >= 5) {
        count = 5;
    }
    if (indexPath.item >= count) {
        attrs.hidden = YES;
        return  attrs;
    }
    CGFloat deltaAngle = M_PI_2 / count;
    CGFloat angle = indexPath.item * deltaAngle;
    attrs.transform = CGAffineTransformMakeRotation(angle);
    
    return attrs;

       return attrs;
    
}

@end
