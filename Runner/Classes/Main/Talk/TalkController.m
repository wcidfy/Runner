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
@interface TalkController()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, assign) NSInteger refreshCount;
@property(nonatomic,strong)UITableView *tableView;

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
    self.tableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(topRefresh)];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.bgImageV];
    [self.view addSubview:self.handWriting];
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
         [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
        self.tableView.separatorStyle = UITableViewCellStyleDefault;
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
        [self.tableView.mj_footer endRefreshing];
        [self.tableView reloadData];
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
