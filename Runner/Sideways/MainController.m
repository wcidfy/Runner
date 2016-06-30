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
#define CZVersionKey @"version"

@interface MainController ()

@end

@implementation MainController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor=[UIColor greenColor];
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 0, 40, 44);
    [button setTitle:@"左边" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [button addTarget:[SlideNavigationController sharedInstance] action:@selector(toggleLeftMenu) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftButton=[[UIBarButtonItem alloc]initWithCustomView:button];
    [SlideNavigationController sharedInstance].leftBarButtonItem=leftButton;
   //根据版本号添加新特性
    [self Vesion];
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
        
        [self presentViewController:vc animated:YES completion:nil];
        
        // 保持当前的版本，用偏好设置
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:CZVersionKey];
        
        
        
        
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
