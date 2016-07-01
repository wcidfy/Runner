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
#define CZVersionKey @"version"

@interface MainController ()

@end

@implementation MainController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [[SlideNavigationController sharedInstance]toggleLeftMenu];
   
      self.view.backgroundColor=[UIColor whiteColor];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 0, 44, 44);
//    [button setTitle:@"左边" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"login_QQ_icon_click"] forState:UIControlStateNormal];
    [button addTarget:[SlideNavigationController sharedInstance] action:@selector(toggleLeftMenu) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftButton=[[UIBarButtonItem alloc]initWithCustomView:button];
        [SlideNavigationController sharedInstance].leftBarButtonItem=leftButton;
    [[SlideNavigationController sharedInstance].navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsCompact];
    self.tabBar.backgroundImage=[UIImage new] ;
   
    [self addControllers];
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
    UIViewController *vv=[UIViewController new];
    [self addController:vv imageNol:[UIImage imageNamed:@"tabBar_essence_icon"] imageSelected:[UIImage imageNamed:@"tabBar_essence_click_icon"] titleStr:@"1232"];

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
