//
//  BKTableViewAdapter.h
//  HaveFriends
//
//  Created by lxx on 16/6/9.
//  Copyright © 2016年 lxx. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define REUSED_CELL(tableView,cellClass) (cellClass *)[self tableView:tableView reusedCellOfClass:([cellClass class])]

#define REUSED_HEADERFOOTER(table,viewClass) (viewClass *)[self tableView:tableView reusedHeaderFooterViewOfClass:([viewClass class])]

@protocol BKTableViewAdapterDelegate <NSObject>

- (void)didTableViewSelected:(NSInteger )index;

- (void)didTableViewCellSelected:(UITableViewCell *)aCellData;

@end

/**
 *  将datasource和delegate封装到adapter中
 *  独立出tableview的展示逻辑
 */
@interface BKTableViewAdapter : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, weak) id<BKTableViewAdapterDelegate> delegate;

- (UITableViewCell *)tableView:(UITableView*)tableView reusedCellOfClass:(Class)class;

- (UITableViewHeaderFooterView *)tableView:(UITableView*)tableView reusedHeaderFooterViewOfClass:(Class)class;

@end
