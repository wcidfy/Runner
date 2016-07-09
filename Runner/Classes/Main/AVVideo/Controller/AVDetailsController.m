//
//  AVDetailsController.m
//  Runner
//
//  Created by lxx on 16/7/9.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "AVDetailsController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
@interface AVDetailsController()
@property(nonatomic,strong)UIView *movieView;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)AVPlayerViewController *avPlayVc;
@property(nonatomic,strong)AVPlayer *avPlayer;
@property(nonatomic,strong)AVPlayerItem *avPlayerItem;



@property (nonatomic, strong) UIButton *backBtn;

@end
@implementation AVDetailsController
-(UIView *)movieView
{
    if (_movieView==nil) {
        _movieView=[[UIView alloc]init];
//        _movieView.frame=CGRectMake(0, 0, kScreenWidth, 250);
        _movieView.backgroundColor=[UIColor whiteColor];
        [self.view addSubview:_movieView];
    }
   return  _movieView;
}
-(AVPlayerViewController *)avPlayVc
{
    if (_avPlayVc==nil) {
        _avPlayVc=[AVPlayerViewController new];
    }
    return _avPlayVc;
}
-(void)viewDidLoad
{
   
    [super viewDidLoad];
    
    self.movieView.frame=CGRectMake(0, 0, kScreenWidth, 250);
    
    [self setPlayMovies];
    [self setBackButton];
}
#pragma mark - 返回
- (void)setBackButton
{
    UIButton *backBtn = [[UIButton alloc] init];
    [backBtn setImage:[UIImage imageNamed:@"weather_back"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(5, 5, 40, 40);
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.movieView addSubview:backBtn];
    self.backBtn = backBtn;
}
#pragma mark 视屏界面初始化
-(void)setPlayMovies
{
    self.avPlayVc.showsPlaybackControls = YES;
    self.avPlayerItem=[[AVPlayerItem alloc]initWithURL:[NSURL URLWithString:_avList.mp4_url]];
    self.avPlayer=[[AVPlayer alloc]initWithPlayerItem:_avPlayerItem];
    self.avPlayVc.player=_avPlayer;
    self.avPlayVc.view.frame=self.movieView.bounds;
    [self.movieView addSubview:self.avPlayVc.view];
    
    [self.avPlayVc.player play];

}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];

}
@end
