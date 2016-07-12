//
//  TalkController.m
//  Runner
//
//  Created by lxx on 16/7/10.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "TalkController.h"
#import "HttpTool.h"
#import "TalkListCell.h"
#import "TalkListFrame.h"
#import "TalkListItem.h"
#import "TalkDetailController.h"
@interface TalkController()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)NSMutableArray *talkArray;

@end
@implementation TalkController

-(NSMutableArray *)talkArray
{
    if (_talkArray==nil) {
        _talkArray=[NSMutableArray array];
    }
    return _talkArray;
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTittle];
    [self setTableView];
//    self.tableView.contentInset=UIEdgeInsetsMake(-20, 0, 0, 0);
    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshClick)];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
#pragma mark 设置标题
-(void)setTittle
{
    UILabel *titleLable=[UILabel new];
    titleLable.font=[UIFont systemFontOfSize:18];
    titleLable.text=@"话题";
    titleLable.centerx=self.view.centerx;
    titleLable.size=CGSizeMake(200, 44);
    titleLable.y=20;
    [self.view addSubview:titleLable];
    
}
#pragma mark 初始化TableView
-(void)setTableView
{

    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64-49) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
}
-(void)refreshClick
{
    [HttpTool getTalkListWithPageCount:0 complete:^(NSArray *array) {
        for (TalkListItem *listItem in array ) {
            TalkListFrame *talkFrame=[[TalkListFrame alloc]init];
            talkFrame.listItem=listItem;
            [self.talkArray addObject:talkFrame];
              NSLog(@"%@",talkFrame.listItem);
        }
         NSLog(@"%@",self.talkArray);
         [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
        self.tableView.separatorStyle = UITableViewCellStyleDefault;
    }];

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.talkArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId=@"TalkCellId";
    TalkListCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell=[[TalkListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
   
    cell.selectionStyle=UITableViewCellSeparatorStyleNone;
        cell.talkListFrame=self.talkArray[indexPath.row];
   
    [cell setButtonClick:^(TalkListItem *list) {
        XXLog(@"1");
    }];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TalkListFrame *frame=self.talkArray[indexPath.row];
    return frame.cellHeight;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     TalkListFrame *frame=self.talkArray[indexPath.row];
    TalkListItem *listItem=frame.listItem;
    TalkDetailController *talkDetail=[TalkDetailController new];
    talkDetail.listItem=listItem;
    
    [self.navigationController pushViewController:talkDetail animated:YES];

}
@end
