//
//  NewsDetailFrame.h
//  Runner
//
//  Created by lxx on 16/7/15.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsDetailModel.h"
/**
 *  详情页 控件高度
 */
@interface NewsDetailFrame : NSObject
@property(nonatomic,strong)NewsDetailModel *detailList;
// 标题 时间 来源
@property(nonatomic,assign)CGRect titleF;
@property(nonatomic,assign)CGRect timeF;
@property(nonatomic,assign)CGRect souceF;
// 图片  总图片 图片描述
@property (nonatomic, strong) NSMutableArray *pictureFs;
@property (nonatomic, assign) CGFloat totalPicH;
@property (nonatomic, strong) NSMutableArray *altFs;

// 文字内容
@property (nonatomic, assign) CGRect contentF;

// 分享
@property (nonatomic, assign) CGRect shareF;
// 编辑
@property (nonatomic, assign) CGRect ecF;
// 评论
@property (nonatomic, assign) CGRect replyF;
// 相关
@property (nonatomic, assign) CGRect relativeF;
// 总高度
@property (nonatomic, assign) CGFloat totalHeight;
@end
