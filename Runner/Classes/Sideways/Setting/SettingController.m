//
//  SettingController.m
//  Runner
//
//  Created by lxx on 16/6/24.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "SettingController.h"
#import "EatGifRefresh.h"
#import "SlideNavigationController.h"
#import "LeftViewController.h"
#import "OneController.h"
#import "BaseWebController.h"
#import "LoginController.h"
#import "MainController.h"
#import "SettingView.h"
#import "SettingAdapter.h"
@interface SettingController ()<BKTableViewAdapterDelegate>
{
    UIView *_topView;
    UIButton *_leftButton;
    UIButton *_rightButton;

}
@property(nonatomic,strong)NSArray *arrayTable;
@property(nonatomic,strong)SettingView *settingview;
@property(nonatomic,strong)SettingAdapter *settingAdapter;

@end

@implementation SettingController

-(NSArray *)arrayTable
{
    if (_arrayTable==nil) {
        _arrayTable=[[NSArray alloc]initWithObjects:@"__________滚动图片__________",@"__________webview__________",@"__________3__________",@"__________4__________",@"__________5__________",@"__________6__________", nil];
        
    }
    return _arrayTable;
}
-(void)loadView
{
    _settingview=[SettingView new];
    self.view=_settingview;
  
   
    
    

}
- (void)viewDidLoad {
    [super viewDidLoad];
    _settingAdapter=[SettingAdapter new];
    _settingAdapter.delegate=self;
    [_settingview.tableView setAdapter:_settingAdapter];
    _settingAdapter.dataArray=(NSMutableArray*)self.arrayTable;
    
    
    
      _settingview.tableView.dataTableView.mj_header=[EatGifRefresh headerWithRefreshingTarget:self refreshingAction:@selector(loadDate)];
    self.navigationController.navigationBar.hidden=YES;
    [_settingview.leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [SlideNavigationController sharedInstance].navigationBar.backgroundColor=[UIColor redColor];
}

-(void)leftButtonAction
{
    
    [[SlideNavigationController sharedInstance]pushViewController:[MainController new] animated:NO];
     [[SlideNavigationController sharedInstance]toggleLeftMenu];
//
    
}
-(void)cancelClick
{
     [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"loginName"];
     [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"loginPass"];
    [[SlideNavigationController sharedInstance]popViewControllerAnimated:YES];

}
-(void)loadDate
{

    sleep(3);
    [_settingview.tableView.dataTableView.mj_header endRefreshing];
}


#pragma mark 点击方法
-(void)didTableViewSelected:(NSInteger)index
{
    if (index==0) {
        [self.navigationController pushViewController:[OneController new] animated:YES];
    }else if (index==1) {
        BaseWebController *web=[[BaseWebController alloc]init];
        web.urlString=@"http://www.cocoachina.com/bbs/read.php?tid=5917";
        
        //        web.rootTitle=@"122";
        [self.navigationController pushViewController:web animated:YES];
    }


}
-(void)didTableViewCellSelected:(UITableViewCell *)aCellData
{}
@end
