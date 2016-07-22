//
//  HttpTool.h
//  Runner
//
//  Created by lxx on 16/7/5.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsDetailModel.h"
@interface HttpTool : NSObject

//获取新闻列表/
+(void)getTopicNewsListWithPgmid:(NSString *)pgmid count:(NSInteger)count timeid:(NSInteger)timeid complete:(void(^)(NSArray *))complete;
//获取图集列表/
+(void)getNewsDetailWithPhotoid:(NSString *)photoid complete:(void(^)(id))complete;

// 获取新闻详情列表
+(void)getNewsdetailWithDocid:(NSString *)docid complete:(void(^)(id))complete;
//获取最热评论
+(void)getHotReplyWithDetailItem:(NewsDetailModel *)detailList complete:(void(^)(id))complete;
//获取最新评论
+(void)getNewsReplyWithDetailItem:(NewsDetailModel *)detailList pageCount:(NSInteger)pageCount complete:(void(^)(id))complete;

//获取视听列表标题栏/
+(void)getAllAVVideoController:(void(^)(NSArray *))complete;
//获取标题栏上title对应数据
+(void)getAVVidelListWithTid:(NSString *)tid pageCount:(NSInteger)pageCount timeid:(NSInteger)timeid complete:(void(^)(id))complete;
//获取话题列表
+(void)getTalkListWithPageCount:(NSInteger)pageCount complete:(void(^)(id))complete;
//获取话题明细界面 最热和最新评论
+(void)getTalkDetailWithExpertId:(NSString *)expertId isNew:(NSInteger)isNew pageCount:(NSInteger)pageCount complete:(void(^)(NSMutableArray *))complete;
//获取我界面items
+(void)getItemsCount:(void(^)(NSArray *))complete;
@end
