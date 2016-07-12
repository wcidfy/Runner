//
//  PhotoTitle.h
//  Runner
//
//  Created by lxx on 16/7/12.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsPhotoModel.h"
/**
 *  图片标题
 */
@interface PhotoTitle : UIView
@property(nonatomic,strong)NewsPhotoModel *photoItem;
@property(nonatomic,strong)UILabel *pageCountL;
+(CGFloat)heightWithPhoto:(NewsPhotoModel*)photoSet;

@end
