//
//  SettingAdapter.m
//  Runner
//
//  Created by lxx on 16/7/13.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "SettingAdapter.h"

@implementation SettingAdapter
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView  cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=REUSED_CELL(tableView, UITableViewCell);
   
    cell.textLabel.text=self.dataArray[indexPath.row];
     cell.textLabel.textAlignment=NSTextAlignmentRight;
    cell.opaque=NO;
    cell.textLabel.backgroundColor=[UIColor clearColor];
    cell.backgroundColor=[UIColor clearColor];
    
    return cell;
}

@end
