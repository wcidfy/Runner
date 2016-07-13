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
#import "FeHandwriting.h"
#import "TalkView.h"
#import "TalkAdapter.h"
@interface TalkController()<BKTableViewAdapterDelegate,UIScrollViewDelegate>
@property (nonatomic, strong) TalkView *talkView;
@property (nonatomic, strong) TalkAdapter *talkAdapter;
@property (nonatomic, assign) NSInteger refreshCount;
@property(nonatomic,strong)BKTableView *tableView;

@property(nonatomic,strong)NSMutableArray *talkArray;
//背景图
@property(nonatomic,strong)UIImageView *bgImageV;
//加载动画
@property(nonatomic,strong)FeHandwriting *handWriting;

@end
@implementation TalkController
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
-(FeHandwriting *)handWriting
{
    if (_handWriting==nil) {
        _handWriting=[[FeHandwriting alloc]initWithView:self.tableView];
        
        [self.view addSubview:_handWriting];
        
        [_handWriting showWhileExecutingBlock:^{
            //            [self myTask];
        } completion:^{
            //            [self.navigationController popToRootViewControllerAnimated:YES];
        }];
    }
    return _handWriting;
}
-(NSMutableArray *)talkArray
{
    if (_talkArray==nil) {
        _talkArray=[NSMutableArray array];
    }
    return _talkArray;
}
-(void)loadView
{
    [super loadView];
    _talkView=[TalkView new];
    self.view=_talkView;
    self.tableView=_talkView.talkTable;
    
    _talkAdapter=[TalkAdapter new];
    _talkAdapter.delegate=self;
    [_talkView.talkTable setAdapter:_talkAdapter];
  
    
    
}
-(void)viewDidLoad
{
    [super viewDidLoad];
      _talkAdapter.dataArray=self.talkArray;
   self.tableView.dataTableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshClick)];
    
    [ self.tableView.dataTableView.mj_header beginRefreshing];
    [self setTittle];

    self.tableView.dataTableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(topRefresh)];
    [ self.tableView.dataTableView.mj_header beginRefreshing];
    
    [self.view addSubview:self.handWriting];
}
#pragma mark 设置标题
-(void)setTittle
{
    UILabel *titleLable=[UILabel new];
    titleLable.font=[UIFont systemFontOfSize:18];
    titleLable.text=@"话题";
   
    titleLable.frame=CGRectMake(kScreenWidth/2-100, 20, 200, 44);
    titleLable.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:titleLable];
    
}
#pragma mark下拉
-(void)refreshClick
{
    
    [HttpTool getTalkListWithPageCount:0 complete:^(NSArray *array) {
        [self.bgImageV removeFromSuperview];
        [self.handWriting removeFromSuperview];
        for (TalkListItem *listItem in array ) {
            TalkListFrame *talkFrame=[[TalkListFrame alloc]init];
            talkFrame.listItem=listItem;
            [self.talkArray addObject:talkFrame];
              NSLog(@"%@",talkFrame.listItem);
        }
         NSLog(@"%@",self.talkArray);
         [ self.tableView.dataTableView.mj_header endRefreshing];
        [self.tableView.dataTableView reloadData];
    }];

}
#pragma mark 上啦
-(void)topRefresh
{
    [HttpTool getTalkListWithPageCount:++self.refreshCount complete:^(NSArray *array) {
        NSMutableArray *arr=[[NSMutableArray alloc]init];
        for (TalkListItem *Item in array) {
            TalkListFrame *talkFrame=[[TalkListFrame alloc]init];
            talkFrame.listItem=Item;
            [arr addObject:talkFrame];
        }
        [self.talkArray addObjectsFromArray:arr];
        [ self.tableView.dataTableView.mj_footer endRefreshing];
        [ self.tableView.dataTableView reloadData];
    }];


}

-(void)didTableViewSelected:(NSInteger)index
{
    TalkListFrame *frame=self.talkArray[index];
    TalkListItem *listItem=frame.listItem;
    TalkDetailController *talkDetail=[TalkDetailController new];
    talkDetail.listItem=listItem;
    
    [self.navigationController pushViewController:talkDetail animated:YES];

}
-(void)didTableViewCellSelected:(UITableViewCell *)aCellData{}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    XXLog(@"%f",scrollView.contentOffset.y);

}
@end
