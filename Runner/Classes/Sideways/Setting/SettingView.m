//
//  SettingView.m
//  Runner
//
//  Created by lxx on 16/7/1.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "SettingView.h"

@implementation SettingView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        _topView=[UIView new];
        _topView.frame=CGRectMake(20, 20, kScreenWidth, 44);
        [self addSubview:_topView];
        _leftButton=[UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.frame=CGRectMake(0, 0, 44, 44);
        [_leftButton setTitle:@"设置" forState:UIControlStateNormal];
        [_leftButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

        [_topView addSubview:_leftButton];
        _tableView=[UITableView new];
        [self addSubview:_tableView];
    }
   

    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _tableView.frame=CGRectMake(0, 64, kScreenWidth, kScreenHeight);

}
@end
