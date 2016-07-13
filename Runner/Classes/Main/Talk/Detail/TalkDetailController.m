//
//  TalkDetailController.m
//  Runner
//
//  Created by lxx on 16/7/11.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "TalkDetailController.h"
#import "TalkDetailView.h"
#import "HttpTool.h"
#import "AskAndAnswer.h"
#import "TalkDetailCell.h"
@interface TalkDetailController()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    
    NSInteger isNew;
}
@property (nonatomic, assign) NSInteger refreshCount;
@property(nonatomic,strong)TalkDetailView *talkDetailView;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray <AskAndAnswer*>*AskAnswerarray;
@end
@implementation TalkDetailController
-(NSMutableArray *)AskAnswerarray
{
    if (_AskAnswerarray==nil) {
        _AskAnswerarray=[[NSMutableArray alloc]init];
    }
    return _AskAnswerarray;
}
-(void)loadView
{
    [super loadView];
    _talkDetailView=[TalkDetailView new];
    [_talkDetailView setImageBottonWith:_listItem];
    self.view=_talkDetailView;
   
    

}
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self setViewWithDateSouce];

}
#pragma mark 设置视图并且赋值
-(void)setViewWithDateSouce
{
    _talkDetailView.titleLable.text=_listItem.alias;
    [_talkDetailView.headBgV sd_setImageWithURL:[NSURL URLWithString:_listItem.picurl] placeholderImage:[UIImage imageNamed:@"newsTitleImage"]];
    _talkDetailView.lableTop.text=_listItem.alias;
    
    isNew=1;
    self.tableView=_talkDetailView.tableView;
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(bottonRefresh)];
    self.tableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(topRefresh)];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_header.hidden=YES;
     
    
    [_talkDetailView.leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];

}
#pragma mark 下拉
-(void)bottonRefresh
{
    [HttpTool getTalkDetailWithExpertId:_listItem.expertId isNew:1 pageCount:0 complete:^(NSMutableArray * array) {
        self.AskAnswerarray=array;
       
        [self.tableView.mj_header endRefreshing];
       
        [self.tableView reloadData];
       
       
    }];
    
}
#pragma mark 上啦操作
-(void)topRefresh
{
     [HttpTool getTalkDetailWithExpertId:_listItem.expertId isNew:isNew pageCount:++self.refreshCount complete:^(NSMutableArray *array) {
         [self.AskAnswerarray addObjectsFromArray:array];
         [self.tableView.mj_footer endRefreshing];
         [self.tableView reloadData];
     }];

}

#pragma mark 返回按钮
-(void)leftBtnClick
{

    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.AskAnswerarray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId=@"TalkDetailId";
    TalkDetailCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell=[[TalkDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    [cell setAskAnswer:self.AskAnswerarray[indexPath.row]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.AskAnswerarray[indexPath.row].cellHeight==0)
    {
    self.AskAnswerarray[indexPath.row].cellHeight=[TalkDetailCell cellHeightWithItem:self.AskAnswerarray[indexPath.row]];
    }
    return self.AskAnswerarray[indexPath.row].cellHeight;

}
#pragma mark scrollView 代理
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.tableView.mj_header.hidden=NO;
    if (scrollView.contentOffset.y>-136) {
         self.tableView.mj_header.hidden=YES;
        if(scrollView.contentOffset.y>0)return;
        
        _talkDetailView.headBgV.frame=CGRectMake(0,-64+(scrollView.contentOffset.y+136)/136*64, kScreenWidth, 200);
        self.tableView.mj_header.hidden=YES;
       
    }
    else if (scrollView.contentOffset.y<-136)
    {
        _talkDetailView.headBgV.frame=CGRectMake(0, 0, kScreenWidth, 200);
       
    }
    else if(scrollView.contentOffset.y==-136)
    {
        self.tableView.mj_header.hidden=YES;
    }

    _talkDetailView.imageBottonView.alpha = 1 - (scrollView.contentOffset.y+136)/100.0;
    _talkDetailView.lableTop.alpha=1-(scrollView.contentOffset.y+136)/100.0;
    //标题透明度
    self.talkDetailView.titleLable.alpha=(scrollView.contentOffset.y+136)/100;
    XXLog(@"%f",scrollView.contentOffset.y);
    
}
@end
