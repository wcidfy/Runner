//
//  ChooseWindow.m
//  Runner
//
//  Created by lxx on 16/6/29.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "ChooseWindow.h"
#import "MainController.h"
#import "LoginController.h"
#import "LeftViewController.h"
#import"NewFeatureController.h"
//#define CZVersionKey @"version"
@implementation ChooseWindow
+(void)ChooseController:(UIWindow *)window
{
//    // 1.获取当前的版本号
//    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
//    
//    // 2.获取上一次的版本号
//    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:CZVersionKey];
    
    // v1.0
    // 判断当前是否有新的版本
           // 创建tabBarVc
        MainController *main=[[MainController alloc]init];
    
            SlideNavigationController *slide=[[SlideNavigationController alloc]initWithRootViewController:main
                                              ];
            LeftViewController *left=[[LeftViewController alloc]init];
            [SlideNavigationController sharedInstance].leftMenu=left;
        
        
        // 设置窗口的根控制器
        window.rootViewController = slide;
    [[SlideNavigationController sharedInstance]pushViewController:[MainController new] animated:YES];
   
    
//    if (![currentVersion isEqualToString:lastVersion]) { // 有最新的版本号
//        
// // 有最新的版本号
//        
//        // 进入新特性界面
//        // 如果有新特性，进入新特性界面
//               NewFeatureController *vc = [[NewFeatureController alloc] init];
//        
////                window.rootViewController = vc;
//        
//        // 保持当前的版本，用偏好设置
//        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:CZVersionKey];
//    
//
//
//
//    }
    }
@end
