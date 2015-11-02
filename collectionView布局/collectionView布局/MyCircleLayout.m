//
//  MyCircleLayout.m
//  collectionView布局
//
//  Created by 王明申 on 15/11/2.
//  Copyright © 2015年 晨曦的Mac. All rights reserved.
//

#import "MyCircleLayout.h"

@implementation MyCircleLayout
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
    NSInteger count = [self.collectionView numberOfItemsInSection:indexPath.section];
//    半径
    CGFloat radius = 100;
    CGFloat centerX = self.collectionView.frame.size.width * 0.5;
    CGFloat centerY = self.collectionView.frame.size.height * 0.5;
//    单位旋转角度
    CGFloat rota = 2 * M_PI / count;
//    创建i位置对应cell属性
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.size = CGSizeMake(50, 50);
    if (count == 1) {
        attrs.center = CGPointMake(centerX, centerY);
    } else {
        CGFloat angle = rota * indexPath.item;
//    cell中心坐标
        CGFloat attrsCenterX = centerX + radius * cos(angle);
        CGFloat attrsCenterY = centerY + radius * sin(angle);
        attrs.center = CGPointMake(attrsCenterX, attrsCenterY);
    }
    return attrs;

}
@end
