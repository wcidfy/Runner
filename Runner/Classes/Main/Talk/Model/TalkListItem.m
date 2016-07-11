//
//  TalkListItem.m
//  Runner
//
//  Created by lxx on 16/7/10.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "TalkListItem.h"
#import "MJExtension.h"

@implementation TalkListItem
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"descrip":@"description"};
}

@end
