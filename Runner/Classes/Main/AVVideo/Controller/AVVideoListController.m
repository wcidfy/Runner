//
//  AVVideoListController.m
//  Runner
//
//  Created by lxx on 16/7/7.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "AVVideoListController.h"
#import "HttpTool.h"
#import "AVVideoListCell.h"
#import "ShareView.h"
#import "AVDetailsController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
static NSString *cellId=@"AVVideoIdd";
@interface AVVideoListController()
@property(nonatomic,strong)NSArray<AVVideoList *> *AVVideoArray;
//毛玻璃
@property(nonatomic,strong)UIToolbar *blurView;
@property(nonatomic,strong)ShareView *shareView;

@property(nonatomic,strong)AVPlayerItem *avPlayItem;
@property(nonatomic,strong)AVPlayer *avPlayer;
@property(nonatomic,strong)AVPlayerViewController *avPlayVc;
//上一次存在的 indexPath
@property(nonatomic,strong)NSIndexPath *previousIndexPath;

@property(nonatomic,strong)AVVideoListCell * currentCell;

@end

@implementation AVVideoListController

-(NSArray *)AVVideoArray
{
    if (_AVVideoArray==nil) {
        _AVVideoArray=[[NSArray alloc]init];
    }
    return _AVVideoArray;
}
-(UIToolbar *)blurView
{
    if (_blurView==nil) {
        _blurView=[[UIToolbar alloc]init];
        _blurView.frame=self.tabBarController.view.bounds;
       
        [_blurView addGestureRecognizer: [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(back)]];
    }
    return _blurView;
}
-(AVPlayerViewController *)avPlayVc
{
    if (_avPlayVc==nil) {
        _avPlayVc=[[AVPlayerViewController alloc]init];
    }
    return _avPlayVc;
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    

    self.tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(bottonRefresh)];
    [self.tableView.mj_header beginRefreshing];
    [self.tableView setRowHeight:200];
    
  
}

#pragma mark 下拉刷新
-(void)bottonRefresh
{
   [HttpTool getAVVidelListWithTid:self.tid pageCount:0 complete:^(NSArray *array) {
       XXLog(@"————%@",array);
       self.AVVideoArray=array;
       [self.tableView.mj_header endRefreshing];
           [self.tableView reloadData];
   }];

}

-(void)back
{
    [self.blurView removeFromSuperview];
    [self.shareView removeFromSuperview];

}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.AVVideoArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    AVVideoListCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId ];
    AVVideoListCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell==nil) {
        cell=[[AVVideoListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    AVVideoList *avVideoList=self.AVVideoArray[indexPath.row];
    [cell setVideoList:avVideoList];
    [cell setShareClick:^(AVVideoList *videoList) {
    [self shareBtnWithVideoList:videoList];
        
    }];
    [cell setMovieBlock:^(NSString *url, UIView *playV) {
        [self setPlayMoviesWithUrl:url playV:playV];
    }];
   
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AVVideoList *avList=self.AVVideoArray[indexPath.row];
    // 移除正在播放的非窗口视频
    if (self.previousIndexPath) { // 刷新对应的cell
        [self.tableView reloadRowsAtIndexPaths:@[self.previousIndexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
    self.avPlayer = nil;
    [self.avPlayVc.view removeFromSuperview];
    [self.avPlayVc removeFromParentViewController];
    self.avPlayVc.player=nil;
    self.avPlayVc = nil;
    
    self.currentCell=[tableView cellForRowAtIndexPath:indexPath];
    AVDetailsController *avDetails=[AVDetailsController new];
    avDetails.avList=avList;
    [self.navigationController pushViewController:avDetails animated:YES];

}
#pragma mark 分享
-(void)shareBtnWithVideoList:(AVVideoList *)videoList
{
    [self.tabBarController.view addSubview:self.blurView];
    ShareView *shareView=[ShareView new];
    shareView.size=CGSizeMake(kScreenWidth, 100);
    shareView.center= self.blurView.center;
   
    
    _shareView.backgroundColor=[UIColor whiteColor];
    
    
     [self.tabBarController.view addSubview:shareView];
        _shareView=shareView;
    [self SetAnimation:_shareView];

}
#pragma mark 视屏播放
-(void)setPlayMoviesWithUrl:(NSString *)url playV:(UIView *)playV
{
    
    NSIndexPath *indexPath;
    for (int i=0; i<self.AVVideoArray.count; i++) {
       if ([self.AVVideoArray[i].mp4_url isEqualToString:url]) {
            indexPath=[NSIndexPath indexPathForRow:i inSection:0];
           
        }
    }
    self.currentCell=(AVVideoListCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    if (self.previousIndexPath&&indexPath.row!=self.previousIndexPath.row) {
        [self.tableView reloadRowsAtIndexPaths:@[self.previousIndexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
    self.previousIndexPath=indexPath;
    self.avPlayItem=nil;
    self.avPlayer=nil;
    [self.avPlayVc.view removeFromSuperview];
    [self.avPlayVc removeFromParentViewController];
    self.avPlayVc.player=nil;
    self.avPlayVc=nil;
    
      
   
    if (self.avPlayVc) {
        _avPlayItem=[[AVPlayerItem alloc]initWithURL:[NSURL URLWithString:url]];
        _avPlayer=[AVPlayer playerWithPlayerItem:_avPlayItem];
        self.avPlayVc.player=_avPlayer;
        self.avPlayVc.view.frame=playV.bounds;
        
        self.avPlayVc.view.translatesAutoresizingMaskIntoConstraints = YES;
        self.avPlayVc.showsPlaybackControls = YES;
        [playV addSubview:self.avPlayVc.view];
        [self.avPlayVc.player play];
    }
}
#pragma mark 视图由小变大
-(void)SetAnimation:(UIView *)view
{
    
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:1 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 delay:0 usingSpringWithDamping:1 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
            view.transform=CGAffineTransformMakeScale(0.01, 0.01);
            
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 delay:0.2 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
                view.transform=CGAffineTransformMakeScale(1, 1);
                
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionTransitionCurlDown animations:^{
                    [self.view layoutIfNeeded];
                } completion:nil];
            }];
        }];
    }];
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=YES;

}
@end
