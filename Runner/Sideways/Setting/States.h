//
//  States.h
//  Runner
//
//  Created by lxx on 16/6/30.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import"User.h"
#import"MJExtension.h"
@interface aaid : NSObject
@property(nonatomic,copy)NSString *cc;
@property(nonatomic,copy)NSString *dd;

@end


@interface States : NSObject
@property(nonatomic,copy)NSString *aa;
@property(nonatomic,copy)NSString *bb;
@property(nonatomic,strong)User *user;
@property(nonatomic,strong)NSMutableArray *arr;
@end
