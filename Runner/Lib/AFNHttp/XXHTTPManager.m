//
//  XXHTTPManager.m
//  Runner
//
//  Created by lxx on 16/7/5.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "XXHTTPManager.h"

@implementation XXHTTPManager
+ (instancetype)manager
{
    XXHTTPManager *mgr = [super manager];
    NSMutableSet *mgrSet = [NSMutableSet set];
    mgrSet.set = mgr.responseSerializer.acceptableContentTypes;
    
    // 添加额外类型
    [mgrSet addObject:@"text/html"];
    
    mgr.responseSerializer.acceptableContentTypes = mgrSet;
    
    return mgr;
}
@end
