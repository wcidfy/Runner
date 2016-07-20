//
//  HotView.h
//  Runner
//
//  Created by lxx on 16/7/18.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsHotReplyItems.h"
/**
 *  热门评论
 */
@interface HotView : UIView
@property(nonatomic,strong)NewsHotReplyItems *hotList;
@property(nonatomic,assign)CGFloat hotHeight;
+(instancetype)HotViewWithNewsHotReplyItems:(NewsHotReplyItems *)item;
@end
