//
//  BaseViewController.h
//  Runner
//
//  Created by lxx on 16/6/28.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JGProgressHUD.h"

/**
 *  UIViewcontroller 基类
 */
@interface BaseViewController : UIViewController
/**
 *  隐藏HUD
 *
 *  @param animated 动画效果
 */
- (void)hieHUD:(BOOL)animated;
/**
 *  菊花
 */
- (JGProgressHUD *)showLoading;
/**
 *  隐藏菊花
 */
- (void)hideLoading;
/**
 *  提示框带菊花
 *
 *  @param tip 描述文字
 *
 *  @return HUD实例
 */
- (JGProgressHUD *)showLoading:(NSString *)tip;
/**
 *  提示框
 *
 *  @param tip 描述文字
 *
 *  @return HUD实例
 */
- (JGProgressHUD *)showTip:(NSString *)tip;
/**
 *  提示框
 *
 *  @param tip   描述文字
 *  @param delay 显示时间
 *
 *  @return HUD实例
 */
- (JGProgressHUD *)showTip:(NSString *)tip delay:(double)delay;
/**
 *  错误提示框
 *
 *  @param tip 描述文字
 *
 *  @return HUD实例
 */
- (JGProgressHUD *)showErrorTip:(NSString *)tip;
/**
 *  成功提示框
 *
 *  @param tip 描述文字
 *
 *  @return HUD实例
 */
- (JGProgressHUD *)showSuccessTip:(NSString *)tip;

- (void)setBackBarButtonItemWithAction:(SEL)action;

- (void)setShareBarButtonItemWithAction:(SEL)action;
@end
