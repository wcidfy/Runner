//
//  HttpTool.m
//  Runner
//
//  Created by lxx on 16/7/5.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "HttpTool.h"
#import "XXNetWorking.h"
#import "MJExtension.h"
#import "NewsListItems.h"
#import "NSObject+AddTimeid.h"
#import "NewsPhotoModel.h"
@implementation HttpTool
+(void)getTopicNewsListWithPgmid:(NSString *)pgmid count:(NSInteger)count timeid:(NSInteger)timeid complete:(void(^)(NSArray *))complete
{
    NSInteger loc = [pgmid rangeOfString:@"/"].location+1;
    NSString *newPgmid = [NSString stringWithFormat:@"%@FNNewsListItem", [pgmid substringFromIndex:loc]];
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
   
    if (count == 1) {
        // 上拉刷新阅读记录为 未读
//        [FNStatusCacheTool setOriginReadSkimWithName:newPgmid];
        // 如果有网络则刷新最新数据
//        if (mgr.isReachable) {
            NSString *urlStr = [NSString stringWithFormat:@"http://c.3g.163.com/nc/article/%@/%ld0-20.html",pgmid,count*2];
            
            [XXNetWorking GET:urlStr parameters:nil progress:^(NSProgress *progress) {
                
            } success:^(id responseObject, NSURLSessionDataTask *task) {
                NSInteger loc = [pgmid rangeOfString:@"/"].location+1;
                NSArray *dicArray = responseObject[[pgmid substringFromIndex:loc]];
                NSMutableArray<NewsListItems*> *arrayItem=[NewsListItems mj_objectArrayWithKeyValuesArray:dicArray];
                // 给timeid赋值
                [NewsListItems setTimeidAttributeWithModelArray:arrayItem timeName:@"ptime"];
                

                complete(arrayItem);
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                
            }];
            
            }
//    }
    
    }
+(void)getNewsListWithPgmid:(NSString *)pgmid count:(NSInteger)count timeid:(NSInteger)timeid complete:(void (^)(NSArray *))complete
{
     NSInteger loc = [pgmid rangeOfString:@"/"].location+1;
    NSString *newPgMid=[NSString stringWithFormat:@"%@FNNewsListItem",[pgmid substringFromIndex:loc]];
    AFNetworkReachabilityManager *mgr=[AFNetworkReachabilityManager sharedManager];
    //有网络刷新数据
    if (!mgr.isReachable) {
         NSString *urlStr = [NSString stringWithFormat:@"http://c.3g.163.com/nc/article/%@/%ld0-20.html",newPgMid,count*2];
        [XXNetWorking GET:urlStr parameters:nil progress:^(NSProgress *progress) {
            
        } success:^(id responseObject, NSURLSessionDataTask *task) {
            NSInteger loc = [pgmid rangeOfString:@"/"].location+1;
            NSArray *dicArray = responseObject[[pgmid substringFromIndex:loc]];
            complete(dicArray);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
        }];
    }
    
}

+(void)getNewsDetailWithPhotoid:(NSString *)photoid complete:(void(^)(id))complete
{
    NSArray *param=[[photoid substringFromIndex:4]componentsSeparatedByString:@"|"];
     NSString *urlStr = [NSString stringWithFormat:@"http://c.m.163.com/photo/api/set/%@/%@.json",param.firstObject,param.lastObject];
    [XXNetWorking GET:urlStr parameters:nil progress:^(NSProgress *progress) {
        
    } success:^(id responseObject, NSURLSessionDataTask *task) {
     NSArray <NewsPhotoModel *>*array =  [NewsPhotoModel mj_objectArrayWithKeyValuesArray: responseObject[@"photos" ] ];
        complete(array);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
}
@end
