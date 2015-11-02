//
//  MyLayout.m
//  
//
//  Created by 王明申 on 15/11/2.
//
//

#import "MyLayout.h"

@implementation MyLayout
-(void)prepareLayout {
    [super prepareLayout];
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = CGSizeMake(100, 100);
    self.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
}
//返回collectionview上所有元素的布局属性
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
//调用父类布局属性
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    //     实现缩放功能，获取collectionview中点，根据每个cell距离中点的距离进行缩放
//1，获取center
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.bounds.size.width * 0.5;
//    每个cell的中点与centerX的距离
    for (UICollectionViewLayoutAttributes *attrs in array) {
        CGFloat cat = ABS(attrs.center.x - centerX);
//        缩放比例
        CGFloat scale = 1 - cat/(centerX + self.itemSize.width);
        attrs.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
    
    
    
    return array;
}
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return  YES;
}
@end
