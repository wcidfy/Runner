//
//  TalkListCell.m
//  Runner
//
//  Created by lxx on 16/7/10.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "TalkListCell.h"
#import "TalkListItem.h"
@interface TalkListCell()

@property(nonatomic,strong)UIImageView *iconV;
@property(nonatomic,strong)UILabel *nameL;
@property(nonatomic,strong)UIImageView *imageV;
@property(nonatomic,strong)UILabel  *deatiL;

@property(nonatomic,strong)UILabel  *messageL;
@property(nonatomic,strong)UIButton *attentionButton;




@end
@implementation TalkListCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      
        
        _iconV=[UIImageView new];
        _iconV.backgroundColor=[UIColor redColor];
         _iconV.frame=CGRectMake(10, 10, 40, 40);
        [self.contentView addSubview:_iconV];
        
        _nameL=[UILabel new];
        [self.contentView addSubview:_nameL];
        
        _imageV=[UIImageView new];
        [self.contentView addSubview:_imageV];
        
        _deatiL=[UILabel new];
        _deatiL.font=[UIFont systemFontOfSize:15];
        _deatiL.numberOfLines=0;
        [self.contentView addSubview:_deatiL];
        
        _messageL=[UILabel new];
        [self.contentView addSubview:_messageL];
        
        _attentionButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [_attentionButton setTitle:@"+关注" forState:UIControlStateNormal];
        [_attentionButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _attentionButton.layer.borderColor=[UIColor grayColor].CGColor;
        _attentionButton.layer.borderWidth=1;
        _attentionButton.layer.masksToBounds=YES;
        _attentionButton.layer.cornerRadius=15;
        [_attentionButton addTarget:self action:@selector(attentionClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_attentionButton];
        
    }
    return self;
}

-(void)setTalkListFrame:(TalkListFrame *)talkListFrame
{
   
    
    _talkListFrame=talkListFrame;
    TalkListItem *listItem=_talkListFrame.listItem;
    
  
    
    
    _iconV.frame=CGRectMake(10, 10, 30, 30);
    _iconV.layer.masksToBounds=YES;
    _iconV.layer.cornerRadius=15;
    [_iconV sd_setImageWithURL:[NSURL URLWithString:listItem.headpicurl] placeholderImage:[UIImage imageNamed:@"photosetBackGround"]];
    _nameL.frame=CGRectMake(_iconV.x+40+10, _iconV.y,  kScreenWidth-60,20);
    _imageV.frame=CGRectMake(0, 30, kScreenWidth, 120);
    [_imageV sd_setImageWithURL:[NSURL URLWithString:listItem.picurl] placeholderImage:[UIImage imageNamed:@"photosetBackGround"]];
    
    [self setTopTitleName];
    CGSize titleLSize = [_talkListFrame.listItem.alias boundingRectWithSize:CGSizeMake(kScreenWidth-10*2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    _deatiL.text=_talkListFrame.listItem.alias;
    _deatiL.frame=CGRectMake(10, _imageV.y+120, titleLSize.width, titleLSize.height);
    _attentionButton.frame=CGRectMake(kScreenWidth-80, _deatiL.y+titleLSize.height, 60, 25);
    
    [self setMessage];
}
#pragma mark 设置顶部name
-(void)setTopTitleName
{
     TalkListItem *listItem=_talkListFrame.listItem;
    NSString *nameStr=[NSString stringWithFormat:@"%@ | %@",listItem.name,listItem.title];
    NSMutableAttributedString *nameAttStr=[[NSMutableAttributedString alloc]initWithString:nameStr];
    [nameAttStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:[nameStr rangeOfString:listItem.name]];
    [nameAttStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11] range:[nameStr rangeOfString:listItem.title]];
    self.nameL.attributedText=nameAttStr;
}

-(void)setMessage
{
     TalkListItem *listItem=_talkListFrame.listItem;
    NSString *attentionStr=[NSString stringWithFormat:@"%d",[listItem.concernCount intValue]];
    if ([listItem.concernCount intValue]>9999) {
        attentionStr=[NSString stringWithFormat:@"%0.1f万",[listItem.concernCount intValue]/10000.0];
    }
    NSString *quesionStr=[NSString stringWithFormat:@"%d",[listItem.questionCount intValue]];
    if([listItem.questionCount intValue]>9999)
    {
        quesionStr=[NSString stringWithFormat:@"%0.1f万",[listItem.questionCount intValue]/10000.0];
    
    }
    NSString *messageStr=[NSString stringWithFormat:@"%@  %@ 关注 %@ 提问",listItem.classification,attentionStr,quesionStr];
    NSMutableAttributedString *messageAttenStr=[[NSMutableAttributedString alloc]initWithString:messageStr];
    [messageAttenStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:[messageStr rangeOfString:listItem.classification]];
    self.messageL.font=[UIFont systemFontOfSize:11];
    self.messageL.textColor=[UIColor blackColor];
    self.messageL.attributedText=messageAttenStr;
    self.messageL.frame=CGRectMake(10, _talkListFrame.cellHeight-20, kScreenWidth-100, 10);

}
-(void)attentionClick
{
    if (_buttonClick) {
        _buttonClick(_talkListFrame.listItem);
    }

}
@end
