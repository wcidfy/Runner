//
//  RelatedNewsView.m
//  Runner
//
//  Created by lxx on 16/7/20.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "RelatedNewsView.h"
#import "RelatedNewsList.h"
@interface RelatedNewsView()
// 头像 标题 来源 时间
@property(nonatomic,strong)UILabel *whileL;
@property(nonatomic,strong)UIImageView *iconV;
@property(nonatomic,strong)UILabel *titleL;
@property(nonatomic,strong)UILabel *souceL;
@property(nonatomic,strong)UILabel *timeL;

@property(nonatomic,strong)RelatedNewsList *relatedItem;
@end
@implementation RelatedNewsView
+(CGFloat)heightWithDetailItem:(NewsDetailModel *)detailList
{
    RelatedNewsView *view=[RelatedNewsView new];
    view.detailList=detailList;
    return view.viewHeight;
    
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self setAllView];
    }
    return self;
}
#pragma mark 控件初始化
-(void)setAllView
{
    _whileL =[UILabel new];
    _whileL.textColor=[UIColor redColor];
    _whileL.layer.borderColor=[UIColor grayColor].CGColor;
    _whileL.layer.borderWidth=1;
    [self addSubview:_whileL];
    
    _iconV=[UIImageView new];
    [self addSubview:_iconV];
    
    _titleL=[UILabel new];
    _titleL.font=[UIFont systemFontOfSize:15];
    _titleL.textColor=[UIColor blackColor];
    _titleL.numberOfLines=0;
    [self addSubview:_titleL];
    
    _souceL=[UILabel new];
    _souceL.font=[UIFont systemFontOfSize:12];
    _souceL.textColor=[UIColor grayColor];
    [self addSubview:_souceL];
    
    _timeL=[UILabel new];
    _timeL.font=[UIFont systemFontOfSize:12];
    _timeL.textColor=[UIColor grayColor];
    [self addSubview:_timeL];

}
-(void)setDetailList:(NewsDetailModel *)detailList
{

    _detailList=detailList;
    _relatedItem=[RelatedNewsList mj_objectWithKeyValues:_detailList.relative_sys[0]];
    [self setAllView];
    [self setDetail];
    [self setFrame];
}
#pragma mark 赋值
-(void)setDetail
{
    [_iconV sd_setImageWithURL:[NSURL URLWithString:_relatedItem.imgsrc] placeholderImage:[UIImage imageNamed:@"newsTitleImage"]];
    _titleL.text=_relatedItem.title;
    _souceL.text=_relatedItem.source;
    _timeL.text=_relatedItem.ptime;
    
}
#pragma mark 布局
-(void)setFrame
{
//    _iconV.frame
    _whileL.frame=CGRectMake(0, 0, kScreenWidth-20, 20);
    CGFloat iconX=10;
    CGFloat iconY=30;
    CGFloat iconW=50;
    CGFloat iconH=50;
    _iconV.frame=CGRectMake(iconX,iconY,iconW,iconH);
    XXLog(@"%@",_detailList);
    
    CGFloat titleX=50+20;
    CGFloat titleY=30;
    CGSize titleSize=[_relatedItem.title boundingRectWithSize:CGSizeMake(kScreenWidth-90, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    _titleL.frame=(CGRect){titleX, titleY, titleSize};
    
    CGFloat souceX=titleX;
    CGFloat souceY=titleY+titleSize.height+10;
    CGSize  souceSize=[_relatedItem.source sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    _souceL.frame=(CGRect){souceX,souceY,souceSize};
    
    CGFloat timeX=souceX+souceSize.width+10;
    CGFloat timeY=souceY;
    CGSize  timeSize=[_relatedItem.ptime sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    _timeL.frame=(CGRect){timeX,timeY,timeSize};
    if (30+timeSize.height+souceSize.height+30>90)
    {
        _viewHeight=30+timeSize.height+souceSize.height+30;
    }
    else
        {
        _viewHeight=30+50+10;}
        }
@end
