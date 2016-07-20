//
//  ShareBut.m
//  Runner
//
//  Created by lxx on 16/7/18.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "ShareBut.h"

@implementation ShareBut

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.titleLabel.font=[UIFont systemFontOfSize:14];
        self.titleLabel.textColor=[UIColor blackColor];
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        self.imageView.contentMode=UIViewContentModeScaleAspectFit;
    }
    return self;
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleW=contentRect.size.width;
    CGFloat titleH=contentRect.size.height-contentRect.size.height*0.7;
    CGFloat imageH=contentRect.size.height*0.7;
    return CGRectMake(0, imageH, titleW, titleH);
}
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat titleW=contentRect.size.width;
    
    CGFloat imageH=contentRect.size.height*0.7;
    
    return CGRectMake(0, 0, titleW, imageH);
}

@end
