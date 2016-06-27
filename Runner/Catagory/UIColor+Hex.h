//
//  UIColor+Hex.h
//  CustomApp
//
//  Created by zhangwenhai on 15/4/30.
//  Copyright (c) 2015年 Daman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor(Hex)
+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor*)colorWithHex:(NSInteger)hexValue;
@end
