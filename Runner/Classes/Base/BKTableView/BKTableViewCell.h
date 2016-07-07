//
//  BKTableViewCell.h
//  HaveFriends
//
//  Created by lxx on 16/6/9.
//  Copyright © 2016年 lxx. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface BKTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *iconView;
@property (nonatomic,strong) UILabel     *titleLabel;

@end

@interface CheckBoxCell : BKTableViewCell

- (void)setCheckBoxSelected:(BOOL)selected;

@end

@interface CustomHeaderFooter : UITableViewHeaderFooterView

@property (nonatomic,strong) UILabel     *titleLabel;

@end
