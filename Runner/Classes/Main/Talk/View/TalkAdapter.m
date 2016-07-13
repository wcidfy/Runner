//
//  TalkAdapter.m
//  Runner
//
//  Created by lxx on 16/7/13.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "TalkAdapter.h"
#import "TalkListCell.h"
#import "TalkListFrame.h"
@implementation TalkAdapter

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
    TalkListCell *cell=REUSED_CELL(tableView, TalkListCell);
    cell.talkListFrame=self.dataArray[indexPath.row];
     tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [cell setButtonClick:^(TalkListItem *listItem) {
        NSLog(@"11");
    }];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TalkListFrame *TopF=self.dataArray[indexPath.row];
    return TopF.cellHeight;

}

@end
