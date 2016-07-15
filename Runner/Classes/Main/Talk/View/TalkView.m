//
//  TalkView.m
//  Runner
//
//  Created by lxx on 16/7/13.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "TalkView.h"

@implementation TalkView
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        
        _talkTable=[BKTableView new];
        _talkTable.frame=CGRectMake(0, 64, kScreenWidth, kScreenHeight-64-49);
        _talkTable.dataTableView.contentInset=UIEdgeInsetsMake(-20, 0, 0, 0);
        _talkTable.dataTableView.separatorStyle=UITableViewCellSelectionStyleNone;
        UIView *view=[UIView new];
        view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"zz1"]];
        _talkTable.dataTableView.backgroundView=view;
        [self addSubview:_talkTable];
     
    
    
    }
    return self;
}
@end
