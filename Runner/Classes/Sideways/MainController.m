//
//  MainController.m
//  Runner
//
//  Created by lxx on 16/6/23.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "MainController.h"
#import "LeftViewController.h"
#import "NewFeatureController.h"
#import "LoginController.h"
#import "NewsController.h"
#import "AVVideoController.h"
#import "DiscoverController.h"
#import "TalkController.h"
#import "MeController.h"


#define CZVersionKey @"version"

@interface MainController ()
{
    UIView *_topView;
    UIButton *_leftButton;

}
@property(nonatomic,strong)NewsController *news;
@property(nonatomic,strong)AVVideoController *AVVideo;
@property(nonatomic,strong)DiscoverController *discover;
@property(nonatomic,strong)TalkController *talk;
@property(nonatomic,strong)MeController *me;
//是否准备好刷新 （判断tabbar是否再次点击）
@property (nonatomic, assign) BOOL isReady;
@property (nonatomic, strong) UITabBarItem *selectedItem;


@end

@implementation MainController
- (void)viewDidLoad {
    [super viewDidLoad];


    self.navigationController.navigationBar.hidden=YES;
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"zz1"]];
    [self Navgitionbar];
    
        self.tabBar.backgroundImage=[UIImage new] ;
    self.tabBar.backgroundColor=[UIColor clearColor];
    [self addControllers];
    
        self.selectedItem=self.childViewControllers[0].tabBarItem;
        _isReady=YES;
   
}
#pragma mark 导航栏定制
-(void)Navgitionbar
{
    _topView=[UIView new];
    _topView.frame=CGRectMake(0, 20, kScreenWidth, 44);
    _topView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:_topView];
    _leftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    _leftButton.frame=CGRectMake(20, 0, 44, 44);
    [_leftButton setBackgroundImage:[UIImage imageNamed:@"login_QQ_icon_click"] forState:UIControlStateNormal];
    [_leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_topView addSubview:_leftButton];
    
}
-(void)leftButtonAction
{

    [[SlideNavigationController sharedInstance]toggleLeftMenu];
}

-(void)addControllers
{
   _news=[NewsController new];
    [self addController:_news imageNol:[UIImage imageNamed:@"tabBar_essence_icon"] imageSelected:[UIImage imageNamed:@"tabBar_essence_click_icon"] titleStr:@"新闻"];
    
    _AVVideo=[AVVideoController new];
    [self addController:_AVVideo imageNol:[UIImage imageNamed:@"tabbar_icon_media_normal"] imageSelected:[UIImage imageNamed:@"tabbar_icon_media_highlight"] titleStr:@"视听"];
    
    _talk=[TalkController new];
    [self addController:_talk imageNol:[UIImage imageNamed:@"tabbar_icon_found_normal"] imageSelected:[UIImage imageNamed:@"tabbar_icon_found_highlight"] titleStr:@"话题"];
    
    _discover=[DiscoverController new];
    [self addController:_discover imageNol:[UIImage imageNamed:@"tabBar_friendTrends_icon"] imageSelected:[UIImage imageNamed:@"tabBar_friendTrends_click_icon"] titleStr:@"发现"];
    
    _me=[MeController new];
    [self addController:_me imageNol:[UIImage imageNamed:@"tabBar_me_icon"] imageSelected:[UIImage imageNamed:@"tabBar_me_click_icon"] titleStr:@"我"];
}

-(void)addController:(UIViewController *)vc imageNol:(UIImage *)imageNol imageSelected:(UIImage *)imageSelected titleStr:(NSString *)titleStr
{
    vc.title=titleStr;
    vc.tabBarItem.title=titleStr;
    vc.tabBarItem.image=[imageNol imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage=[imageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:vc];
    

}


-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if (self.selectedItem==item&&_isReady==YES) {
        _isReady=NO;
        XXLog(@"2");

    }
    self.selectedItem=item;
    XXLog(@"1");
}
#pragma mark - SlideNavigationController Methods -
#pragma mark 左滑
- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
   
    return YES;
}
#pragma mark 右滑

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return NO;
}
@end
