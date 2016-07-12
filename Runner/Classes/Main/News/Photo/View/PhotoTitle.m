//
//  PhotoTitle.m
//  Runner
//
//  Created by lxx on 16/7/12.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "PhotoTitle.h"
@interface PhotoTitle()
@property(nonatomic,strong)UILabel *detaLable;
@end
@implementation PhotoTitle

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        _detaLable=[UILabel new];
        
        _detaLable.font=[UIFont systemFontOfSize:15];
        _detaLable.textColor=[UIColor redColor];
        _detaLable.numberOfLines=0;
        [self addSubview:_detaLable];
        _pageCountL=[UILabel new];
        _pageCountL.textColor=[UIColor redColor];
        _pageCountL.font=[UIFont systemFontOfSize:15];
       
        [self addSubview:_pageCountL];
    }

    return self;

}
-(void)setPhotoItem:(NewsPhotoModel *)photoItem
{
   
        self.detaLable.text = photoItem.note;
      

    }
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGSize detalSize=[self.detaLable.text boundingRectWithSize:CGSizeMake(kScreenWidth-20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    self.detaLable.frame=CGRectMake(10, 0, detalSize.width, detalSize.height);
    self.pageCountL.frame=CGRectMake(kScreenWidth-60, detalSize.height, 60, 10);
}
+(CGFloat)heightWithPhoto:(NewsPhotoModel *)photoSet
{

    CGFloat maxHeight = 0;
  
        NSString *contentStr;
                   contentStr = photoSet.note;
        CGFloat height = [contentStr boundingRectWithSize:CGSizeMake(kScreenWidth-20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height;
        maxHeight=height+20+10;
    
    
    
    
    return maxHeight;


}
@end
