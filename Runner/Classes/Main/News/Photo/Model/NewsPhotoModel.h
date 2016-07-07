//
//  NewsPhotoModel.h
//  Runner
//
//  Created by lxx on 16/7/6.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  图集model
 */
@interface NewsPhotoModel : NSObject
// 发布时间
@property (nonatomic, strong) NSString *datatime;
// 作者
@property (nonatomic, strong) NSString *creator;
// 来源
@property (nonatomic, strong) NSString *source;
// 图片url
@property (nonatomic, strong) NSString *imgurl;
// 图片描述
@property (nonatomic, strong) NSString *imgtitle;
// 图片描述
@property (nonatomic, strong) NSString *note;
// 图集描述
@property (nonatomic, strong) NSString *setname;

@property (nonatomic, strong) NSString *photosetID;
@end
