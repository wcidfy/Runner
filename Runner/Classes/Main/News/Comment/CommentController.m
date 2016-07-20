//
//  CommentController.m
//  Runner
//
//  Created by lxx on 16/7/19.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "CommentController.h"
#import "CommentView.h"
#import "CommentAdapter.h"
#import "NewsDetailModel.h"
#import "HttpTool.h"
@interface CommentController ()<BKTableViewAdapterDelegate>
{
    UIView *_topView;
    UIButton *_leftBtn;
    UIButton *_rightBtn;
    UILabel *_titleLable;
    UIView *line;
}
@property(nonatomic,assign)NSInteger pageCount;

@property(nonatomic,strong)CommentView *commentTable;
@property(nonatomic,strong)CommentAdapter *commentAdapter;
@property(nonatomic,strong)NSMutableArray <NSArray *>*hArray;
@property(nonatomic,strong)NSMutableArray <NSArray *>*nArray;
@end

@implementation CommentController
-(NSMutableArray *)hArray
{
    if (_hArray==nil) {
        _hArray=[[NSMutableArray alloc]init];
    }
    return _hArray;
}
-(NSMutableArray *)nArray
{
    if (_nArray==nil) {
        _nArray=[[NSMutableArray alloc]init];
    }
    return _nArray;
}
-(void)loadView
{
    [super loadView];
    _commentTable=[CommentView new];
    self.view=_commentTable;
    _commentAdapter=[CommentAdapter new];
    _commentAdapter.delegate=self;
    [_commentTable setAdapter:_commentAdapter];
    

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTopView];
    [self setHotArray];
   
    
    _commentTable.dataTableView.mj_footer=[MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(TopRefresh)];
    [_commentTable.dataTableView.mj_footer beginRefreshing];
   
}
-(void)setHotArray
{
    NewsDetailModel *item=[NewsDetailModel new];
    item.docid=_docid;
    item.replyBoard=_boardid;
    _detailList=item;
    [HttpTool getHotReplyWithDetailItem:item complete:^(NSMutableArray *array) {
        if (array==nil) {
            return ;
        }
        self.hArray=array;

         _commentAdapter.dataArray=self.hArray;
        [_commentTable refreshTableView];
    }];
    
}
#pragma mark 上拉刷新
-(void)TopRefresh
{
    [HttpTool getNewsReplyWithDetailItem:_detailList pageCount:self.pageCount complete:^(NSMutableArray *array)
    {
        if (array==nil) {
            return ;
        }
        self.nArray=array;
         _commentAdapter.dataArray1=self.nArray;
        [_commentTable.dataTableView reloadData];
        [_commentTable.dataTableView.mj_footer endRefreshing];
    }];
    self.pageCount++;
}
#pragma mark 自定义顶部view
-(void)setTopView
{
    _topView=[[UIView alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, 44)];
    [self.view addSubview:_topView];
    
    _leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.frame=CGRectMake(10, 10, 20, 20);
    [_leftBtn setImage:[UIImage imageNamed:@"navigationbar_back"] forState:UIControlStateNormal];
    [_leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_topView addSubview:_leftBtn];
    
    _titleLable=[UILabel new];
    _titleLable.frame=CGRectMake(40, 10, kScreenWidth-80, 20);
    _titleLable.font=[UIFont systemFontOfSize:18];
    _titleLable.textColor=[UIColor redColor];
    _titleLable.text=@"评论";
    _titleLable.textAlignment=NSTextAlignmentCenter;
    [_topView addSubview:_titleLable];
    
    _rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.frame=CGRectMake(kScreenWidth-30, 10, 20, 20);
    [_rightBtn setImage:[UIImage imageNamed:@"icon_share"] forState:UIControlStateNormal];
    [_topView addSubview:_rightBtn];
    
    line =[UIView new];
    line.frame=CGRectMake(0, 43, kScreenWidth, 1);
    line.backgroundColor=[UIColor lightGrayColor];
    [_topView addSubview:line];
}
#pragma mark 返回
-(void)leftBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)didTableViewSelected:(NSInteger)index{};
-(void)didTableViewCellSelected:(UITableViewCell *)aCellData{};

@end
