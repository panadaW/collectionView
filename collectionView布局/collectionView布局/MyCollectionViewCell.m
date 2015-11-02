//
//  MyCollectionViewCell.m
//  collectionView布局
//
//  Created by 王明申 on 15/11/2.
//  Copyright © 2015年 晨曦的Mac. All rights reserved.
//

#import "MyCollectionViewCell.h"
@interface MyCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end
@implementation MyCollectionViewCell
-(void)setImages:(NSString *)images {
    _images = images;
    self.image.image = [UIImage imageNamed:images];
}
- (void)awakeFromNib {
    self.image.layer.borderWidth = 5;
    self.image.layer.borderColor = [UIColor whiteColor].CGColor;
    self.image.layer.cornerRadius = 10;
    self.image.layer.masksToBounds = YES;
    
}

@end
