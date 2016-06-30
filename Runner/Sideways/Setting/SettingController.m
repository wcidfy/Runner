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
@interface SettingController ()
@property(nonatomic,strong)NSArray *arrayTable;
@end

@implementation SettingController
-(NSArray *)arrayTable
{
    if (_arrayTable==nil) {
        _arrayTable=[[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6", nil];
        
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
//    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadDate)];
    self.tableView.mj_header=[EatGifRefresh headerWithRefreshingTarget:self refreshingAction:@selector(loadDate)];
//    self.navigationController.navigationBar.hidden=YES;
//    UIView *view=[[UIView alloc]init];
//    view.frame=CGRectMake(0, 0, self.view.bounds.size.width, 44);
//    view.backgroundColor=[UIColor grayColor];
//    [self.view addSubview:view];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(BackClick)];
     self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"注销" style:UIBarButtonItemStyleDone target:self action:@selector(cancelClick)];
}
-(void)BackClick
{
//    for (UIViewController *vc in self.navigationController.viewControllers) {
//        if([vc isKindOfClass:[LeftViewController class]])
//        {
//            LeftViewController *left=(LeftViewController *)vc;
//         [[SlideNavigationController sharedInstance]popToViewController:left animated:YES];
//        }
//    }
    
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
    cell.textLabel.text=self.arrayTable[indexPath.row];
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
