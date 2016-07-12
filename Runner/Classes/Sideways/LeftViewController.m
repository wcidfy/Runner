//
//  LeftViewController.m
//  Runner
//
//  Created by lxx on 16/6/23.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "LeftViewController.h"
#import "LeftView.h"
#import "LeftAdapter.h"
#import "MainController.h"

#import "SettingController.h"
#import "SlideNavigationController.h"
@interface LeftViewController ()<BKTableViewAdapterDelegate>
@property(nonatomic,strong)LeftView *leftView;
@property(nonatomic,strong)LeftAdapter *leftAdapter;
@property(nonatomic,strong)BKTableView *tableView;
@property(nonatomic,strong)NSMutableArray *tableArray;
@end

@implementation LeftViewController
-(NSArray*)tableArray
{
    if (_tableArray==nil) {
        _tableArray=[[NSMutableArray alloc]initWithObjects:@"个人主页",@"认证",@"发布的任务",@"接受的任务",@"推荐好友",@"我的积分",@"设置" ,nil];
    }
    return _tableArray;
}
-(void)loadView
{
    [super loadView];
    _leftView=[[LeftView alloc]init];
    self.view=_leftView;
    self.tableView=_leftView.tableView;
    _leftAdapter=[[LeftAdapter alloc]init];
    _leftAdapter.delegate=self;
    [self.tableView setAdapter:_leftAdapter];
    _leftAdapter.dataArray=self.tableArray;
    
    
    [self.tableView setFootView:[UIView new]];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self buttonClick];
//    [self.tableView setRefresh];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"hh1.jpg"]];
   
  
    
}

-(void)buttonClick
{
    [_leftView.withdrawButton addTarget:self action:@selector(withdrawButtonClick) forControlEvents:UIControlEventTouchUpInside];
    UITapGestureRecognizer *touch=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TouchAction)];
    [_leftView.headView addGestureRecognizer:touch];
}
-(void)withdrawButtonClick
{

    NSLog(@"vdcvgdfdsgfd");
}
-(void)TouchAction
{
     NSLog(@"vdcvgdfdsgfd");
//    [[SlideNavigationController sharedInstance]pushViewController:[MainController new] animated:NO];
    [[SlideNavigationController sharedInstance]toggleLeftMenu];

}

#pragma mark tableView 点击代理
-(void)didTableViewSelected:(NSInteger)index
{
    if (index==CellTypePerson) {
        
        XXLog(@"CellTypePerson");
    }else if (index== CellTypeCert)
    {
         XXLog(@"CellTypeCert");
    }else if (index==  CellTypeIssue)
    {
        XXLog(@"CellTypeIssue");
    }
    else if (index== CellTypeAgree)
    {
        XXLog(@"CellTypeAgree");
    }
    else if (index== CellTypeRecommend)
    {
        XXLog(@"CellTypeRecommend");
    }
    else if (index== CellTypeMyNumber)
    {
        XXLog(@"CellTypeMyNumber");
    }
    else if (index== CellTypeSetting)
    {
        XXLog(@"CellTypeSetting");
        SettingController *setting=[[SettingController alloc]init];
//        [self presentViewController:setting animated:YES completion:nil];
        [[SlideNavigationController sharedInstance]popToRootAndSwitchToViewController:setting withCompletion:nil];
    }




}
-(void)didTableViewCellSelected:(UITableViewCell *)aCellData
{
}

@end
