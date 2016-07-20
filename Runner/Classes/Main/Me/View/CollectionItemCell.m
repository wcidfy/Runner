//
//  CollectionItemCell.m
//  Runner
//
//  Created by lxx on 16/7/20.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "CollectionItemCell.h"
@interface CollectionItemCell()
@property(nonatomic,strong)UIImageView *iconV;
@property(nonatomic,strong)UILabel *titleL;

@end
@implementation CollectionItemCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        _iconV=[UIImageView new];
        _iconV.contentMode=UIViewContentModeScaleAspectFit;
        [self addSubview:_iconV];
        
        _titleL=[UILabel new];
        _titleL.font=[UIFont systemFontOfSize:10];
        _titleL.textAlignment=NSTextAlignmentCenter;
        [self addSubview:_titleL];
    }
    return self;
}
-(void)setItemList:(ItemsModel *)itemList
{
    _itemList=itemList;
    CGFloat itemW=(kScreenWidth-20*5)/4;
    [_iconV sd_setImageWithURL:[NSURL URLWithString:_itemList.icon]];
    _titleL.text=_itemList.name;
    
    _iconV.frame=CGRectMake(0, 0, itemW, self.size.height*0.7);
    _titleL.frame=CGRectMake(0, self.size.height*0.7, itemW, self.size.height*0.3);
}
@end
