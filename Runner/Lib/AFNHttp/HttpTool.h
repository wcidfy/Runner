//
//  HttpTool.h
//  Runner
//
//  Created by lxx on 16/7/5.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpTool : NSObject

+(void)getTopicNewsListWithPgmid:(NSString *)pgmid count:(NSInteger)count timeid:(NSInteger)timeid complete:(void(^)(NSArray *))complete;

+(void)getNewsDetailWithPhotoid:(NSString *)photoid complete:(void(^)(id))complete;
@end
