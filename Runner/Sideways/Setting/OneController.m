//
//  OneController.m
//  Runner
//
//  Created by lxx on 16/6/28.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "OneController.h"
#import "OneView.h"

@interface OneController ()<JCTopicDelegate>
@property(nonatomic,strong)OneView *oneView;
@property(nonatomic,strong)NSMutableArray *imageArray;
@property(nonatomic, strong) UIPageControl *pangeControl;
@end

@implementation OneController
-(NSMutableArray*)imageArray
{
    if (_imageArray==nil) {
        _imageArray=[[NSMutableArray alloc]init];
        UIImage * image = [UIImage imageNamed:@"1.jpg"];
        [_imageArray addObject:[NSDictionary dictionaryWithObjects:@[image ,@"PIC1",@YES] forKeys:@[@"pic",@"title",@"isLoc"]]];
        UIImage * image2 = [UIImage imageNamed:@"2.jpg"];
        [_imageArray addObject:[NSDictionary dictionaryWithObjects:@[image2 ,@"PIC2",@YES] forKeys:@[@"pic",@"title",@"isLoc"]]];
        [_imageArray addObject:[NSDictionary dictionaryWithObjects:@[@"http://163.54114.com/upimg/allimg/120619/5-120619112512.jpg" ,@"PIC3",@NO] forKeys:@[@"pic",@"title",@"isLoc"]]];
        //网络图片加载失败
        UIImage * PlaceholderImage = [UIImage imageNamed:@"3.jpg"];
        [_imageArray addObject:[NSDictionary dictionaryWithObjects:@[@"http://s.doyo.cn/img/52/cf/91779e9e784d2c000003.jpg" ,@"PIC4",@NO,PlaceholderImage] forKeys:@[@"pic",@"title",@"isLoc",@"placeholderImage"]]];
       
    }
    return _imageArray;
}
//-(void)loadView
//{
//    [super loadView];
//    _oneView=[[OneView alloc]init];
//    _oneView.backgroundColor=[UIColor clearColor];
//    _oneView.topScrollView.JCdelegate=self;
//    self.view=_oneView;
//
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor=[UIColor whiteColor];
//    [self showSuccessTip:@"知道了"];
//    [_oneView setCarousel:self.imageArray];
    
    [self loadScrolImage];
}
-(void)loadScrolImage
{
  
    //实例化
    _Topic = [[JCTopic alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64)];
    //代理
    _Topic.JCdelegate = self;
    //创建数据
    NSMutableArray * tempArray = [[NSMutableArray alloc]init];
    //本地图片
    //***********************//
    //key pic = 本地 UIImage
    //key title = 显示的标题 NSString
    //key isLoc = 是否本地图片 Bool
    //***********************//
    UIImage * image = [UIImage imageNamed:@"1.jpg"];
    [tempArray addObject:[NSDictionary dictionaryWithObjects:@[image ,@"第一张图片",@YES] forKeys:@[@"pic",@"title",@"isLoc"]]];
    UIImage * image2 = [UIImage imageNamed:@"2.jpg"];
    [tempArray addObject:[NSDictionary dictionaryWithObjects:@[image2 ,@"第二张图片",@YES] forKeys:@[@"pic",@"title",@"isLoc"]]];
    //网络图片
    //***********************//
    //key pic = 地址 NSString
    //key title = 显示的标题 NSString
    //key isLoc = 是否本地图片 Bool
    //key placeholderImage = 网络图片加载失败时显示的图片 UIImage
    //***********************//
    UIImage * PlaceholderImage = [UIImage imageNamed:@"3.jpg"];
    [tempArray addObject:[NSDictionary dictionaryWithObjects:@[@"http://img.pconline.com.cn/images/upload/upc/tx/itbbs/1308/10/c6/24351557_1376142714149.jpg" ,@"第三张图片",@NO,PlaceholderImage] forKeys:@[@"pic",@"title",@"isLoc",@"placeholderImage"]]];
    
    [tempArray addObject:[NSDictionary dictionaryWithObjects:@[@"http://img.ycwb.com/news/attachement/jpg/site2/20100827/001558e890930de166d02f.jpg" ,@"第四张图片",@NO,PlaceholderImage] forKeys:@[@"pic",@"title",@"isLoc",@"placeholderImage"]]];
    
    
    
    //加入数据
    _Topic.pics = tempArray;
    //更新
    [_Topic upDate];
    [self.view addSubview:_Topic];
    _pangeControl = [UIPageControl new];
    _pangeControl.currentPageIndicatorTintColor = [UIColor redColor];
    _pangeControl.pageIndicatorTintColor = [UIColor grayColor];
    _pangeControl.enabled = YES;
    
    _pangeControl.numberOfPages=tempArray.count;
    [self.view addSubview:_pangeControl];
    [_pangeControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.Topic.bottom).offset(10);
        make.centerX.equalTo(self.Topic.centerX);
    }];

    
}

#pragma mark - JCDelegate

- (void)didClick:(id)data {
//    Carousel *carousel = data[@"Carousel"];
//    BKWebViewController *webCtrl = [BKWebViewController new];
//    webCtrl.urlString = carousel.link;
//    webCtrl.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:webCtrl animated:YES];
    XXLog(@"__%@",data);
}

- (void)currentPage:(int)page total:(NSUInteger)total {
  _pangeControl.currentPage = page;
}


@end
