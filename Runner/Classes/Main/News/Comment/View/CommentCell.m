//
//  CommentCell.m
//  Runner
//
//  Created by lxx on 16/7/19.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "CommentCell.h"
@interface CommentCell()
// 头像 昵称 来源 时间 内容 右边lable
@property(nonatomic,strong)UIImageView *iconV;
@property(nonatomic,strong)UILabel *titleL;
@property(nonatomic,strong)UILabel *souceL;
@property(nonatomic,strong)UILabel *timeL;
@property(nonatomic,strong)UILabel *contentL;
@property(nonatomic,strong)UILabel *rightL;
@end
@implementation CommentCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setAllView];
    }

    return self;
}
+(CGFloat)heightWithItemList:(NewsHotReplyItems *)itemList
{
    CommentCell *cell=[[CommentCell alloc]init];
    cell.itemList=itemList;
    [cell setFrame];
    return cell.cellHeight;
    
}
#pragma mark 控件初始化
-(void)setAllView
{
    _iconV=[UIImageView new];
    _iconV.layer.masksToBounds=YES;
    _iconV.layer.cornerRadius=25/2;
    [self addSubview:_iconV];
    
    _titleL=[UILabel new];
    _titleL.font=[UIFont systemFontOfSize:14];
    _titleL.textColor= [UIColor blueColor];
    [self addSubview:_titleL];
    
    _souceL=[UILabel new];
    _souceL.font=[UIFont systemFontOfSize:12];
    _souceL.textColor= [UIColor grayColor];
    [self addSubview:_souceL];
    
    _timeL=[UILabel new];
    _timeL.font=[UIFont systemFontOfSize:12];
    _timeL.textColor= [UIColor grayColor];
    [self addSubview:_timeL];
    
    _contentL=[UILabel new];
    _contentL.font=[UIFont systemFontOfSize:15];
    _contentL.textColor= [UIColor blackColor];
    _contentL.numberOfLines=0;
    [self addSubview:_contentL];
    
    _rightL=[UILabel new];
    _rightL.font=[UIFont systemFontOfSize:15];
    _rightL.textColor= [UIColor grayColor];
    [self addSubview:_rightL];


}
-(void)setItemList:(NewsHotReplyItems *)itemList
{
    _itemList=itemList;
    [self SetSouceDate];
    [self setFrame];

}
#pragma mark 赋值
-(void)SetSouceDate
{
    [_iconV sd_setImageWithURL:[NSURL URLWithString:_itemList.timg] placeholderImage:[UIImage imageNamed:@"tabbar_icon_me_normal"]];
    _titleL.text=_itemList.n;
    
    _itemList.f=[_itemList.f stringByReplacingOccurrencesOfString:@"网易" withString:@""];
    if([_itemList.f containsString:@"市"])
    {
        NSInteger loc=[_itemList.f rangeOfString:@"市"].location;
        _itemList.f=[_itemList.f substringToIndex:loc+1];
    
    }else if([_itemList.f containsString:@"省"])
    {
        NSInteger loc=[_itemList.f rangeOfString:@"省"].location;
        _itemList.f=[_itemList.f substringToIndex:loc+1];
    
    }
    _souceL.text=_itemList.f;
    _contentL.text=_itemList.b;
}
-(void)setFrame
{
    CGFloat iconX=10;
    CGFloat iconY=10;
    CGFloat iconW=25;
    CGFloat iconH=25;
    _iconV.frame=(CGRect){iconX,iconY,iconW,iconH};
    
    CGSize  titleSize=[_itemList.t sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    CGFloat titleX=iconX+iconW+10;
    CGFloat titleY=iconY;
    _titleL.frame=(CGRect){titleX,titleY,titleSize};
    
    CGFloat souceX=titleX;
    CGFloat souceY=titleY+titleSize.height;
    CGSize souceSize=[_itemList.f sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    
    _souceL.frame=(CGRect){souceX,souceY,souceSize};
    
    CGFloat contentX=titleX;
    CGFloat contentY=souceY+souceSize.height;
    CGSize  contentSize=[_itemList.b boundingRectWithSize:CGSizeMake(kScreenWidth-55, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    _contentL.frame=(CGRect){contentX,contentY,contentSize};
    _cellHeight=titleSize.height+souceSize.height+contentSize.height+10*2;
}
@end
