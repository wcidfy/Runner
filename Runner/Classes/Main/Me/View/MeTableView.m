//
//  MeTableView.m
//  Runner
//
//  Created by lxx on 16/7/20.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "MeTableView.h"

@implementation MeTableView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.dataTableView.contentInset=UIEdgeInsetsMake(-20, 0, 0, 0);

        UIView *view=[UIView new];
        view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"zz1"]];
        self.dataTableView.backgroundView=view;
        
    }
    return self;
}

@end
