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
    [self setTittle];
    self.view.backgroundColor=[UIColor grayColor];
    [HttpTool getAllAVVideoController:^(NSArray *array) {
        [self setChildControllersWithArray:array];
        //获取到所在的tableViewController 进行布局
       
         [self setAllPrepare];
    }];
    
}
#pragma mark 设置标题
-(void)setTittle
{
    UILabel *titleLable=[UILabel new];
    titleLable.font=[UIFont systemFontOfSize:18];
    titleLable.text=@"视听";
    titleLable.centerx=self.view.centerx;
    titleLable.size=CGSizeMake(200, 44);
    titleLable.y=20;
    [self.view addSubview:titleLable];
    
}
#pragma mark 添加控制器
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
