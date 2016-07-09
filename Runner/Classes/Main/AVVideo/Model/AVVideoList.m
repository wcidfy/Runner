//
//  AVVideoList.m
//  Runner
//
//  Created by lxx on 16/7/7.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "AVVideoList.h"
#import "MJExtension.h"
@implementation AVVideoList
+(NSDictionary *)mj_replacedKeyFromPropertyName
{

    return @{@"descrip":@"description"};
}

@end
