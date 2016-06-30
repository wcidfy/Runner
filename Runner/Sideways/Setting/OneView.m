//
//  OneView.m
//  Runner
//
//  Created by lxx on 16/6/28.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "OneView.h"
@interface OneView()
{
     UIView *_headerView;
     UIImageView *_defaultImage;
}

@end

@implementation OneView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
       
        _headerView = [[UIView alloc]init];
        _headerView.backgroundColor = [UIColor whiteColor];
        self.dataTableView.tableHeaderView = _headerView;
       
         self.dataTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _defaultImage = [UIImageView new];
        _defaultImage.image = [UIImage imageNamed:@"image_normal"];
        [_defaultImage setContentMode:UIViewContentModeScaleAspectFit];
        [_headerView addSubview:_defaultImage];
        
        _topScrollView = [[JCTopic alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
        _topScrollView.backgroundColor = [UIColor clearColor];
        [_headerView addSubview:_topScrollView];
        
        _pangeControl = [UIPageControl new];
        _pangeControl.enabled = NO;
        [_headerView addSubview:_pangeControl];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _headerView.frame=CGRectMake(0, 0, ViewWidth, ViewHeight);
    [_defaultImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.width.centerX.equalTo(_headerView);
        make.height.equalTo(200);
    }];
    
  
    
    [_pangeControl makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_topScrollView).offset(kSizeFrom720(10));
        make.centerX.equalTo(_topScrollView);
    }];

}
- (void)setCarousel:(NSMutableArray *)array {
    if ([array count] > 0) {
        _pangeControl.numberOfPages = [array count];
        [_topScrollView setPics:array];
        [_topScrollView upDate];
        [_defaultImage setHidden:YES];
    } else {
        [_topScrollView setHidden:YES];
        [_defaultImage setHidden:NO];
    }
}

@end
