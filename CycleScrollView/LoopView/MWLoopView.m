//
//  MWLoopView.m
//  CycleScrollView
//
//  Created by caifeng on 2017/2/10.
//  Copyright © 2017年 facaishu. All rights reserved.
//

#import "MWLoopView.h"
#import "MWFlowLayout.h"
#import "MWLoopViewCell.h"

static NSString *const loopViewCellId = @"LoopViewCellId";

@interface MWLoopView ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation MWLoopView {

    NSArray <NSURL *> *_urls;
}


- (instancetype)initWithUrls:(NSArray <NSURL *>*)urls {

    self = [super initWithFrame:CGRectZero collectionViewLayout:[[MWFlowLayout alloc] init]];
    if (self) {
        
        _urls = urls;
        self.dataSource = self;
        self.delegate = self;
        [self registerClass:[MWLoopViewCell class] forCellWithReuseIdentifier:loopViewCellId];
        
        //** 在构造方法内部，利用主队列异步实现collectionView的滚动到指定位置
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:_urls.count inSection:0];
            [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        });
    }
    return self;
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _urls.count * 100;//实现左右轮播(放大数据源解决滑动卡顿)
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    MWLoopViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:loopViewCellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
    cell.url = _urls[indexPath.item % _urls.count];// 防止数组越界取模
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    NSInteger offsetIndex = self.contentOffset.x / scrollView.bounds.size.width;
    // 判断临界点
    if (offsetIndex == 0 || offsetIndex == [self numberOfItemsInSection:0] - 1) {
        
        offsetIndex = offsetIndex == 0 ? _urls.count : _urls.count - 1;
    }
    
    scrollView.contentOffset = CGPointMake(offsetIndex * scrollView.bounds.size.width, 0);
}

@end
