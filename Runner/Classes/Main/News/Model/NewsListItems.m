//
//  NewsListItems.m
//  Runner
//
//  Created by lxx on 16/7/5.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "NewsListItems.h"
#import "MJExtension.h"
@implementation NewsListItems
MJCodingImplementation
+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"ads":@"NewsHeadModel"};
}
- (CGFloat)totalHeight
{
    if (_imgextra) {
        return FNNewsListCellHeightTypeThr;
    } else {
        return FNNewsListCellHeightTypeSgl;
    }
}
@end
