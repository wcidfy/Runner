//
//  AVVideoListCell.h
//  Runner
//
//  Created by lxx on 16/7/9.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVVideoList.h"
/**
 *  视屏列表 cell
 */
@interface AVVideoListCell : UITableViewCell
@property(nonatomic,strong)AVVideoList *videoList;
@property(nonatomic,strong)void(^movieBlock)(NSString *,UIView *);
@property(nonatomic,strong)void(^shareClick)(AVVideoList *);
@end
