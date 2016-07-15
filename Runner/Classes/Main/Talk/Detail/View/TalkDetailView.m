//
//  TalkDetailView.m
//  Runner
//
//  Created by lxx on 16/7/11.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "TalkDetailView.h"
@interface TalkDetailView()

@end
@implementation TalkDetailView
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        _topView=[[UIView alloc]initWithFrame:CGRectMake(0, 10, kScreenWidth, 44)];
        [self addSubview:_topView];
        
        _leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _leftBtn.frame=CGRectMake(10, 10, 20, 20);
        [_leftBtn setImage:[UIImage imageNamed:@"navigationbar_back"] forState:UIControlStateNormal];
        [_topView addSubview:_leftBtn];
        
        _titleLable=[UILabel new];
        _titleLable.frame=CGRectMake(40, 10, kScreenWidth-80, 20);
        _titleLable.font=[UIFont systemFontOfSize:15];
        [_topView addSubview:_titleLable];
        
        _rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.frame=CGRectMake(kScreenWidth-30, 10, 20, 20);
        [_rightBtn setImage:[UIImage imageNamed:@"icon_share"] forState:UIControlStateNormal];
        [_topView addSubview:_rightBtn];
        
        _line =[UIView new];
        _line.frame=CGRectMake(0, 43, kScreenWidth, 1);
        _line.backgroundColor=[UIColor lightGrayColor];
        [_topView addSubview:_line];
        
        _headBgV=[UIImageView new];
        _headBgV.frame=CGRectMake(0, 0, kScreenWidth, 200);
        [self addSubview:_headBgV];
        [self sendSubviewToBack:_headBgV];
        
        _imageBottonView=[UIView new];
        _imageBottonView.frame=CGRectMake(0, 64, kScreenWidth, 136);
        [_headBgV addSubview:_imageBottonView];
        
        _lableTop=[UILabel new];
        _lableTop.numberOfLines=0;
        _lableTop.textAlignment=NSTextAlignmentCenter;
        _lableTop.font=[UIFont systemFontOfSize:15];
        [_imageBottonView addSubview:_lableTop];
        
        
        _lableBotton=[UILabel new];
        _lableBotton.textAlignment=NSTextAlignmentCenter;
        _lableBotton.font=[UIFont systemFontOfSize:15];
        [_imageBottonView addSubview:_lableBotton];
        
        _attentionButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [_attentionButton setTitle:@"+关注" forState:UIControlStateNormal];
        [_attentionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _attentionButton.backgroundColor=[UIColor redColor];
        _attentionButton.frame=CGRectMake(kScreenWidth/2-30, 136-50, 60, 20);
        _attentionButton.layer.masksToBounds=YES;
        _attentionButton.layer.cornerRadius=10;
        _attentionButton.titleLabel.font=[UIFont systemFontOfSize:15];
        [_imageBottonView addSubview:_attentionButton];
        
        _tableView=[UITableView new];
        _tableView.frame=CGRectMake(0, 64, kScreenWidth, kScreenHeight-64);
        _tableView.contentInset=UIEdgeInsetsMake(136, 0, 0, 0);
        _tableView.backgroundColor=[UIColor clearColor];
        [self addSubview:_tableView];
        [self bringSubviewToFront:_tableView];
        
    }


    return self;
}
-(void)setImageBottonWith:(TalkListItem *)listItem
{
//     _lableTop.frame=CGRectMake(40, 10, kScreenWidth-80, 50);
  
    CGFloat topH=[listItem.alias boundingRectWithSize:CGSizeMake(kScreenWidth-80, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height;
   _lableTop.text=listItem.alias;
   _lableTop.frame=CGRectMake(40, 0, kScreenWidth-80, topH);
    
    
    NSString *bottonStr=[NSString stringWithFormat:@"%@",listItem.concernCount];
    if ([listItem.concernCount integerValue]>9999) {
        bottonStr=[NSString stringWithFormat:@"%0.1f万",[listItem.concernCount integerValue]/10000.0];
    }
    _lableBotton.text=[NSString stringWithFormat:@"__ %@ 关注 __",bottonStr];
    _lableBotton.frame=CGRectMake(40, _lableTop.y+topH, kScreenWidth-80,20);
  }
@end
