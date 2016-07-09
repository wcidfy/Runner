//
//  AVVideoController.m
//  Runner
//
//  Created by lxx on 16/7/7.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "AVVideoController.h"
#import "HttpTool.h"
#import "AVVideoListController.h"
@implementation AVVideoController
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor grayColor];
    [HttpTool getAllAVVideoController:^(NSArray *array) {
        [self setChildControllersWithArray:array];
        //获取到所在的tableViewController 进行布局
       
         [self setAllPrepare];
    }];
    
}
-(void)setChildControllersWithArray:(NSArray *)array
{
    for (NSDictionary *dict in array) {
        AVVideoListController *videoListVc=[AVVideoListController new];
        videoListVc.title=dict[@"tname"];
        videoListVc.tid=dict[@"tid"];
        [self addChildViewController:videoListVc];
    }

}
@end
