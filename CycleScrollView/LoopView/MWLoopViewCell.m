//
//  MWLoopViewCell.m
//  CycleScrollView
//
//  Created by caifeng on 2017/2/10.
//  Copyright © 2017年 facaishu. All rights reserved.
//

#import "MWLoopViewCell.h"

@implementation MWLoopViewCell {

    UIImageView *_imageView;
}

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        [self addSubview:_imageView];
    }
    return self;
}

-(void)setUrl:(NSURL *)url {

    _url = url;
    
    NSData *imageData = [NSData dataWithContentsOfURL:_url];
    UIImage *image = [[UIImage alloc] initWithData:imageData];
    _imageView.image = image;
}



@end
