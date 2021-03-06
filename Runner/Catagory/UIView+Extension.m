//
//  UIView+Extension.m
//  Weibo
//
//  Created by Fay on 15/9/14.
//  Copyright (c) 2015年 Fay. All rights reserved.
//

#import "UIView+Extension.h"
@implementation UIView (Extension)

-(void)setX:(CGFloat)x {
    
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(CGFloat)x {
    return self.frame.origin.x;
}



-(void)setY:(CGFloat)y {
    
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
    
    
}

-(CGFloat)y {
    return self.frame.origin.y;
    
}


- (void)setCenterx:(CGFloat)centerx
{
    CGPoint center = self.center;
    center.x = centerx;
    self.center = center;
}

- (CGFloat)centerx
{
    return self.center.x;
}

- (void)setCentery:(CGFloat)centery
{
    CGPoint center = self.center;
    center.y = centery;
    self.center = center;
}

- (CGFloat)centery
{
    return self.center.y;
}


-(void)setWidth:(CGFloat)width {
    
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;

}

-(CGFloat)width {
    
    return self.frame.size.width;
    
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}


- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}



@end
