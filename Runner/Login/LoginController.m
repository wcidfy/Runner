//
//  LoginController.m
//  Runner
//
//  Created by lxx on 16/6/22.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "LoginController.h"
#import "LoginView.h"
#import "LeftViewController.h"
#import "MainController.h"
#import "SlideNavigationController.h"
#import "LeftViewController.h"
#import "ITRAirSideMenu.h"
@interface LoginController ()
@property(nonatomic,strong)LoginView *loginView;
@end

@implementation LoginController
-(void)loadView
{
    [super loadView];
    _loginView=[[LoginView alloc]init];
    self.view=_loginView;


}
-(void)buttonClicks
{
    [_loginView.loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self buttonClicks];
    
}
-(void)loginButtonClick
{
//    LeftViewController *left=[[LeftViewController alloc]init];
//    [self presentViewController:left animated:YES completion:nil];

    MainController *main=[[MainController alloc]init];
   
    SlideNavigationController *slide=[[SlideNavigationController alloc]initWithRootViewController:main];
  
    [self presentViewController:slide animated:YES completion:^{
       
    }];
    LeftViewController *left=[[LeftViewController alloc]init];
    [SlideNavigationController sharedInstance].leftMenu=left;
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[MainController alloc]init] ];
//    
//    LeftViewController *leftMenuViewController = [[LeftViewController alloc]init];
//    
//    
//    
//    // Create side menu controller
//    
//    ITRAirSideMenu *itrAirSideMenu = [[ITRAirSideMenu alloc] initWithContentViewController:navigationController leftMenuViewController:leftMenuViewController];
//    
//    
//    
//    itrAirSideMenu.backgroundImage = [UIImage imageNamed:@"menu_bg"];
//    [self presentViewController:itrAirSideMenu animated:YES completion:nil];

}

@end
