//
//  GetNewsListCell.m
//  Runner
//
//  Created by lxx on 16/7/5.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "GetNewsListCell.h"
#import "ThreeViewCell.h"
#import "NewsListItems.h"
#import "Messagecell.h"
static NSString * const ThrImg = @"newsListCell2";
static NSString * const SglImg = @"newsListCell1";

@implementation GetNewsListCell
+(instancetype)CellWithTable:(UITableView *)tableView item:(NewsListItems *)item indexPath:(NSIndexPath *)indexPath
{
    if (item.imgextra) {
        ThreeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ThrImg];
        if (cell == nil) {
            cell=[[ThreeViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ThrImg];

        }
        return (id)cell;
    }
    else
    {
        Messagecell *cell = [tableView dequeueReusableCellWithIdentifier:SglImg];
        if (cell == nil) {
            cell=[[Messagecell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SglImg];
            
        }
        return (id)cell;
    }
   
}
@end
