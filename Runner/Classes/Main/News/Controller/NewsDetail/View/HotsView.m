//
//  HotsView.m
//  Runner
//
//  Created by lxx on 16/7/18.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "HotsView.h"
#import "HotView.h"
@interface HotsView()
//热门评论
@property(nonatomic,strong)UILabel *hotL;
@property(nonatomic,strong)UILabel *moreL;
@end
@implementation HotsView
+(CGFloat)HeightWithHotsArray:(NSArray *)hotsArray
{
    HotsView *view=[[HotsView alloc]init];
    [view setHotArray:hotsArray];
    return view.hotsHeight;
}

-(void)setHotArray:(NSArray *)hotArray
{
   
   
    if (hotArray==nil)
        return;
     _hotArray=hotArray;
   
    
    
    if (hotArray.count==0) return;
    //头部热门评论
    _hotL=[UILabel new];
    _hotL.frame=CGRectMake(0, 0, kScreenWidth-10*2, 30);
    _hotL.text=@" 热门评论";
    _hotL.textColor=[UIColor redColor];
    _hotL.layer.borderColor=[UIColor grayColor].CGColor;
    _hotL.layer.borderWidth=1;
    [self addSubview:_hotL];
    
   
    
    NewsHotReplyItems *item=hotArray[0][0];
    HotView *hot1=[HotView HotViewWithNewsHotReplyItems:item];
    hot1.frame=CGRectMake(0, 30, kScreenWidth, hot1.hotHeight);
    [self addSubview:hot1];
    self.hotsHeight=hot1.size.height+30;
    if (hotArray.count==1) return;
    NewsHotReplyItems *item2=hotArray[1][0];
    HotView *hot2=[HotView HotViewWithNewsHotReplyItems:item2];
    hot2.frame=CGRectMake(0, 30+hot1.size.height, kScreenWidth, hot2.hotHeight);
    [self addSubview:hot2];
    self.hotsHeight=hot1.size.height+30+hot2.size.height;
    if (hotArray.count==2) return;
    NewsHotReplyItems *item3=hotArray[2][0];
    HotView *hot3=[HotView HotViewWithNewsHotReplyItems:item3];
    hot3.frame=CGRectMake(0, 30+hot1.size.height+hot2.size.height, kScreenWidth, hot3.hotHeight);
    [self addSubview:hot3];
    
     _moreL=[UILabel new];
    CGFloat moreY=30+hot1.hotHeight+hot2.hotHeight+hot3.hotHeight;
    _moreL.layer.borderWidth=1;
    _moreL.layer.borderColor=[UIColor grayColor].CGColor;
    _moreL.frame=CGRectMake(0,moreY , kScreenWidth-20, 40);
     _moreL.text=@"查看更多跟帖";
    _moreL.font=[UIFont systemFontOfSize:15];
    _moreL.textColor=[UIColor blueColor];
    _moreL.textAlignment=NSTextAlignmentCenter;
    [self addSubview:_moreL];
    self.hotsHeight=hot1.size.height+hot2.size.height+hot3.size.height+30+40;
}

@end
