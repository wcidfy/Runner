//
//  UIImage+Extention.m
//  HaveFriends
//
//  Created by lxx on 16/6/16.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "UIImage+Extention.h"

@implementation UIImage (Extention)
- (UIImage *)resizableImageWithImageName:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    CGFloat w = image.size.width;
    CGFloat h = image.size.height;
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(h/2, w/2, h/2,w/2)];
}
@end
