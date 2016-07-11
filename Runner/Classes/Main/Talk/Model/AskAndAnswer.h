//
//  AskAndAnswer.h
//  Runner
//
//  Created by lxx on 16/7/11.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TalkAskDetail.h"
#import "TalkAnswerDetail.h"
/**
 *  请求回答model
 */
@interface AskAndAnswer : NSObject
@property(nonatomic,strong)TalkAskDetail *askTalk;
@property(nonatomic,strong)TalkAnswerDetail *answerTalk;
@property(nonatomic,assign)NSInteger cellHeight;

@end
