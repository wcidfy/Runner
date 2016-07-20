//
//  CommentAdapter.m
//  Runner
//
//  Created by lxx on 16/7/19.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "CommentAdapter.h"
#import "CommentCell.h"
#import "NewsHotReplyItems.h"
@implementation CommentAdapter
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
         return self.dataArray.count;
    }else
        return self.dataArray1.count;
   
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentCell *cell=REUSED_CELL(tableView, CommentCell);
    NewsHotReplyItems *itemList;
    if (indexPath.section==0) {
        itemList=self.dataArray[indexPath.row][0];
       
    }else
    {
       itemList=self.dataArray1[indexPath.row][0];
        
    }
    cell.itemList=itemList;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsHotReplyItems *itemList;
    if (indexPath.section==0) {
        itemList= self.dataArray[indexPath.row][0];
        
        return [CommentCell heightWithItemList:itemList];
    }else
        itemList= self.dataArray1[indexPath.row][0];
        return [CommentCell heightWithItemList:itemList];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView=[UIView new];
    headView.frame=CGRectMake(0, 0, kScreenWidth, 20);
    headView.backgroundColor=[UIColor clearColor];
    
    UILabel *headL=[UILabel new];
    headL.font=[UIFont systemFontOfSize:12];
    headL.textColor=[UIColor redColor];
    headL.frame=CGRectMake(0, 0, kScreenWidth, 20);
    if(section==0)
    {
    headL.text=@"最热评论";
    }else
    headL.text=@"最新评论";
    [headView addSubview:headL];
    return headView;
}
@end
