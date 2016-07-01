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
#import "HomeController.h"
#import "DiscoverController.h"
#define CZVersionKey @"version"

@interface MainController ()
{
    UIView *_topView;
    UIButton *_leftButton;

}
@property(nonatomic,strong)HomeController *home;
@property(nonatomic,strong)DiscoverController *discover;

@end

@implementation MainController
- (void)viewDidLoad {
    [super viewDidLoad];
    [[SlideNavigationController sharedInstance].navigationBar setHidden:YES];
    self.view.backgroundColor=[UIColor redColor];
    [self Navgitionbar];
    self.tabBar.backgroundImage=[UIImage new] ;
    self.tabBar.backgroundColor=[UIColor orangeColor];
    [self addControllers];
}
#pragma mark 导航栏定制
-(void)Navgitionbar
{
    _topView=[UIView new];
    _topView.frame=CGRectMake(20, 20, kScreenWidth, 44);
    [self.view addSubview:_topView];
    _leftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    _leftButton.frame=CGRectMake(0, 0, 44, 44);
    [_leftButton setBackgroundImage:[UIImage imageNamed:@"login_QQ_icon_click"] forState:UIControlStateNormal];
    [_leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_topView addSubview:_leftButton];
    
}
-(void)leftButtonAction
{

    [[SlideNavigationController sharedInstance]toggleLeftMenu];
}
-(void)Vesion
{

    // 1.获取当前的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    
    // 2.获取上一次的版本号
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:CZVersionKey];
    
    if (![currentVersion isEqualToString:lastVersion]) { // 有最新的版本号
        
        // 有最新的版本号
        
        // 进入新特性界面
        // 如果有新特性，进入新特性界面
        NewFeatureController *vc = [[NewFeatureController alloc] init];
        
        [self presentViewController:vc animated:NO completion:nil];
        
        // 保持当前的版本，用偏好设置
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:CZVersionKey];
        
        
        
        
    }


}
-(void)addControllers
{
   _home=[HomeController new];
    [self addController:_home imageNol:[UIImage imageNamed:@"tabBar_essence_icon"] imageSelected:[UIImage imageNamed:@"tabBar_essence_click_icon"] titleStr:@"主页"];

    _discover=[DiscoverController new];
    [self addController:_discover imageNol:[UIImage imageNamed:@"tabBar_friendTrends_icon"] imageSelected:[UIImage imageNamed:@"tabBar_friendTrends_click_icon"] titleStr:@"发现"];
}

-(void)addController:(UIViewController *)vc imageNol:(UIImage *)imageNol imageSelected:(UIImage *)imageSelected titleStr:(NSString *)titleStr
{
    vc.title=titleStr;
    vc.tabBarItem.title=titleStr;
    vc.tabBarItem.image=[imageNol imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage=[imageSelected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:vc];
    

}

-(void)viewWillAppear:(BOOL)animated
{
    
    
    //根据版本号添加新特性
    [self Vesion];
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    if (![[ud objectForKey:@"loginName"] isEqualToString:@"123"]||![[ud objectForKey:@"loginPass"] isEqualToString:@"123"]) {
        [self presentViewController:[LoginController new] animated:NO completion:nil];
    }


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
