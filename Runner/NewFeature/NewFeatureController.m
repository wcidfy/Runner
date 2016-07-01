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
        //***********************//
        
        UIImage * image = [UIImage imageNamed:@"1.jpg"];
        [_imageArray addObject:[NSDictionary dictionaryWithObjects:@[image ,@"第一张图片",@YES] forKeys:@[@"pic",@"title",@"isLoc"]]];
        UIImage * image2 = [UIImage imageNamed:@"2.jpg"];
        [_imageArray addObject:[NSDictionary dictionaryWithObjects:@[image2 ,@"第二张图片",@YES] forKeys:@[@"pic",@"title",@"isLoc"]]];
        [_imageArray addObject:[NSDictionary dictionaryWithObjects:@[@"http://img.pconline.com.cn/images/upload/upc/tx/itbbs/1308/10/c6/24351557_1376142714149.jpg" ,@"第三张图片",@NO] forKeys:@[@"pic",@"title",@"isLoc"]]];
        //网络图片加载失败
        UIImage * PlaceholderImage = [UIImage imageNamed:@"3.jpg"];
        [_imageArray addObject:[NSDictionary dictionaryWithObjects:@[@"http://img.ycwb.com/news/attachement/jpg/site2/20100827/001558e890930de166d02f.jpg" ,@"第四张图片",@NO,PlaceholderImage] forKeys:@[@"pic",@"title",@"isLoc",@"placeholderImage"]]];
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
    [self dismissViewControllerAnimated:NO completion:nil];

    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    if (![[ud objectForKey:@"loginName"] isEqualToString:@"123"]||![[ud objectForKey:@"loginPass"] isEqualToString:@"123"]) {
        [self presentViewController:[LoginController new] animated:NO completion:nil];
        
    }

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
