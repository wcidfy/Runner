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
#import "HotsView.h"
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
//责任编辑
@property(nonatomic,strong)UILabel *ecL;
//评论
@property(nonatomic,strong)HotsView *hotsView;
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
#pragma mark 添加子控件
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
    
    _ecL=[UILabel new];
    _ecL.font=[UIFont systemFontOfSize:15];
    _ecL.textColor=[UIColor blackColor];
    [_scrollView addSubview:_ecL];
    
    _shareView=[UIView new];
    [_scrollView addSubview:_shareView];
    
    _sinaButton=[ShareBut buttonWithType:UIButtonTypeCustom];
    [_sinaButton setImage:[UIImage imageNamed:@"share_platform_sina"] forState:UIControlStateNormal];
    [_sinaButton setTitle:@"新浪" forState:UIControlStateNormal];
    [_sinaButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    _sinaButton.frame=CGRectMake(0, 0, kScreenWidth/3, 80);
    [_shareView addSubview:_sinaButton];
    
    _wxButton=[ShareBut buttonWithType:UIButtonTypeCustom];
    [_wxButton setImage:[UIImage imageNamed:@"share_platform_wechattimeline"] forState:UIControlStateNormal];
    [_wxButton setTitle:@"微信" forState:UIControlStateNormal];
    [_wxButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    _wxButton.frame=CGRectMake(kScreenWidth/3, 0, kScreenWidth/3, 80);
    [_shareView addSubview:_wxButton];
    
    _qqButton=[ShareBut buttonWithType:UIButtonTypeCustom];
    [_qqButton setImage:[UIImage imageNamed:@"share_platform_qzone"] forState:UIControlStateNormal];
    [_qqButton setTitle:@"扣扣" forState:UIControlStateNormal];
    [_qqButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _qqButton.frame=CGRectMake(kScreenWidth/3*2, 0, kScreenWidth/3, 80);
    [_shareView addSubview:_qqButton];
    
    _hotsView=[HotsView new];
    _hotsView.layer.borderWidth=1;
    _hotsView.layer.borderColor=[UIColor grayColor].CGColor;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchClick)];
    [_hotsView addGestureRecognizer:tap];
    [_scrollView addSubview:_hotsView];
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

    _contentL.attributedText=attr;
    _ecL.text=_detailItem.ec;
    XXLog(@"______________________%@",attr);
    
    
        self.hotsView.hotArray=_detailItem.replys;
   
   
//    if (_detailItem.relative_sys.count!=0) {
//       
//    }
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
    _ecL.frame=detailF.ecF;
    
    _shareView.frame=detailF.shareF;
    _hotsView.frame=detailF.replyF;
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
-(void)touchClick
{
    if (self.hotBlock) {
        self.hotBlock();
    }

}
@end
