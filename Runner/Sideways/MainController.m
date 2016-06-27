//
//  MainController.m
//  Runner
//
//  Created by lxx on 16/6/23.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "MainController.h"
#import "LeftViewController.h"
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
