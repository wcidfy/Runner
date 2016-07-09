//
//  ShareButton.m
//  Runner
//
//  Created by lxx on 16/7/9.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "ShareButton.h"

@implementation ShareButton
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.titleLabel.textColor=[UIColor blackColor];
    }
    return self;
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleW=contentRect.size.width;
    CGFloat titleH=contentRect.size.height-contentRect.size.height*0.8;
    CGFloat imageH=contentRect.size.height*0.8;
    return CGRectMake(0, imageH, titleW, titleH);
}
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat titleW=contentRect.size.width;
   
    CGFloat imageH=contentRect.size.height*0.8;

    return CGRectMake(0, 0, titleW, imageH);
}
@end
