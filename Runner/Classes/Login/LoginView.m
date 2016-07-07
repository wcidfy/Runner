//
//  LoginView.m
//  Runner
//
//  Created by lxx on 16/6/22.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "LoginView.h"
@interface LoginView()
{
    UIView *_lineNameBotton;
    UIView *_linePassBotton;
//    半透膜
    UIVisualEffectView *bgView;

}
@end
@implementation LoginView
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"hh1.jpg"]];
        bgView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
        bgView.alpha = 0.5f;
        bgView.clipsToBounds = YES;
        [self addSubview:bgView];
        
       
        UIView *leftNameView=[[UIView alloc]init];
        leftNameView.frame=CGRectMake(0, 0, 40, 40);
        _loginName=[[UITextField alloc]init];
        _loginName.leftView=leftNameView;
        _loginName.leftViewMode=UITextFieldViewModeAlways;
        
        UIColor *color = [UIColor whiteColor];
        _loginName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入用户名" attributes:@{NSForegroundColorAttributeName: color}];
        [self addSubview:_loginName];
        
        _lineNameBotton=[[UIView alloc]init];
        _lineNameBotton.backgroundColor=[UIColor whiteColor];
        [self addSubview:_lineNameBotton];
        
        
        UIView *leftPassView=[[UIView alloc]init];
        leftPassView.frame=CGRectMake(0, 0, 40, 40);
        _loginPass=[[UITextField alloc]init];
        _loginPass.leftView=leftPassView;
        _loginPass.leftViewMode=UITextFieldViewModeAlways;
        
    
        _loginPass.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入密码" attributes:@{NSForegroundColorAttributeName: color}];
        [self addSubview:_loginPass];
        
        _linePassBotton=[[UIView alloc]init];
        _linePassBotton.backgroundColor=[UIColor whiteColor];
        [self addSubview:_linePassBotton];
        
        
        _loginButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        _loginButton.backgroundColor=[UIColor colorWithHex:0xE10F51];
        [self addSubview:_loginButton];
        
        
        _qqShareButton=[circularButton buttonWithType:UIButtonTypeCustom];
        [_qqShareButton setImage:[UIImage imageNamed:@"login_QQ_icon"] forState:UIControlStateNormal];
        [_qqShareButton setImage:[UIImage imageNamed:@"login_QQ_icon_click"] forState:UIControlStateHighlighted];
        [_qqShareButton setTitle:@"QQ登录" forState:UIControlStateNormal];
        [self addSubview:_qqShareButton];
        
        _wxShareButton=[circularButton buttonWithType:UIButtonTypeCustom];
        [_wxShareButton setImage:[UIImage imageNamed:@"login_tecent_icon"] forState:UIControlStateNormal];
        [_wxShareButton setImage:[UIImage imageNamed:@"login_tecent_icon_click"] forState:UIControlStateHighlighted];
        [_wxShareButton setTitle:@"微信登录" forState:UIControlStateNormal];
        [self addSubview:_wxShareButton];
        
        
        _sinaShareButton=[circularButton buttonWithType:UIButtonTypeCustom];
        [_sinaShareButton setImage:[UIImage imageNamed:@"login_sina_icon"] forState:UIControlStateNormal];
        [_sinaShareButton setImage:[UIImage imageNamed:@"login_sina_icon_click"] forState:UIControlStateHighlighted];
        [_sinaShareButton setTitle:@"新浪分享" forState:UIControlStateNormal];
        [self addSubview:_sinaShareButton];
       
    }
    
    
    return self;


}
-(void)layoutSubviews
{

    [super layoutSubviews];
    _loginName.frame=CGRectMake(20, ViewWidth*0.4, ViewWidth-40, 30);
    _lineNameBotton.frame=CGRectMake(20,  _loginName.y+30, ViewWidth-40, 1);
    _loginPass.frame=CGRectMake(20, _lineNameBotton.y+1+10, ViewWidth-40, 30);
    _linePassBotton.frame=CGRectMake(20, _loginPass.y+30, ViewWidth-40, 1);
    _loginButton.frame=CGRectMake(20, _linePassBotton.y+1+20, ViewWidth-40, 40);
      CGFloat shareWidth=(ViewWidth-40)/3;
    _qqShareButton.frame=CGRectMake(10, ViewHeight-150, shareWidth, shareWidth);
  
    _wxShareButton.frame=CGRectMake(20+shareWidth, ViewHeight-150, shareWidth, shareWidth);
    
    _sinaShareButton.frame=CGRectMake(30+shareWidth*2, ViewHeight-150, shareWidth, shareWidth);
    bgView.frame = CGRectMake(0, 0, ViewWidth, ViewHeight);

}

@end
