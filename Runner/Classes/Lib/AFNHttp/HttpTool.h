//
//  HttpTool.h
//  Runner
//
//  Created by lxx on 16/7/5.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpTool : NSObject

//获取新闻列表/
+(void)getTopicNewsListWithPgmid:(NSString *)pgmid count:(NSInteger)count timeid:(NSInteger)timeid complete:(void(^)(NSArray *))complete;
//获取图集列表/
+(void)getNewsDetailWithPhotoid:(NSString *)photoid complete:(void(^)(id))complete;
//获取视听列表标题栏/
+(void)getAllAVVideoController:(void(^)(NSArray *))complete;
//获取标题栏上title对应数据
+(void)getAVVidelListWithTid:(NSString *)tid pageCount:(NSInteger)pageCount complete:(void(^)(id))complete;

@end
