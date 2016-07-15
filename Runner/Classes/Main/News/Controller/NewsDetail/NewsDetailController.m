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
-(void)loadView
{
    [super loadView];
  
    _detailView=[[NewsDetailView alloc]init];
//    _detailView.frame=CGRectMake(0, 0, kScreenWidth, kScreenHeight-64-49);
//    _detailView.contentSize=CGSizeMake(kScreenWidth, 1000);
    _detailView.detailItem=self.detailItem;

    self.view=_detailView;

}

-(void)viewDidLoad
{
    [super viewDidLoad];
    XXLog(@"%@  %@",self.detailItem,self.listItem);
    self.view.backgroundColor=[UIColor whiteColor];
    [self setTopView];
//    _detailView=[[NewsDetailView alloc]init];
//    _detailView.frame=CGRectMake(0, 64, kScreenWidth, kScreenHeight-64);
//    _detailView.contentSize=CGSizeMake(kScreenWidth, 10000);
//    _detailView.detailItem=self.detailItem;
//    [self.view addSubview:_detailView];
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
-(void)viewDidLayoutSubviews
{
    _detailView.scrollView.contentSize=CGSizeMake(kScreenWidth, _detailView.viewHeight);
}
@end