//
//  BKTableViewAdapter.m
//  HaveFriends
//
//  Created by lxx on 16/6/9.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "BKTableViewAdapter.h"

@implementation BKTableViewAdapter

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView*)tableView reusedCellOfClass:(Class)class {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(class)];
    if (!cell)
        cell = [[class alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:NSStringFromClass(class)];
    return cell;
}

- (UITableViewHeaderFooterView *)tableView:(UITableView*)tableView reusedHeaderFooterViewOfClass:(Class)class {
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass(class)];
    if (!view) {
        view = [[class alloc] initWithReuseIdentifier:NSStringFromClass(class)];
        UIView *backView = [UIView new];
        backView.backgroundColor = [UIColor colorWithHex:0xf2f2f2];
        view.backgroundView = backView;
    }
    return view;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return REUSED_CELL(tableView, UITableViewCell);
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.row >= _dataArray.count) {
        return;
    }
    
    if (_delegate && [_delegate respondsToSelector:@selector(didTableViewCellSelected:)]) {
//        NSIndexPath *cellData = _dataArray[indexPath.row];
         UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
        [_delegate didTableViewCellSelected:cell];
    }
    if (_delegate && [_delegate respondsToSelector:@selector(didTableViewSelected:)]) {
        //        NSIndexPath *cellData = _dataArray[indexPath.row];
        
        [_delegate didTableViewSelected:indexPath.row];
    }
   
}

@end
