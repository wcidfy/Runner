//
//  NewsDetailItem.h
//  Runner
//
//  Created by lxx on 16/7/15.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsDetailModel.h"
@interface NewsDetailItem : NSObject
+(NewsDetailModel *)itemWithDetailItem:(NewsDetailModel*)item complete:(void(^)(id))complete;
@end
