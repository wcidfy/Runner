//
//  AppDelegate.m
//  Runner
//
//  Created by lxx on 16/6/22.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginController.h"

#import "MainController.h"
#import "SlideNavigationController.h"
#import "LeftViewController.h"
#import "ChooseWindow.h"
#import "NewFeatureController.h"
#define CZVersionKey @"version"

@interface AppDelegate ()
{
    NSString *networkStr;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
   
    [self.window makeKeyAndVisible];
    if([[[NSUserDefaults standardUserDefaults]objectForKey:@"loginName"]isEqualToString:@"123"]&&[[[NSUserDefaults standardUserDefaults]objectForKey:@"loginPass"]isEqualToString:@"123"])
    {
       [ChooseWindow ChooseController:self.window];
    }else
    {
    self.window.rootViewController=[LoginController new];
    }
    
    
    [self networkMonitor];
    
    return YES;
}
-(void)networkMonitor
{
   
//   __weak typeof(self) weakSelf = self;
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    // 2.设置网络状态改变后的处理
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态改变了, 就会调用这个block
        switch (status) {
            case AFNetworkReachabilityStatusUnknown: // 未知网络
                NSLog(@"未知网络");
                [MBProgressHUD showError:@"未知网络"];
                networkStr=@"未知网络";
                break;
                
            case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
                NSLog(@"没有网络(断网)");
                [MBProgressHUD showError:@"没有网络(断网)"];
                 networkStr=@"没有网络(断网)";
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
                NSLog(@"手机自带网络");
                 [MBProgressHUD showError:@"手机自带网络"];
                 networkStr=@"手机自带网络";
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
                NSLog(@"WIFI");
//                [MBProgressHUD showError:@"WIFI"];
                 networkStr=@"WIFI";
                break;
        }
        
        
    }];
    
    // 3.开始监控
    [mgr startMonitoring];
   
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
