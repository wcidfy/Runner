//
//  TalkDetailCell.m
//  Runner
//
//  Created by lxx on 16/7/11.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "TalkDetailCell.h"
@interface TalkDetailCell()
{
    UIView *lineV;

}
//提问视图
@property(nonatomic,strong)UIImageView *askImageV;
@property(nonatomic,strong)UILabel *askNameL;
@property(nonatomic,strong)UILabel *askContentL;
@property(nonatomic,strong)UIView *lineView;

//回答视图
@property(nonatomic,strong)UIImageView *answerImageV;
@property(nonatomic,strong)UILabel *answerNameL;
@property(nonatomic,strong)UILabel *answerContentL;
@property(nonatomic,strong)UILabel *answerTime;
@property(nonatomic,strong)UIButton *messageButton;
@property(nonatomic,strong)UIButton *shareButton;






@end
@implementation TalkDetailCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self= [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _askImageV=[UIImageView new];
        _askImageV.frame=CGRectMake(10, 20, 30, 30);
        _askImageV.layer.masksToBounds=YES;
        _askImageV.layer.cornerRadius=15;
        [self.contentView addSubview:_askImageV];
        
        _askNameL=[UILabel new];
        _askNameL.textColor=[UIColor grayColor];
        _askNameL.font=[UIFont systemFontOfSize:10];
        _askNameL.frame=CGRectMake(50, 10, kScreenWidth-50, 30);
        [self.contentView addSubview:_askNameL];
        
        _askContentL=[UILabel new];
        _askContentL.textColor=[UIColor grayColor];
        _askContentL.font=[UIFont systemFontOfSize:14];
        _askContentL.numberOfLines=0;
        [self.contentView addSubview:_askContentL];
        
        lineV=[UIView new];
        lineV.backgroundColor=[UIColor lightGrayColor];
        [self.contentView addSubview:lineV];
        
        
        _answerImageV=[UIImageView new];
       
        _answerImageV.layer.masksToBounds=YES;
        _answerImageV.layer.cornerRadius=15;
        [self.contentView addSubview:_answerImageV];
        
        _answerNameL=[UILabel new];
        _answerNameL.textColor=[UIColor grayColor];
        _answerNameL.font=[UIFont systemFontOfSize:11];
        [self.contentView addSubview:_answerNameL];
        
        _answerContentL=[UILabel new];
        _answerContentL.font=[UIFont systemFontOfSize:14];
        _answerContentL.numberOfLines=0;
        [self.contentView addSubview:_answerContentL];
    }
    return self;
}
-(void)setAskAnswer:(AskAndAnswer *)askAnswer
{
    _askAnswer=askAnswer;
    TalkAskDetail *askList=askAnswer.askTalk;
    [_askImageV sd_setImageWithURL:[NSURL URLWithString:askList.userHeadPicUrl] placeholderImage:[UIImage imageNamed:@"newsTitleImage"]];
    _askNameL.text=askList.userName;
    CGFloat askContentH=[askList.content boundingRectWithSize:CGSizeMake(kScreenWidth-60, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.height;
    _askContentL.text=askList.content;
    _askContentL.frame=CGRectMake(50, _askImageV.y+30, kScreenWidth-60, askContentH);
   
     lineV.frame=CGRectMake(50, _askContentL.y+askContentH+10, kScreenWidth-50, 1);

    
    TalkAnswerDetail *answerList=_askAnswer.answerTalk;
    [_answerImageV sd_setImageWithURL:[NSURL URLWithString:answerList.specialistHeadPicUrl] placeholderImage:[UIImage imageNamed:@"newsTitleImage"]];
     _answerImageV.frame=CGRectMake(10, lineV.y+1, 30, 30);
    _answerNameL .text=answerList.specialistName;
    _answerNameL.frame=CGRectMake(50, lineV.y+1, kScreenWidth-50, 30);
    CGFloat answerContentH=[answerList.content boundingRectWithSize:CGSizeMake(kScreenWidth-50, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.height;
    _answerContentL.text=answerList.content;
    _answerContentL.frame=CGRectMake(50, _answerImageV.y+30, kScreenWidth-50, answerContentH);
    

}
+(CGFloat)cellHeightWithItem:(AskAndAnswer *)listitem
{
    TalkAskDetail *askList=listitem.askTalk;
     CGFloat askContentH=[askList.content boundingRectWithSize:CGSizeMake(kScreenWidth-60, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.height;
    CGFloat askheight=50+11+askContentH;
    
    
    TalkAnswerDetail *answerList=listitem.answerTalk;
    CGFloat answerContentH=[answerList.content boundingRectWithSize:CGSizeMake(kScreenWidth-60, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.height;
    CGFloat answerHeight=50+10+answerContentH;
    return askheight+answerHeight;

}
@end
