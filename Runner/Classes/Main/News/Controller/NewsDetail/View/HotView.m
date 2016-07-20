//
//  HotView.m
//  Runner
//
//  Created by lxx on 16/7/18.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "HotView.h"
@interface HotView()
//头像 昵称 来源 时间 内容
@property(nonatomic,strong)UIImageView *iconimgV;
@property(nonatomic,strong)UILabel *nameL;
@property(nonatomic,strong)UILabel *souceL;
@property(nonatomic,strong)UILabel *timeL;
@property(nonatomic,strong)UILabel *contentL;




@end
#define leftBorder5 5
#define leftBorder3 3
@implementation HotView
+(instancetype)HotViewWithNewsHotReplyItems:(NewsHotReplyItems *)item
{

    return [[HotView alloc]initWithItem:item];
}
-(instancetype)initWithItem:(NewsHotReplyItems *)hotItem
{
    self=[super init];
    if (self) {
        _hotList=hotItem;
        [self setAllView];
        [self HotList];
        [self hotFrame];
    }
    return self;
}
#pragma mark 添加子控件
-(void)setAllView
{
    _iconimgV=[UIImageView new];
    _iconimgV.layer.masksToBounds=YES;
    _iconimgV.layer.cornerRadius=25/2;
    _iconimgV.layer.borderWidth=1;
    _iconimgV.layer.borderColor=[UIColor redColor].CGColor;
    [self addSubview:_iconimgV];
    
    _nameL=[UILabel new];
    _nameL.font=[UIFont systemFontOfSize:15];
    _nameL.numberOfLines=0;
    _nameL.textColor=[UIColor blueColor];
    [self addSubview:_nameL];
    
    _souceL=[UILabel new];
    _souceL.font=[UIFont systemFontOfSize:12];
    _souceL.textColor=[UIColor grayColor];
    [self addSubview:_souceL];
    
    _timeL=[UILabel new];
    _timeL.font=[UIFont systemFontOfSize:12];
    _timeL.textColor=[UIColor grayColor];
    [self addSubview:_timeL];
    
    _contentL=[UILabel new];
    _contentL.textColor=[UIColor blackColor];
    _contentL.font=[UIFont systemFontOfSize:15];
    _contentL.numberOfLines=0;
    [self addSubview:_contentL];
    

}

#pragma mark 赋值
-(void)HotList
{
    [_iconimgV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_hotList.timg]] placeholderImage:[UIImage imageNamed:@"newsTitleImage"]];
    _nameL.text=_hotList.n;
   _hotList.f= [_hotList.f stringByReplacingOccurrencesOfString:@"网易" withString:@""];
    if([_hotList.f containsString:@"市"])
    {
        NSInteger loc=[_hotList.f rangeOfString:@"市"].location;
        _hotList.f=[_hotList.f substringToIndex:loc+1];
    }

     else if ([_hotList.f containsString:@"省"]) {
        NSInteger loc=[_hotList.f rangeOfString:@"省"].location;
        _hotList.f=[_hotList.f substringToIndex:loc+1];
     }else
     {
         _hotList.f=[_hotList.f substringToIndex:2];
     }
    
    _souceL.text=_hotList.f;
    _timeL.text=_hotList.t;
    _contentL.text=_hotList.b;
}
#pragma mark 布局
-(void)hotFrame
{
    CGFloat iconX=10;
    CGFloat iconY=10;
    CGFloat iconW=25;
    CGFloat iconH=25;
    _iconimgV.frame=CGRectMake(iconX, iconY, iconW, iconH);
    
    CGFloat nameX=iconX+iconW+leftBorder5;
    CGFloat nameY=iconY;
    CGSize nameSize=[_hotList.n sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    _nameL.frame=(CGRect){nameX, nameY,nameSize};
    
    CGFloat souceX=nameX;
    CGFloat souceY=iconY+iconH+leftBorder3;
    CGSize  souceSize=[_hotList.f sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    _souceL.frame=(CGRect){souceX,souceY,souceSize};
    
    CGFloat timeX=souceX+souceSize.width+leftBorder5;
    CGFloat timeY=souceY;
    CGSize timeSize=[_hotList.t sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    _timeL.frame=(CGRect){timeX,timeY,timeSize};
    
    CGFloat contentX=nameX;
    CGFloat contentY=souceY+souceSize.height;
    CGSize  contentSize=[_hotList.b boundingRectWithSize:CGSizeMake(kScreenWidth-70, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    _contentL.frame=(CGRect){contentX,contentY,contentSize};
    
    _hotHeight=iconY+iconH+souceSize.height+contentSize.height+leftBorder5+leftBorder3;

}
@end
