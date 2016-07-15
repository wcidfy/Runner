//
//  NewsDetailView.m
//  Runner
//
//  Created by lxx on 16/7/15.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "NewsDetailView.h"
#import "NewsDetailFrame.h"
#import "NewsDetailItem.h"
@interface NewsDetailView()
//标题 时间 来源
@property(nonatomic,strong)UILabel *titleLable;
@property(nonatomic,strong)UILabel *timeLable;
@property(nonatomic,strong)UILabel *souceLable;
//图片 图片描述
@property(nonatomic,strong)NSMutableArray <UIImageView *>*imgVs;
@property(nonatomic,strong)NSMutableArray <UILabel *>*altLs;
@property(nonatomic,strong)NSMutableArray <NSValue *>*attrRanges;
@property(nonatomic,strong)UILabel *contentL;

@end
@implementation NewsDetailView
-(NSMutableArray<UIImageView *>*)imgVs
{
    if (_imgVs==nil) {
        _imgVs=[[NSMutableArray alloc]init];
    }
    return _imgVs;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        XXLog(@"1");
        
        [self setAllView];
    }
    return self;
}
-(void)setAllView
{
    _scrollView=[UIScrollView new];
    _scrollView.frame=CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    self.scrollView.scrollEnabled=YES;
    self.scrollView.showsHorizontalScrollIndicator=YES;
    self.scrollView.showsVerticalScrollIndicator=YES;
    [self addSubview:_scrollView];
    
    _titleLable=[UILabel new];
    _titleLable.font=[UIFont systemFontOfSize:15];
    _titleLable.textColor=[UIColor blackColor];
    _titleLable.numberOfLines=0;
    [_scrollView addSubview:_titleLable];
    
    _timeLable=[UILabel new];
    _timeLable.font=[UIFont systemFontOfSize:12];
    _timeLable.textColor=[UIColor grayColor];
    [_scrollView addSubview:_timeLable];

    _souceLable=[UILabel new];
    _souceLable.font=[UIFont systemFontOfSize:12];
    _souceLable.textColor=[UIColor grayColor];
    [_scrollView addSubview:_souceLable];
    
    _contentL=[UILabel new];
    _contentL.font=[UIFont systemFontOfSize:15];
    _contentL.textColor=[UIColor blackColor];
    _contentL.numberOfLines=0;
    [_scrollView addSubview:_contentL];
    
}

-(void)setDetailItem:(NewsDetailModel *)detailItem
{
    _detailItem=[NewsDetailItem itemWithDetailItem:detailItem complete:^(NSMutableArray *array) {
        self.attrRanges=array;
    }];
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
    [self setPics];
     NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:_detailItem.body];
//    for (int i=0; i<self.attrRanges.count; i++) {
//        [attr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:[self.attrRanges[i] rangeValue]];
//        [attr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:[self.attrRanges[i] rangeValue]];
//    }
    _contentL.attributedText=attr;
    XXLog(@"______________________%@",attr);
}
#pragma mark 图片通过NSMutableArray 循环添加图片 并赋值
-(void)setPics
{
    for (int i=0; i<_detailItem.img.count; i++) {
        UIImageView *imgV=[[UIImageView alloc]init];
        [imgV sd_setImageWithURL:[NSURL URLWithString:_detailItem.img[i][@"src"]] placeholderImage:[UIImage imageNamed:@"newsTitleImage"]];
        [self.imgVs addObject:imgV];
        [_scrollView addSubview:imgV];
        
        UILabel *altL=[UILabel new];
        altL.font=[UIFont systemFontOfSize:15];
        altL.textColor=[UIColor blackColor];
        altL.numberOfLines=0;
        [self.altLs addObject:altL];
        [_scrollView addSubview:altL];
    }

}

#pragma mark 布局
-(void)DetailFrame
{
    NewsDetailFrame *detailF=[NewsDetailFrame new];
    detailF.detailList=_detailItem;
    _titleLable.frame=detailF.titleF;
    _timeLable.frame=detailF.timeF;
    _souceLable.frame=detailF.souceF;
    [self setpicFrame:detailF];
    _contentL.frame=detailF.contentF;
    
    _viewHeight=detailF.totalHeight;
}
#pragma mark 图片 和图片描述布局
-(void)setpicFrame:(NewsDetailFrame *)frame
{
    NSInteger index=0;
    for (int i=0; i<_detailItem.img.count; i++) {
        if (_detailItem.img[i][@"pixel"]) {
            CGRect imgF=[frame.pictureFs[index] CGRectValue];
            self.imgVs[i].frame=imgF;
            
            CGRect altF=[frame.altFs[index] CGRectValue];
            self.altLs[i].frame=altF;
            index++;
        }
    }
    
    
}

@end
