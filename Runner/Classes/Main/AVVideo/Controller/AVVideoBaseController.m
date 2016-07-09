//
//  AVVideoBaseController.m
//  Runner
//
//  Created by lxx on 16/7/7.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "AVVideoBaseController.h"
@interface AVVideoBaseController()<UIScrollViewDelegate>
//顶部滚动title
@property(nonatomic,strong)UIScrollView *topTitleScrollView;
//内容滚动
@property(nonatomic,strong)UIScrollView *contentScrollView;
//选中button
@property(nonatomic,strong)UIButton *selectedButton;
@property(nonatomic,strong)NSMutableArray *titleButArray;

@end
@implementation AVVideoBaseController
-(void)setAllPrepare
{
    [self setTopTitleScrollView];
    [self setTitleBtnScrollView];
    [self setContentScrollView];
    [self showTableViewWithIndex:0];
}
-(NSMutableArray *)titleButArray
{
    if (_titleButArray==nil) {
        _titleButArray=[[NSMutableArray alloc]init];
    }
    return _titleButArray;
}
#pragma mark 顶部滚动View
-(void)setTopTitleScrollView
{
    _topTitleScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 35)];
    CGFloat contentWidth=self.childViewControllers.count*kScreenWidth/4;
    _topTitleScrollView.contentSize=CGSizeMake(contentWidth, 0);
    _topTitleScrollView.showsVerticalScrollIndicator=NO;
    _topTitleScrollView.showsHorizontalScrollIndicator=NO;
    [self.view addSubview:_topTitleScrollView];


}
-(void)setTitleBtnScrollView
{
    for (int i=0; i<self.childViewControllers.count; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat w=kScreenWidth/4;
        btn.frame=CGRectMake(i*w, 0, w, 35);
        UITableViewController *childVc=self.childViewControllers[i];
        [btn setTitle:childVc.title forState:UIControlStateNormal];
        
        btn.tag=i;
        if (i==0) {
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            btn.transform=CGAffineTransformMakeScale(1.2, 1.2);
            self.selectedButton=btn;

        }else
        {
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.topTitleScrollView addSubview:btn];
        [self.titleButArray addObject:btn];
    }

   
}
#pragma mark 内容滚动Scrollview
-(void)setContentScrollView
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView *contentScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 99, kScreenWidth, kScreenHeight)];
    contentScrollView.delegate=self;
    CGFloat contentWidth=self.childViewControllers.count*kScreenWidth;
    contentScrollView.contentSize=CGSizeMake(contentWidth, 0);
    contentScrollView.showsVerticalScrollIndicator=NO;
    contentScrollView.showsHorizontalScrollIndicator=NO;
    contentScrollView.pagingEnabled=YES;
    //点击设备状态栏时滚动到顶部 yes
    contentScrollView.scrollsToTop=NO;
    [self.view addSubview:contentScrollView];
    self.contentScrollView=contentScrollView;
    
    
}

-(void)btnClick:(UIButton *)btn
{
    if (self.selectedButton==btn) {
        
    }
    [self.selectedButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.selectedButton.transform=CGAffineTransformIdentity;
    self.selectedButton=btn;
    [self.selectedButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.selectedButton.transform=CGAffineTransformMakeScale(1.2, 1.2);
    
    CGFloat offSet=0;
    if (btn.centerx<kScreenWidth/2) {
        offSet=0;
    }else if(self.topTitleScrollView.contentSize.width-btn.centerx<kScreenWidth/2)
    {
        offSet=self.topTitleScrollView.contentSize.width-kScreenWidth;
    }
    else if(btn.centerx>kScreenWidth/2)
    {
        offSet=btn.centerx-kScreenWidth/2;
    
    }
    self.topTitleScrollView.contentOffset=CGPointMake(offSet, 0);
     self.contentScrollView.contentOffset=CGPointMake(kScreenWidth*btn.tag, 0);
    [self showTableViewWithIndex:btn.tag];
}
#pragma mark 获取需要展示的tableview
-(void)showTableViewWithIndex:(NSInteger)index
{
    //顶部多出部分
    self.contentScrollView.contentInset=UIEdgeInsetsMake(-20, 0, 0, 0);
    UITableViewController *tableVc=(UITableViewController *)self.childViewControllers[index];
    //判断是否第一次加载
    if (tableVc.tableView.window==nil) {
       
        tableVc.tableView.frame=CGRectMake(kScreenWidth*index, 0, kScreenWidth, kScreenHeight-64-35);
        tableVc.tableView.contentInset=UIEdgeInsetsMake(20, 0, 49, 0);
         [self.contentScrollView addSubview:tableVc.tableView];
    }
   
    
}
#pragma mark 滚动结束
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
   NSInteger index=scrollView.contentOffset.x/kScreenWidth;
    UIButton *btn=self.titleButArray[index];
    if (self.selectedButton==btn)return;
    [self btnClick:btn];
}
@end
