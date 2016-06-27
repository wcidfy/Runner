//
//  LoginView.h
//  Runner
//
//  Created by lxx on 16/6/22.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "circularButton.h"
/**
 *  登录 View
 */
@interface LoginView : UIView
/**
 *  用户名
 */
@property(nonatomic,strong)UITextField *loginName;
/**
 *  密码
 */
@property(nonatomic,strong)UITextField *loginPass;
/**
 *  登录
 */
@property(nonatomic,strong)UIButton *loginButton;

/**
 *  扣扣登录
 */
@property(nonatomic,strong)circularButton *qqShareButton;
/**
 * 微信登录
 */
@property(nonatomic,strong)circularButton *wxShareButton;
/**
 *  新浪分享
 */
@property(nonatomic,strong)circularButton *sinaShareButton;



@end
