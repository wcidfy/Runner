//
//  TalkAnswerDetail.h
//  Runner
//
//  Created by lxx on 16/7/11.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  话题详情 回答model
 */
@interface TalkAnswerDetail : NSObject
@property (nonatomic, strong) NSString *answerId;

@property (nonatomic, strong) NSString *board;

@property (nonatomic, strong) NSString *commentId;

@property (nonatomic, strong) NSString *relatedQuestionId;
//
@property (nonatomic, strong) NSString *answerContent;

@property (nonatomic, strong) NSString *specialistHeadPicUrl;
@property (nonatomic, strong) NSString *supportCount;
@property (nonatomic, strong) NSString *replyCount;
@property (nonatomic, strong) NSString *answerTime;

@property (nonatomic, strong) NSString *specialistName;
@property (nonatomic, strong) NSString *content;

@property (nonatomic, strong) NSString *answerCount;



@end
