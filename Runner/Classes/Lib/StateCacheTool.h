//
//  StateCacheTool.h
//  Runner
//
//  Created by lxx on 16/7/22.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatesParam.h"
/**
 *  FMDB 数据缓存
 */
@interface StateCacheTool : NSObject
/**
 *缓存数据
 */
+(void)addStateCache:(NSArray *)array tname:(NSString *)tname;
/**
 *读取缓存数据
 */
+(NSMutableArray *)getStatusCache:(StatesParam*)param;
@end
