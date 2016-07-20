//
//  CommentView.m
//  Runner
//
//  Created by lxx on 16/7/19.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "CommentView.h"

@implementation CommentView
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
//        self.dataTableView.frame=CGRectMake(0, 64, kScreenWidth, kScreenHeight-64);
        self.dataTableView.contentInset=UIEdgeInsetsMake(44, 0, 0, 0);
    }
    return self;
}


@end
