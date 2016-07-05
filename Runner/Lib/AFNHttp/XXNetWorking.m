//
//  XXNetWorking.m
//  Runner
//
//  Created by lxx on 16/7/5.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "XXNetWorking.h"
#import "XXHTTPManager.h"
@implementation XXNetWorking
+ (NSURLSessionDataTask *)GET:(NSString *)url parameters:(NSDictionary *)parameters progress:(void (^)(NSProgress *))progress success:(void (^)(id, NSURLSessionDataTask *))success failure:(void (^)(NSURLSessionDataTask *, NSError *))taskError{
     XXHTTPManager *manager = [XXHTTPManager manager];
    
    return [manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        progress(downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject,task);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        taskError(task,error);
    }];
}

+ (NSURLSessionDataTask *)POST:(NSString *)url parameters:(NSDictionary *)parameters progress:(void (^)(NSProgress *))progress success:(void (^)(id, NSURLSessionDataTask *))success failure:(void (^)(NSURLSessionDataTask *, NSError *))taskError{
    
     XXHTTPManager *manager = [XXHTTPManager manager];
    
    return [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        progress(downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject,task);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        taskError(task,error);
    }];
    
}
@end
