//
//  NewsListItems.h
//  Runner
//
//  Created by lxx on 16/7/5.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger, FNNewsListCellHeightType) {
    FNNewsListCellHeightTypeAD = 200,
    FNNewsListCellHeightTypeSgl = 90,
    FNNewsListCellHeightTypeThr = 120,
};

/**
 *  新闻页model
 */
@interface NewsListItems : NSObject
// 主参数
@property (nonatomic, strong) NSString *postid;
// 详情参数
@property (nonatomic, strong) NSString *docid;
// 评论参数
@property (nonatomic, strong) NSString *boardid;
// 主标题
@property (nonatomic, strong) NSString *title;
// 子标题
@property (nonatomic, strong) NSString *ltitle;
// 摘要
@property (nonatomic, strong) NSString *digest;
// 配图
@property (nonatomic, strong) NSString *imgsrc;
// 多图
@property (nonatomic, strong) NSArray *imgextra;
// 图集的参数
@property (nonatomic, strong) NSString *photosetID;

@property (nonatomic, assign) NSInteger votecount;

// 广告
@property (nonatomic, strong) NSArray *ads;

// 发布时间
@property (nonatomic, strong) NSString *ptime;
// 回复数
@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, assign) CGFloat totalHeight;

// 时间唯一标识
@property (nonatomic, assign) long timeid;
@end
