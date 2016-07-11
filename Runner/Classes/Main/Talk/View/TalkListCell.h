//
//  TalkListCell.h
//  Runner
//
//  Created by lxx on 16/7/10.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TalkListFrame.h"
#import "TalkListItem.h"
/**
 *  话题cell
 */
@interface TalkListCell : UITableViewCell
@property(nonatomic,strong)TalkListFrame *talkListFrame;
@property(nonatomic,strong)void(^buttonClick)(TalkListItem *);
@end
