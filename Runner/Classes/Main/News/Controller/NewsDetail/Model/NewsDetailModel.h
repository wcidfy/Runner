//
//  NewsDetailModel.h
//  Runner
//
//  Created by lxx on 16/7/15.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  news 详情model
 */
@interface NewsDetailModel : NSObject
// 发布时间
@property (nonatomic, strong) NSString *ptime;
// 来源
@property (nonatomic, strong) NSString *source;
// 责任编辑
@property (nonatomic, strong) NSString *ec;
// 新闻标题
@property (nonatomic, strong) NSString *title;
// 图集
@property (nonatomic, strong) NSArray *img;
// 评论数
@property (nonatomic, assign) NSInteger replyCount;
// 新闻文字内容
@property (nonatomic, strong) NSString *body;
// 能被搜索到的关键字
@property (nonatomic, strong) NSArray *keyword_search;
// 相关新闻
@property (nonatomic, strong) NSArray *relative_sys;
// 关键字
@property (nonatomic, strong) NSString *dkeys;
// 评论接口的参数
@property (nonatomic, strong) NSString *docid;
// 评论接口的参数
@property (nonatomic, strong) NSString *replyBoard;
// 详情页的热门评论
@property (nonatomic, strong) NSArray *replys;
// 分享链接
@property (nonatomic, strong) NSString *shareLink;

@property (nonatomic, strong) NSString *tid;
@end
