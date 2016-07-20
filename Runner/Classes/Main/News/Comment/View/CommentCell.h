//
//  CommentCell.h
//  Runner
//
//  Created by lxx on 16/7/19.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsHotReplyItems.h"
@interface CommentCell : UITableViewCell
@property(nonatomic,strong)NewsHotReplyItems *itemList;
@property(nonatomic,assign)CGFloat cellHeight;
+(CGFloat)heightWithItemList:(NewsHotReplyItems*)itemList;
@end
