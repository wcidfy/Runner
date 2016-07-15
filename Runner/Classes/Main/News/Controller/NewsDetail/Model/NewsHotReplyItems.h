//
//  NewsHotReplyItems.h
//  Runner
//
//  Created by lxx on 16/7/15.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  详情 最热评论
 */
@interface NewsHotReplyItems : NSObject
// 昵称
@property (nonatomic, strong) NSString *n;
// 评论时间
@property (nonatomic, strong) NSString *t;
// 评论内容
@property (nonatomic, strong) NSString *b;
// 头像
@property (nonatomic, strong) NSString *timg;
// 点赞
@property (nonatomic, strong) NSString *v;
// 来源
@property (nonatomic, strong) NSString *f;
@end
