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
#import "FeHandwriting.h"
#import "NewsDetailController.h"
#import "ORIndicatorView.h"
@interface NewsListController ()
{
    NSString *ss;
}
@property(nonatomic,assign)NSInteger refreshCount;
@property (nonatomic, assign) NSInteger lastTimeid;
@property (nonatomic, strong) NSMutableArray<NewsListItems *> *newsListArray;
//背景图
@property(nonatomic,strong)UIImageView *bgImageV;
//加载动画
@property(nonatomic,strong)FeHandwriting *handWriting;
@end

@implementation NewsListController
-(UIImageView*)bgImageV
{
    if (_bgImageV==nil) {
        _bgImageV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"zz1"]];
        _bgImageV.center=self.view.center;
        [_bgImageV sizeToFit];
        [self.view addSubview:_bgImageV];
        
    }

    return _bgImageV;
}
-(NSMutableArray*)newsListArray
{
    if (_newsListArray==nil) {
        _newsListArray=[[NSMutableArray alloc]init];
    }
    return _newsListArray;
}
-(FeHandwriting *)handWriting
{
    if (_handWriting==nil) {
        _handWriting=[[FeHandwriting alloc]initWithView:self.view];
       
        [self.view addSubview:_handWriting];
        
        [_handWriting showWhileExecutingBlock:^{
//            [self myTask];
        } completion:^{
//            [self.navigationController popToRootViewControllerAnimated:YES];
        }];
    }
    return _handWriting;
}
//- (void)myTask
//{
//    // Do something usefull in here instead of sleeping ...
//    sleep(12);
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.bgImageV];
    self.view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.handWriting];
    self.refreshCount=1;
    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(downRefresh)];
    self.tableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(topRefresh)];

    [self.tableView.mj_header beginRefreshing];
        [self.tableView setRowHeight:100];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  
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
        self.tableView.separatorStyle = UITableViewCellStyleDefault;
    }];

}
#pragma mark 下拉刷新
-(void)downRefresh
{
    [ORIndicatorView showLoading];
    [HttpTool getTopicNewsListWithPgmid:self.pgmid count:1 timeid:self.lastTimeid complete:^(NSArray *array) {
        [self.handWriting removeFromSuperview];
        [self.bgImageV removeFromSuperview];
        if (array!=nil) {
            [self.newsListArray removeAllObjects];
            [self.newsListArray addObjectsFromArray:array];
        }
          if (self.newsListArray.count == 0)return ;
        [self.tableView.mj_header endRefreshing];
        [ORIndicatorView hideLoading];
        [self setHeadView];
        self.lastTimeid=self.newsListArray.lastObject.timeid;
        [self.tableView reloadData];
    }];
}
-(void)topRefresh
{
    [HttpTool getTopicNewsListWithPgmid:self.pgmid count:++self.refreshCount timeid:self.lastTimeid complete:^(NSArray *array) {
        [self.newsListArray addObjectsFromArray:array];
        [self.tableView.mj_footer endRefreshing];
        [self.tableView reloadData];
        self.lastTimeid=self.newsListArray.lastObject.timeid;
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
    }else
    {
        NewsDetailController *detailVc=[[NewsDetailController alloc]init];
        [self.navigationController pushViewController:detailVc animated:YES];

        detailVc.listItem=listItem;
                 [HttpTool getNewsdetailWithDocid:listItem.docid complete:^(NewsDetailModel *detailList) {
                
                [HttpTool getHotReplyWithDetailItem:detailList complete:^(NSArray *array) {
                    if (array) {
                        detailList.replys=array;
                    }
                    detailVc.detailItem=detailList;
                }];
                
            }];
        
        
        
            
       
        
       
       

    }
    

}
@end
