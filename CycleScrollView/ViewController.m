//
//  ViewController.m
//  CycleScrollView
//
//  Created by caifeng on 2017/2/10.
//  Copyright © 2017年 facaishu. All rights reserved.
//

#import "ViewController.h"
#import "MWLoopView.h"

@interface ViewController () {

    NSArray <NSURL *> *_urls;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // load ImageData
    [self loadData];
    NSLog(@"%@", _urls);

    // add LoopView
    MWLoopView *loopView = [[MWLoopView alloc] initWithUrls:_urls];
    loopView.frame = CGRectMake(20, 20, mScreenWidth - 40, 200);
    [self.view addSubview:loopView];
}

- (void)loadData {

    NSMutableArray *arrM = [NSMutableArray array];
    
    for (NSInteger i = 0; i < 6; i++) {
        NSString *fileName = [NSString stringWithFormat:@"%02zd.jpg", i + 1];
        NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:nil];
        
        if (url != nil) {
            [arrM addObject:url];
        }
    }
//    _urls = arrM.copy;
    
    _urls = @[[NSURL URLWithString:@"http://www.facaishu.com/dyupfiles/images/2016-12/31/276850_admin_upload_1483199489854.jpg"],
              [NSURL URLWithString:@"http://www.facaishu.com/dyupfiles/images/2016-12/31/276850_admin_upload_1483199345783.png"],
              [NSURL URLWithString:@"http://www.facaishu.com/dyupfiles/images/2017-02/09/276850_admin_upload_1486612252321.jpg"],
              [NSURL URLWithString:@"http://www.facaishu.com/dyupfiles/images/2017-01/17/276850_admin_upload_1484616508899.jpg"]];
}



@end
