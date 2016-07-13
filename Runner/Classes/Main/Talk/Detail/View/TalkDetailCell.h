//
//  TalkDetailCell.h
//  Runner
//
//  Created by lxx on 16/7/11.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AskAndAnswer.h"
/**
 *  话题详情cell
 */
@interface TalkDetailCell : UITableViewCell
@property(nonatomic,strong)AskAndAnswer *askAnswer;
+(CGFloat)cellHeightWithItem:(AskAndAnswer *)listitem;
@end

