//
//  ThreeViewCell.m
//  Runner
//
//  Created by lxx on 16/7/5.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "ThreeViewCell.h"
#import "UIImageView+WebCache.h"

@interface ThreeViewCell()
@property (strong, nonatomic)  UIImageView *imageV1;
@property (strong, nonatomic)  UIImageView *imageV2;
@property (strong, nonatomic)  UIImageView *imageV3;
@property (strong, nonatomic)  UILabel *titleLabel;
@end
@implementation ThreeViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLabel=[UILabel new];
        [self.contentView addSubview:_titleLabel];
        
        _imageV1=[UIImageView new];
        [self addSubview:_imageV1];
        
        _imageV2=[UIImageView new];
        [self addSubview:_imageV2];
        
        _imageV3=[UIImageView new];
        [self addSubview:_imageV3];
    }
    return self;
}
- (void)setContItem:(NewsListItems *)contItem
{
    _contItem = contItem;
    
    [self.imageV1 sd_setImageWithURL:[NSURL URLWithString:contItem.imgsrc] placeholderImage:[UIImage imageNamed:@"newsTitleImage"]];
    
    [self.imageV2 sd_setImageWithURL:[NSURL URLWithString:contItem.imgextra[0][@"imgsrc"]] placeholderImage:[UIImage imageNamed:@"newsTitleImage"]];
    
    [self.imageV3 sd_setImageWithURL:[NSURL URLWithString:contItem.imgextra[1][@"imgsrc"]] placeholderImage:[UIImage imageNamed:@"newsTitleImage"]];
    
    self.titleLabel.text = contItem.title;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat W= (kScreenWidth-20)/3;
    _titleLabel.frame=CGRectMake(5, 0, kScreenWidth, 30);
    _imageV1.frame=CGRectMake(5, 30, W, 90);
    _imageV2.frame=CGRectMake(W+5*2, 30, W, 90);
     _imageV3.frame=CGRectMake(W*2+5*3, 30, W, 90);

}
@end
