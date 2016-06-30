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
{
    NSInteger i;

}
@property(nonatomic,strong)LoginView *loginView;
@property(nonatomic,strong)MainController *mainView;
@property(nonatomic,strong)LeftViewController *leftView;


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
    if(i>3)
    {
        [MBProgressHUD showError:@"对不起你输入次数过多,账号锁定五分钟"];
        NSTimer *timer=[NSTimer scheduledTimerWithTimeInterval:300.0f target:self selector:@selector(TimeAction) userInfo:nil repeats:YES];

        return;
    
    }
 
    if ([_loginView.loginName.text isEqualToString:@"123"]&&[_loginView.loginPass.text isEqualToString:@"123"]) {
        NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
        [ud setObject:@"123" forKey:@"loginName"];
         [ud setObject:@"123" forKey:@"loginPass"];
        [self dismissViewControllerAnimated:YES completion:nil];
    }else if([_loginView.loginName.text isEqualToString:@""])
    {
        [MBProgressHUD showError:@"请输入账号"];
    
    }else if([_loginView.loginPass.text isEqualToString:@""])
    {
        [MBProgressHUD showError:@"请输入密码"];
        
    }else
    {
        i++;
        [MBProgressHUD showError:[NSString stringWithFormat:@"账号或者密码输入错误 %ld次",i]];
    }
   
   
  
   

}
-(void)TimeAction
{
    i=0;

    XXLog(@"1");
}
@end
