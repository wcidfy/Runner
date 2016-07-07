//
//  Messagecell.m
//  Runner
//
//  Created by lxx on 16/7/5.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "Messagecell.h"
#import "UIImageView+WebCache.h"

@interface Messagecell()
@property (strong, nonatomic)  UIImageView *imageV;
@property (strong, nonatomic)  UILabel *titleL;
@property (strong, nonatomic)  UILabel *digestLabel;
@end
@implementation Messagecell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _imageV=[UIImageView new];
        [self.contentView addSubview:_imageV];
        
        _titleL=[UILabel new];
        _titleL.font=[UIFont systemFontOfSize:18];
        [self.contentView addSubview:_titleL];
        
        _digestLabel=[UILabel new];
        _digestLabel.numberOfLines=2;
        _digestLabel.textColor=[UIColor grayColor];
        _digestLabel.font=[UIFont systemFontOfSize:14];
        [self.contentView addSubview:_digestLabel];
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _imageV.frame=CGRectMake(5, 5, 90, 90-10);
    _titleL.frame=CGRectMake(100, 0, kScreenWidth-90-15, 30);
    _digestLabel.frame=CGRectMake(100, 30, kScreenWidth-90-15, 60);

}
- (void)setContItem:(NewsListItems *)contItem
{
    _contItem = contItem;
    
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:contItem.imgsrc] placeholderImage:[UIImage imageNamed:@"newsTitleImage"]];
    
    self.titleL.text = contItem.title;
    self.digestLabel.text = [NSString stringWithFormat:@"%@",contItem.digest];
    
//    [self setupReplyBtn];
}
@end
