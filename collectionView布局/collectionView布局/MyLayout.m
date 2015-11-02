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
    self.sectionInset = UIEdgeInsetsMake(0, 25, 0, 25);
}
//返回collectionview上所有元素的布局属性，显示在视图上
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
//    NSLog(@"sss");
//调用父类布局属性
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    //     实现缩放功能，获取collectionview中点，根据每个cell距离中点的距离进行缩放
//1，获取center
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.bounds.size.width * 0.5;
//    每个cell的中点与centerX的距离
    for (UICollectionViewLayoutAttributes *attrs in array) {
        CGFloat cat = ABS(attrs.center.x - centerX);
//        缩放比例
        CGFloat scale = 1 - cat/(self.collectionView.frame.size.width + self.itemSize.width);
        attrs.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
    
    
    
    return array;
}
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return  YES;
}
-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    CGRect rect;
    rect.origin = proposedContentOffset;
    rect.size = self.collectionView.frame.size;
    NSArray *arrar = [self layoutAttributesForElementsInRect:rect];
//    获取cell的布局属性
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    CGFloat minDelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attrs in arrar) {
        CGFloat cat = attrs.center.x - centerX;
        if (ABS(cat) <= ABS(minDelta)) {
            minDelta = cat;
        }
    }
    return CGPointMake(proposedContentOffset.x + minDelta, proposedContentOffset.y);
}
@end
