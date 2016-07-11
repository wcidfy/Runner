//
//  TalkListItem.h
//  Runner
//
//  Created by lxx on 16/7/10.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TalkListItem : NSObject
@property (nonatomic, strong) NSString *expertId;
// 图片下方的描述
@property (nonatomic, strong) NSString *alias;

@property (nonatomic, strong) NSString *name;
// 大图
@property (nonatomic, strong) NSString *picurl;

@property (nonatomic, strong) NSString *descrip;
// 类型
@property (nonatomic, strong) NSString *classification;

@property (nonatomic, strong) NSString *title;
// 头像
@property (nonatomic, strong) NSString *headpicurl;

@property (nonatomic, strong) NSString *questionCount;

@property (nonatomic, strong) NSString *answerCount;

@property (nonatomic, strong) NSString *createTime;
// 关注人数
@property (nonatomic, strong) NSString *concernCount;
@end
