//
//  BKTableViewCell.m
//  HaveFriends
//
//  Created by lxx on 16/6/9.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "BKTableViewCell.h"

@implementation BKTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.iconView = [UIImageView new];
        [self.contentView addSubview:_iconView];
        
        self.titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:kSizeFrom720(30)];
        _titleLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_titleLabel];
        
        [self makeConstraints];
    }
    return self;
}

- (void)makeConstraints {
    [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.right.equalTo(self).offset(-kSizeFrom720(65));
    }];
    
    [_titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kSizeFrom720(30));
        make.centerY.equalTo(self.contentView);
    }];
}

@end

@implementation CheckBoxCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.iconView.image = [UIImage imageNamed:@"icon_checkbox_uncheck"];
    }
    return self;
}

- (void)updateConstraints {
    [super updateConstraints];
    [self.iconView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(kSizeFrom720(38), kSizeFrom720(38)));
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(kSizeFrom720(30));
    }];
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView.right).offset(kSizeFrom720(20));
        make.centerY.equalTo(self.iconView);
    }];
}

- (void)setCheckBoxSelected:(BOOL)selected {
    self.iconView.image = selected?[UIImage imageNamed:@"icon_checkbox_checked"]:[UIImage imageNamed:@"icon_checkbox_uncheck"];
    [self updateConstraintsIfNeeded];
}

@end

@implementation CustomHeaderFooter

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:kSizeFrom720(26)];
        _titleLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_titleLabel];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(kSizeFrom720(30));
            make.height.centerY.equalTo(self.contentView);
        }];
    }
    return self;
}

@end
