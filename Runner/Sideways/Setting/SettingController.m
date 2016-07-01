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
@interface SettingController ()
@property(nonatomic,strong)NSArray *arrayTable;
@end

@implementation SettingController
-(NSArray *)arrayTable
{
    if (_arrayTable==nil) {
        _arrayTable=[[NSArray alloc]initWithObjects:@"__________滚动图片__________",@"__________webview__________",@"__________3__________",@"__________4__________",@"__________5__________",@"__________6__________", nil];
        
    }
    return _arrayTable;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    if (![[ud objectForKey:@"loginName"] isEqualToString:@"123"]||![[ud objectForKey:@"loginPass"] isEqualToString:@"123"]) {
        [self presentViewController:[LoginController new] animated:YES completion:nil];
    }else
    {
    
    
    }
    // 告诉self.view约束需要更新
    [self.view setNeedsUpdateConstraints];
    // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
    [self.view updateConstraintsIfNeeded];

    self.tableView.mj_header=[EatGifRefresh headerWithRefreshingTarget:self refreshingAction:@selector(loadDate)];

    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(BackClick)];
     self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"注销" style:UIBarButtonItemStyleDone target:self action:@selector(cancelClick)];
}
-(void)BackClick
{
    [[SlideNavigationController sharedInstance]pushViewController:[MainController new] animated:NO];
    [[SlideNavigationController sharedInstance]toggleLeftMenu];

    
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
    [self.tableView.mj_header endRefreshing];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayTable.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId=@"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.textAlignment=NSTextAlignmentCenter;
    cell.textLabel.text=self.arrayTable[indexPath.row];
    cell.opaque=NO;
    cell.textLabel.backgroundColor=[UIColor clearColor];
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        [self.navigationController pushViewController:[OneController new] animated:YES];
    }else if (indexPath.row==1) {
        BaseWebController *web=[[BaseWebController alloc]init];
       web.urlString=@"http://blog.sina.com.cn/s/blog_5102c0360100yq6u.html";
    
//        web.rootTitle=@"122";
        [self.navigationController pushViewController:web animated:YES];
    }



}

@end
