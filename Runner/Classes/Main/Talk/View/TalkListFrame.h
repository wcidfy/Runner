//
//  TalkListFrame.h
//  Runner
//
//  Created by lxx on 16/7/10.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TalkListItem.h"
/**
 *  cell 布局计算cell高度
 */
@interface TalkListFrame : NSObject
@property(nonatomic,strong)TalkListItem *listItem;

@property(nonatomic,assign)CGFloat cellHeight;
@end
