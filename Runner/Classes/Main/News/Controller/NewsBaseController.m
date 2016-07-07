//
//  NewsBaseController.m
//  Runner
//
//  Created by lxx on 16/7/4.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "NewsBaseController.h"

@interface NewsBaseController ()<UIScrollViewDelegate>
//顶部滚动 scrollView
@property(nonatomic,strong)UIScrollView *titleScrollView;
//内容滚动视图 Scrollview
@property(nonatomic,strong)UIScrollView *contentScrollView;
//选中按钮
@property(nonatomic,strong)UIButton *selectedBtn;
@property(nonatomic,strong)NSMutableArray *titleBtnArray;

@end

@implementation NewsBaseController
-(NSMutableArray *)titleBtnArray
{
    if (_titleBtnArray==nil) {
        _titleBtnArray=[[NSMutableArray alloc]init];
        
    }
    return _titleBtnArray;
}
-(void)setPrepare
{
    [self setTitleScrollView];
    [self setTitleScrollViewBtn];
    [self setContentScrollView];
    [self showTableViewWithIndex:0];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
#pragma mark 头部滚动栏 ScrollView
-(void)setTitleScrollView
{
    UIScrollView *titleScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 35)];
    CGFloat contentWidth=self.childViewControllers.count*kScreenWidth/4;
    titleScrollView.contentSize=CGSizeMake(contentWidth, 0);
    titleScrollView.showsVerticalScrollIndicator=NO;
    titleScrollView.showsHorizontalScrollIndicator=NO;
    [self.view addSubview:titleScrollView];
    self.titleScrollView=titleScrollView;

}
#pragma mark 设置内容滚动 scrollView
-(void)setContentScrollView
{
     self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView *contentScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, kScreenWidth, kScreenHeight)];
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
#pragma mark  设置滚动栏按钮
-(void)setTitleScrollViewBtn
{
    for (int i=0; i<self.childViewControllers.count; i++) {
        UIViewController *vc=self.childViewControllers[i];
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag=i;
        if (btn.tag==0) {
            self.selectedBtn=btn;
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            btn.transform=CGAffineTransformMakeScale(1.2, 1.2);
            
        }else
        {
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
        }
        CGFloat X=kScreenWidth/4*i;
        btn.frame=CGRectMake(X, 0, kScreenWidth/4, 35);
        [btn setTitle:vc.title forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
      
        [self.titleScrollView addSubview:btn];
        [self.titleBtnArray addObject:btn];
       
    }

}
#pragma mark 按钮点击
-(void)btnClick:(UIButton *)btn
{
    if (self.selectedBtn==btn) {
        
    }
    self.selectedBtn.transform=CGAffineTransformIdentity;
    self.selectedBtn.selected=NO;
    [self.selectedBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.selectedBtn.selected=YES;
    self.selectedBtn=btn;
    [self.selectedBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.selectedBtn.transform=CGAffineTransformMakeScale(1.2, 1.2);
    self.contentScrollView.contentOffset=CGPointMake(kScreenWidth*btn.tag, 0);
    
    CGFloat offSet=0;
    if (btn.centerx<kScreenWidth/2) {
        offSet=0;
    }else if(self.titleScrollView.contentSize.width-btn.centerx<kScreenWidth/2)
    {
        offSet=self.titleScrollView.contentSize.width-kScreenWidth;
    }
    else if(btn.centerx>kScreenWidth/2)
    {
        offSet=btn.centerx-kScreenWidth/2;
    }
    
    [self.titleScrollView setContentOffset:CGPointMake(offSet, 0) animated:YES];
     [self showTableViewWithIndex:btn.tag];
}
#pragma mark 结束滚动时调用
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index=scrollView.contentOffset.x/kScreenWidth;
    UIButton *btn=self.titleBtnArray[index];
    if (self.selectedBtn==btn) return;
    [self btnClick:btn];
}
#pragma mark 展示点击button所在的tableView
-(void)showTableViewWithIndex:(NSInteger)index
{
    UITableViewController *tableVc=(UITableViewController *)self.childViewControllers[index];
   //判断视图是否第一次加载
    if (tableVc.tableView.window==nil) {
        [self setLayout:tableVc.tableView index:index];
    }
    
}
#pragma mark 抽取设置tableview 设置frame方法
-(void)setLayout:(UITableView*)tableView index:(NSInteger)index
{
    [self.contentScrollView addSubview:tableView];
    tableView.frame=CGRectMake(kScreenWidth*index, -99, kScreenWidth, kScreenHeight);
    tableView.contentInset = UIEdgeInsetsMake(99, 0, 49, 0);
    tableView.contentOffset=CGPointMake(0, -99);
    
  
}
@end