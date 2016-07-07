//
//  LeftAdapter.m
//  Runner
//
//  Created by lxx on 16/6/23.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "LeftAdapter.h"

@implementation LeftAdapter
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=REUSED_CELL(tableView, UITableViewCell);
    cell.textLabel.text=self.dataArray[indexPath.row];
    cell.imageView.image=[UIImage imageNamed:@"tabBar_essence_icon"];
    cell.detailTextLabel.text=@"123";
   cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//cell的右边有一个小箭头，距离右边有
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
      [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (self.delegate&&[self.delegate respondsToSelector:@selector(didTableViewSelected:)]) {
        [self.delegate didTableViewSelected:indexPath.row];
        
    }

}
@end
