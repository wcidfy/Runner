//
//  AVVideoListCell.m
//  Runner
//
//  Created by lxx on 16/7/9.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "AVVideoListCell.h"

@interface AVVideoListCell()
//主题
@property(nonatomic,strong)UILabel *titleLable;

//视屏播放按钮
@property(nonatomic,strong)UIButton *playButton;
//左下角view
@property(nonatomic,strong)UIView *leftV;
@property(nonatomic,strong)UIImageView *leftIma;
@property(nonatomic,strong)UILabel *rightName;

//时间和播放次数
@property(nonatomic,strong)UILabel *timeAndCount;
//视屏评价数
@property(nonatomic,strong)UIButton *messagButton;
//分享button
@property(nonatomic,strong)UIButton *shareButton;


@end
@implementation AVVideoListCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLable=[UILabel new];
        _titleLable.numberOfLines=0;
        _titleLable.font=[UIFont systemFontOfSize:15];
        [self.contentView addSubview:_titleLable];
        
        _imageV=[UIImageView new];
        _imageV.userInteractionEnabled=YES;
        [_imageV addGestureRecognizer: [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(playMovie)]];
//        [_imageV addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(playMovie)]];
        [self.contentView addSubview:_imageV];
        
        _playButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [_playButton setImage:[UIImage imageNamed:@"night_video_cell_play"] forState:UIControlStateNormal];
        [_imageV addSubview:_playButton];
        
        _leftV=[UIView new];
        [self.contentView addSubview:_leftV];
        
        _leftIma=[UIImageView new];
        [_leftV addSubview:_leftIma];
        
        _rightName=[UILabel new];
        _rightName.font=[UIFont systemFontOfSize:14];
        [_leftV addSubview:_rightName];
        
        _timeAndCount=[UILabel new];
        [self.contentView addSubview:_timeAndCount];
        
        _messagButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_messagButton];
        
        _shareButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_shareButton];
        
        UIView *grayView=[UIView new];
        grayView.backgroundColor=[UIColor grayColor];
        grayView.frame=CGRectMake(0, 190, kScreenWidth, 10);
        [self.contentView addSubview:grayView];
        
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
}
-(void)setVideoList:(AVVideoList *)videoList
{
    _videoList=videoList;
     CGSize titleLSize = [_videoList.title boundingRectWithSize:CGSizeMake(kScreenWidth-10*2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    self.titleLable.text=_videoList.title;
    self.titleLable.textColor=[UIColor blackColor];
    self.titleLable.frame=CGRectMake(10, 0, titleLSize.width, titleLSize.height);
    
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:_videoList.cover] placeholderImage:[UIImage imageNamed:@"photosetBackGround"]];
    self.imageV.frame=CGRectMake(10, titleLSize.height, kScreenWidth-10*2, 200-titleLSize.height-50);
    self.playButton.size=CGSizeMake(40, 40);
    self.playButton.center=self.imageV.center;
    [self setBottonView];
}
-(void)setBottonView
{
    self.leftV.frame=CGRectMake(10, 200-50, kScreenWidth-10*2, 40);
 
    [_leftIma sd_setImageWithURL:[NSURL URLWithString:_videoList.topicImg] placeholderImage:[UIImage imageNamed:@"photosetBackGround"]];
    _leftIma.size=CGSizeMake(25, 25);
    _leftIma.y=10;
    _leftIma.x=0;
    _leftIma.layer.masksToBounds=YES;
    _leftIma.layer.cornerRadius=25/2;
    [self.leftV addSubview:_leftIma];
    
   
    _rightName.x=_leftIma.x+25;
    _rightName.y=0;
    _rightName.size=CGSizeMake(100, 40);
    _rightName.text=_videoList.topicName;
    [self.leftV addSubview:_rightName];
    
    _shareButton.frame=CGRectMake(kScreenWidth-35, 200-40, 25, 25);
    [_shareButton addTarget:self action:@selector(shareAction) forControlEvents:UIControlEventTouchUpInside];
    [_shareButton setImage:[UIImage imageNamed:@"icon_share"] forState:UIControlStateNormal];
    
    _messagButton.frame=CGRectMake(_shareButton.x-100, 200-40, 100, 25);
    [_messagButton setImage:[UIImage imageNamed:@"pluginmanager_icon_message"] forState:UIControlStateNormal];
    [_messagButton setTitle:_videoList.replyCount forState:UIControlStateNormal];
    [_messagButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    
}
-(void)shareAction
{
    if (_shareClick!=nil) {
        _shareClick(_videoList);
    }

}
-(void)playMovie
{
    if (_movieBlock!=nil) {
        _movieBlock(_videoList.mp4_url,_imageV);
    }

}
@end
