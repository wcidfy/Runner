//
//  OneController.m
//  Runner
//
//  Created by lxx on 16/6/28.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "OneController.h"
#import "TopModel.h"
#import "States.h"
@interface OneController ()<JCTopicDelegate>
{
    UIView *_topView;
    UIButton *_leftButton;
}
@property(nonatomic,strong)NSMutableArray *imageArray;
@property(nonatomic, strong) UIPageControl *pangeControl;
@end

@implementation OneController
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
        [_imageArray addObject:[NSDictionary dictionaryWithObjects:@[@"http://image.tianjimedia.com/uploadImages/2014/233/51/82AJ9043Y24I.jpg" ,@"第一张图片",@NO,image] forKeys:@[@"pic",@"title",@"isLoc",@"placeholderImage"]]];
        [_imageArray addObject:[NSDictionary dictionaryWithObjects:@[@"http://pic.yesky.com/uploadImages/2015/026/13/2XS3609A211Y.jpg" ,@"第二张图片",@NO,image] forKeys:@[@"pic",@"title",@"isLoc",@"placeholderImage"]]];
        [_imageArray addObject:[NSDictionary dictionaryWithObjects:@[@"http://img.pconline.com.cn/images/upload/upc/tx/itbbs/1308/10/c6/24351557_1376142714149.jpg" ,@"第三张图片",@NO] forKeys:@[@"pic",@"title",@"isLoc"]]];
        //网络图片加载失败
        UIImage * PlaceholderImage = [UIImage imageNamed:@"3.jpg"];
        [_imageArray addObject:[NSDictionary dictionaryWithObjects:@[@"http://img.ycwb.com/news/attachement/jpg/site2/20100827/001558e890930de166d02f.jpg" ,@"第四张图片",@NO,PlaceholderImage] forKeys:@[@"pic",@"title",@"isLoc",@"placeholderImage"]]];
       
        NSDictionary *dict=@
        {
        @"aa":@"111111",
            @"bb":@"2222",
            @"user":@{@"name":@"2222",
                      @"pid":@111,
                      },
            @"arr":@[@{@"cc":@"qqqq",@"dd":@"dddddddd"},@{@"cc":@"eeeeeee",@"dd":@"eeeeeeeep"}],
        };
        States *sta=[States mj_objectWithKeyValues:dict];
        XXLog(@"%@",sta);
        for (aaid *Aid in sta.arr) {
             NSLog(@"cc=%@, dd=%@", Aid.cc, Aid.dd);
        }
    }
    return _imageArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor=[UIColor whiteColor];
    
    self.navigationController.navigationBar.hidden=YES;
    [self Navgitionbar];
    [self loadScrolImage];
}
#pragma mark 导航栏定制
-(void)Navgitionbar
{
    _topView=[UIView new];
    _topView.frame=CGRectMake(20, 20, kScreenWidth, 44);
    [self.view addSubview:_topView];
    _leftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    _leftButton.frame=CGRectMake(0, 0, 44, 44);
    [_leftButton setTitle:@"返回" forState:UIControlStateNormal];
    [_leftButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_topView addSubview:_leftButton];
    
}
-(void)loadScrolImage
{
  
    //实例化
    _Topic = [[JCTopic alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64)];
    //代理
    _Topic.JCdelegate = self;
    
    
    //加入数据
    _Topic.pics = self.imageArray;
    //更新
    [_Topic upDate];
    [self.view addSubview:_Topic];
    _pangeControl = [UIPageControl new];
    _pangeControl.currentPageIndicatorTintColor = [UIColor redColor];
    _pangeControl.pageIndicatorTintColor = [UIColor grayColor];
    _pangeControl.enabled = YES;
    
    _pangeControl.numberOfPages=self.imageArray.count;
    [self.view addSubview:_pangeControl];
    [_pangeControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.Topic.bottom).offset(10);
        make.centerX.equalTo(self.Topic.centerX);
    }];

    
}
-(void)leftButtonAction
{
    [self.navigationController popViewControllerAnimated:YES];
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
