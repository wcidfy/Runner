//
//  MeTableAdapter.m
//  Runner
//
//  Created by lxx on 16/7/20.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "MeTableAdapter.h"
#import "CellModel.h"
@implementation MeTableAdapter


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.dataArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=REUSED_CELL(tableView, UITableViewCell);
    CellModel *model=self.dataArray[indexPath.row];
    cell.textLabel.text=model.titleStr;
    cell.imageView.image=[UIImage imageNamed:model.imageStr];
    return cell;
}
@end
