//
//  TalkAskDetail.h
//  Runner
//
//  Created by lxx on 16/7/11.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  话题详情 请求model
 */
@interface TalkAskDetail : NSObject
@property (nonatomic, strong) NSString *questionId;
//
@property (nonatomic, strong) NSString *content;

@property (nonatomic, strong) NSString *relatedExpertId;
//
@property (nonatomic, strong) NSString *userName;

@property (nonatomic, strong) NSString *userHeadPicUrl;
//
@property (nonatomic, strong) NSString *state;

@property (nonatomic, strong) NSString *quesTime;

@property (nonatomic, strong) NSString *questionCount;



@end
