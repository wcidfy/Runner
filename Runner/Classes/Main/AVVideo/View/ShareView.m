//
//  ShareView.m
//  Runner
//
//  Created by lxx on 16/7/9.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "ShareView.h"
#import "ShareButton.h"
@interface ShareView()

@property(nonatomic,strong)ShareButton *qqZoneShare;
@property(nonatomic,strong)ShareButton *sinaShare;
@property(nonatomic,strong)ShareButton *friendShare;


@end
@implementation ShareView
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        _qqZoneShare=[ShareButton new];
        [_qqZoneShare setImage:[UIImage imageNamed:@"share_platform_qzone"] forState:UIControlStateNormal];
        [self addSubview:_qqZoneShare];
        
        _sinaShare=[ShareButton new];
        [_sinaShare setImage:[UIImage imageNamed:@"share_platform_sina"] forState:UIControlStateNormal];
        [self addSubview:_sinaShare];
        
        _friendShare=[ShareButton new];
        [_friendShare setImage:[UIImage imageNamed:@"share_platform_wechattimeline"] forState:UIControlStateNormal];
        [self addSubview:_friendShare];
        
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat shareW=(kScreenWidth-20*4)/3;
    _qqZoneShare.frame=CGRectMake(20, 0, shareW, shareW);
    _sinaShare.frame=CGRectMake(20*2+shareW, 0, shareW, shareW);
    _friendShare.frame=CGRectMake(20*3+shareW*2, 0, shareW, shareW);
}
@end
