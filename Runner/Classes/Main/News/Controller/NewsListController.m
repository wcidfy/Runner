//
//  NewsListController.m
//  Runner
//
//  Created by lxx on 16/7/4.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "NewsListController.h"
#import "HttpTool.h"
#import "NewsListItems.h"
#import "ThreeViewCell.h"
#import "GetNewsListCell.h"
#import "NewsHeadView.h"
#import "NewsHeadModel.h"
#import "NewsPhotoController.h"
@interface NewsListController ()
{
    NSString *ss;
}
@property (nonatomic, assign) NSInteger lastTimeid;
@property (nonatomic, strong) NSMutableArray<NewsListItems *> *newsListArray;

@end

@implementation NewsListController
-(NSMutableArray*)newsListArray
{
    if (_newsListArray==nil) {
        _newsListArray=[[NSMutableArray alloc]init];
    }
    return _newsListArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
  
    
    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(downRefresh)];
   
    [self lanuchRefresh];
    [self.tableView setRowHeight:100];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(networkStat:)
                                                 name:@"networkState"
                                               object:nil];
}
-(void)networkStat:(NSNotification *)notification
{
    
   ss= [notification object];
    XXLog(@"___%@",ss);

}
#pragma mark 设置头部view
-(void)setHeadView
{
    NewsListItems *item=self.newsListArray[0];
    if (item.ads) {
        NewsHeadView *head=[[NewsHeadView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
        head.contItem=item;
        head.adClickBlock=^(NewsListItems *item,NSInteger index)
        {
//            if (item.ads.count==1)return ;
          
            [self showPhotoWithItem:item index:index];
        };
        self.tableView.tableHeaderView=head;
    }
}
-(void)showPhotoWithItem:(NewsListItems*)listItem index:(NSInteger)index
{
     NewsHeadModel *item = listItem.ads[index];
    NewsPhotoController *photoVc=[NewsPhotoController new];
    photoVc.photoUrl=item.url;
    photoVc.listItem=listItem;
    [self.navigationController pushViewController:photoVc animated:YES];
    XXLog(@"%@",item.url);
}
#pragma mark 启动时加载数据
-(void)lanuchRefresh
{
    [HttpTool getTopicNewsListWithPgmid:self.pgmid count:1 timeid:self.lastTimeid complete:^(NSArray *array) {
        
        [self.newsListArray addObjectsFromArray:(NSMutableArray*)array];
        [self setHeadView];
        self.lastTimeid=self.newsListArray.lastObject.timeid;
        [self.tableView reloadData];
    }];

}
#pragma mark 下拉刷新
-(void)downRefresh
{
    [HttpTool getTopicNewsListWithPgmid:self.pgmid count:1 timeid:self.lastTimeid complete:^(NSArray *array) {
        
        
        if (array!=nil) {
            [self.newsListArray removeAllObjects];
            [self.newsListArray addObjectsFromArray:array];
        }
          if (self.newsListArray.count == 0)return ;
        [self.tableView.mj_header endRefreshing];
        [self setHeadView];
        self.lastTimeid=self.newsListArray.lastObject.timeid;
        [self.tableView reloadData];
    }];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.newsListArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsListItems *item = self.newsListArray[indexPath.row];
    
    id cell = [GetNewsListCell CellWithTable:tableView item:item indexPath:indexPath];
    [cell setContItem:item];
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    NewsListItems *item=self.newsListArray[indexPath.row];
    return item.totalHeight;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsListItems *listItem=self.newsListArray[indexPath.row];
    if (listItem.photosetID!=nil) {
        NewsPhotoController *photoVc=[NewsPhotoController new];
        photoVc.photoUrl=listItem.photosetID;
        photoVc.listItem=listItem;
        [self.navigationController pushViewController:photoVc animated:YES];
    }
    

}
@end
