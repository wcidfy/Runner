//
//  TalkListFrame.m
//  Runner
//
//  Created by lxx on 16/7/10.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "TalkListFrame.h"
CGFloat topy=10;
CGFloat iconH=20;
CGFloat imageH=100;
@implementation TalkListFrame

-(void)setListItem:(TalkListItem *)listItem
{
    _listItem=listItem;
    CGFloat descriptionW=kScreenWidth-20;
    CGFloat descriptionH=[_listItem.description boundingRectWithSize:CGSizeMake(descriptionW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height;

    _cellHeight=10+20+120+descriptionH+50;
}
@end
