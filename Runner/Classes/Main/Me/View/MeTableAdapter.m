//
//  MeTableAdapter.m
//  Runner
//
//  Created by lxx on 16/7/20.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "MeTableAdapter.h"

@implementation MeTableAdapter


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 10;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=REUSED_CELL(tableView, UITableViewCell);
    cell.textLabel.text=@"12";
    return cell;
}
@end
