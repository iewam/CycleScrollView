//
//  MWFlowLayout.m
//  CycleScrollView
//
//  Created by caifeng on 2017/2/10.
//  Copyright © 2017年 facaishu. All rights reserved.
//

#import "MWFlowLayout.h"

@implementation MWFlowLayout

- (void)prepareLayout {

    [super prepareLayout];
    
    self.itemSize = self.collectionView.bounds.size;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
}

@end
