//
//  NewFeatureController.m
//  Runner
//
//  Created by lxx on 16/6/30.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "NewFeatureController.h"
#import "TopModel.h"
#import "LoginController.h"
#import "SlideNavigationController.h"
#import "MainController.h"
@interface NewFeatureController ()<JCTopicDelegate>

{
    UIButton *but;

}
@property(nonatomic,strong)NSMutableArray *imageArray;
@property(nonatomic, strong) UIPageControl *pangeControl;

@end

@implementation NewFeatureController
-(NSMutableArray*)imageArray
{
    if (_imageArray==nil) {
        _imageArray=[[NSMutableArray alloc]init];
        //本地图片
        //***********************//
        //key pic = 本地 UIImage
        //key title = 显示的标题 NSString
        //key isLoc = 是否本地图片 Bool
         //网络图片加载失败 placeholderimage
        //***********************//
        
        UIImage * image = [UIImage imageNamed:@"1.jpg"];
        [_imageArray addObject:[NSDictionary dictionaryWithObjects:@[@"http://e.hiphotos.baidu.com/zhidao/wh%3D600%2C800/sign=73326db1d300baa1ba794fbd7720952a/55e736d12f2eb938775fdaafd7628535e5dd6fb9.jpg" ,@"第一张图片",@NO,@"placeholderImage"] forKeys:@[@"pic",@"title",@"isLoc",image]]];
        [_imageArray addObject:[NSDictionary dictionaryWithObjects:@[@"http://e.hiphotos.baidu.com/zhidao/pic/item/574e9258d109b3de487503f0ccbf6c81810a4c64.jpg" ,@"第二张图片",@NO,@"placeholderImage"] forKeys:@[@"pic",@"title",@"isLoc",image]]];
        [_imageArray addObject:[NSDictionary dictionaryWithObjects:@[@"http://wenwen.soso.com/p/20100103/20100103113127-1008909770.jpg" ,@"第三张图片",@NO,@"placeholderImage"] forKeys:@[@"pic",@"title",@"isLoc",image]]];
       
        [_imageArray addObject:[NSDictionary dictionaryWithObjects:@[[UIImage imageNamed:@"llo"],@"第四张图片",@YES,image] forKeys:@[@"pic",@"title",@"isLoc",@"placeholderImage"]]];
         }
    return _imageArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@" 这是一个新特性页面";
    self.view.backgroundColor=[UIColor redColor];
    [self CreatUI];
}
-(void)CreatUI
{
    _topPic=[[JCTopic alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _topPic.JCdelegate=self;
    _topPic.pics=self.imageArray;
    [_topPic upDate];
    [_topPic releaseTimer];

    [self.view addSubview:_topPic];
  
    
    
    _pangeControl = [UIPageControl new];
    _pangeControl.currentPageIndicatorTintColor = [UIColor redColor];
    _pangeControl.pageIndicatorTintColor = [UIColor grayColor];
    _pangeControl.enabled = YES;
    
    _pangeControl.numberOfPages=self.imageArray.count;
    _pangeControl.frame=CGRectMake(0, kScreenHeight-40, kScreenWidth, 40);
    [self.view addSubview:_pangeControl];
    
    but=[UIButton buttonWithType:UIButtonTypeCustom];
    but.frame=CGRectMake(0, 100, 100, 40);
    but.backgroundColor=[UIColor redColor];
    [but setTitle:@"立即体验" forState:UIControlStateNormal];
    [but setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    but.hidden=YES;
    [but addTarget:self action:@selector(butClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
}

-(void)butClick
{
[self presentViewController:[LoginController new] animated:NO completion:nil];
}

#pragma mark jctop 代理
-(void)didClick:(id)data
{
    but.hidden=NO;

}

-(void)currentPage:(int)page total:(NSUInteger)total
{
    _pangeControl.currentPage=page;
    
    [_topPic releaseTimer];
}
@end
