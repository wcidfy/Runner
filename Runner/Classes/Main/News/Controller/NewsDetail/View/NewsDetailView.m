//
//  NewsDetailView.m
//  Runner
//
//  Created by lxx on 16/7/15.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "NewsDetailView.h"
#import "NewsDetailFrame.h"
@interface NewsDetailView()
//标题 时间 来源
@property(nonatomic,strong)UILabel *titleLable;
@property(nonatomic,strong)UILabel *timeLable;
@property(nonatomic,strong)UILabel *souceLable;
@end
@implementation NewsDetailView
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        XXLog(@"1");
        self.contentInset=UIEdgeInsetsMake(-20, 0, 0, 0);
        [self setAllView];
    }
    return self;
}
-(void)setAllView
{
    _titleLable=[UILabel new];
    _titleLable.font=[UIFont systemFontOfSize:15];
    _titleLable.textColor=[UIColor blackColor];
    _titleLable.numberOfLines=0;
    [self addSubview:_titleLable];
    
    _timeLable=[UILabel new];
    _timeLable.font=[UIFont systemFontOfSize:12];
    _timeLable.textColor=[UIColor grayColor];
    [self addSubview:_timeLable];

    _souceLable=[UILabel new];
    _souceLable.font=[UIFont systemFontOfSize:12];
    _souceLable.textColor=[UIColor grayColor];
    [self addSubview:_souceLable];
}

-(void)setDetailItem:(NewsDetailModel *)detailItem
{
    _detailItem=detailItem;
    XXLog(@"时间是：%@",detailItem.ptime);
XXLog(@"2");
    [self DetailItem];
    [self DetailFrame];
   
}
#pragma mark 赋值
-(void)DetailItem
{
      _titleLable.text=_detailItem.title;
    _timeLable.text=_detailItem.ptime;
    _souceLable.text=_detailItem.source;
}
#pragma mark 布局
-(void)DetailFrame
{
    NewsDetailFrame *detailF=[NewsDetailFrame new];
    detailF.detailList=_detailItem;
    _titleLable.frame=detailF.titleF;
    _timeLable.frame=detailF.timeF;
    _souceLable.frame=detailF.souceF;
}
@end
