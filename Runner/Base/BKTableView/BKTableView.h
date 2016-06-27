//
//  BKTableView.h
//  HaveFriends
//
//  Created by lxx on 16/6/9.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BKTableViewAdapter.h"
#import "MJRefreshHeader.h"


/**
 *  包装tableview，将datasource和delegate封装到adapter中
 *  将生成cell的逻辑拆分到adapter中，明确逻辑内容，减少文件中的代码长度
 */
@interface BKTableView : UIView

@property (nonatomic, strong, readonly) UITableView *dataTableView;
@property (nonatomic, strong) MJRefreshHeader *header;

- (void)setAdapter:(BKTableViewAdapter *)tableViewAdapter;
/**
 *  刷新 tableview
 */
- (void)refreshTableView;
/**
 *
 *
 *  tableview 滚动到底部
 */
-(void)ScrollBotton:(NSArray *)array;
/**
 *  去掉cell 的线条
 */
-(void)SetSeparatorStyle;
/**
 *  设置 headView
 */
-(void)setHeadView:(UIView *)view;
/**
 *  设置 footView
 */
-(void)setFootView:(UIView *)view;
-(void)setRefresh;
-(void)endRefresh;
@end
