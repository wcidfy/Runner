//
//  NewsModel.h
//  Runner
//
//  Created by lxx on 16/7/5.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  新闻列表个数
 */
@interface NewsModel : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *urlString;
@property(nonatomic,copy)NSString *replyUrl;

@end
