//
//  NewsDetailController.m
//  Runner
//
//  Created by lxx on 16/7/15.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "NewsDetailController.h"
#import "NewsDetailView.h"
#import "HttpTool.h"
#import "CommentController.h"
@interface NewsDetailController()
{
    UIView *_topView;
    UIButton *_leftBtn;
    UIButton *_rightBtn;
    UILabel *_titleLable;
    UIView *line;

}
@property(nonatomic,strong)NewsDetailView *detailView;
@end
@implementation NewsDetailController

-(void)viewDidLoad
{
    [super viewDidLoad];
    XXLog(@"%@  %@",self.detailItem,self.listItem);
    self.view.backgroundColor=[UIColor whiteColor];
    [self setTopView];

}
-(void)setDetailItem:(NewsDetailModel *)detailItem
{
    if(detailItem==nil)
    {
        return;
    }
//    数据返回之后赋值
    _detailItem=detailItem;
//    加载数据视图
    _detailView=[[NewsDetailView alloc]init];
    _detailView.frame=CGRectMake(0, 64, kScreenWidth, kScreenHeight-64);
    _detailView.detailItem=_detailItem;
    [self.view addSubview:_detailView];
    __weak typeof(self) weakSelf=self;
    self.detailView.hotBlock=^
    {
        [weakSelf HotTouchClick];
    };
    self.detailView.relatedBlock=^(NSString *docid)
    {
        [weakSelf relatedWithDocid:docid];
    };
    
//设置标题
    _titleLable.text=_detailItem.title;

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
    _titleLable.text=_detailItem.title;
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
-(void)leftBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];

}
#pragma mark 热门评论点击
-(void)HotTouchClick
{
    CommentController *comment=[CommentController new];
    comment.docid=_detailItem.docid;
    comment.boardid=_detailItem.replyBoard;
    [self.navigationController pushViewController:comment animated:YES];
    
}
-(void)relatedWithDocid:(NSString *)docid
{
    NewsDetailController *detail=[NewsDetailController new];
    [self.navigationController pushViewController:detail animated:YES];
    [HttpTool getNewsdetailWithDocid:docid complete:^(NewsDetailModel *detailList) {
        
        [HttpTool getHotReplyWithDetailItem:detailList complete:^(NSArray *array) {
            if (array) {
                detailList.replys=array;
            }
            detail.detailItem=detailList;
        }];
        
    }];

}
-(void)viewDidLayoutSubviews
{
    _detailView.scrollView.contentSize=CGSizeMake(kScreenWidth, _detailView.viewHeight);
}

@end
