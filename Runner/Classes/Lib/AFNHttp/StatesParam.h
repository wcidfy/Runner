//
//  StatesParam.h
//  Runner
//
//  Created by lxx on 16/7/22.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatesParam : NSObject
/** 从缓存中取多少条 */
@property (nonatomic, assign) NSInteger count;
/** 时间唯一标识 */
@property (nonatomic, assign) NSInteger timeid;
/** 模型名字 */
@property (nonatomic, strong) NSString *modelName;
@end
