//
//  GetNewsListCell.h
//  Runner
//
//  Created by lxx on 16/7/5.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>
@class NewsListItems;

@interface GetNewsListCell : NSObject
+(instancetype)CellWithTable:(UITableView *)tableView item:(NewsListItems *)item indexPath:(NSIndexPath *)indexPath;
@end
