//
//  BKTableView.m
//  HaveFriends
//
//  Created by lxx on 16/6/9.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "BKTableView.h"
#import "LeftViewController.h"
@interface BKTableView()
@end
@implementation BKTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _dataTableView = [UITableView new];
        _dataTableView.backgroundColor = [UIColor whiteColor];
        self.header=_dataTableView.mj_header;
        [self addSubview:_dataTableView];
        [_dataTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        [self initSetting];
    }
    return self;
}
/**
 *  cell线条从左开始
 */
- (void)initSetting
{
    if ([self.dataTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.dataTableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
    if ([self.dataTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.dataTableView setLayoutMargins:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
}

- (void)setAdapter:(BKTableViewAdapter *)tableViewAdapter
{
    _dataTableView.delegate = tableViewAdapter;
    _dataTableView.dataSource = tableViewAdapter;
}

- (void)refreshTableView
{
    [_dataTableView reloadData];
}
-(void)ScrollBotton:(NSArray *)array
{
    NSIndexPath *lastIndex=[NSIndexPath indexPathForRow:array.count-1 inSection:0];
    [self.dataTableView scrollToRowAtIndexPath:lastIndex atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    

}
-(void)SetSeparatorStyle
{
   self.dataTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
-(void)setHeadView:(UIView *)view
{
    _dataTableView.tableHeaderView=view;
    [_dataTableView setSectionHeaderHeight:view.size.height];

}
-(void)setFootView:(UIView *)view
{
    _dataTableView.tableFooterView=view;
    
    
}
-(void)setRefresh
{
    _dataTableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:nil];
//    [_dataTableView.mj_header beginRefreshing];

}
-(void)endRefresh
{
    [_dataTableView.mj_header endRefreshing];

}
- (void)dealloc
{
    _dataTableView.delegate = nil;
    _dataTableView.dataSource = nil;
    _dataTableView = nil;
    
}

@end
