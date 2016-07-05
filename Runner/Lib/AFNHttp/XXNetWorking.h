//
//  XXNetWorking.h
//  Runner
//
//  Created by lxx on 16/7/5.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
/**
 *  网络封装
 */
@interface XXNetWorking : NSObject
+ (NSURLSessionDataTask *)GET:(NSString *)url parameters:(NSDictionary *)parameters progress:(void(^)(NSProgress *progress))progress success:(void(^)(id responseObject,NSURLSessionDataTask * task))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))taskError;
+ (NSURLSessionDataTask *)POST:(NSString *)url parameters:(NSDictionary *)parameters progress:(void(^)(NSProgress *progress))progress success:(void(^)(id responseObject,NSURLSessionDataTask * task))success failure:(void(^)(NSURLSessionDataTask *task,NSError *error))taskError;


@end
