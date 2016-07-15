//
//  NewsPhotoController.m
//  Runner
//
//  Created by lxx on 16/7/6.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "NewsPhotoController.h"
#import "HttpTool.h"
#import "UIImageView+WebCache.h"
#import "PhotoTitle.h"
static NSString * const ID = @"collecPhoto";
@interface NewsPhotoController()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView *imageCollecV;
@property(nonatomic,strong)PhotoTitle *photoTitle;
@end
@implementation NewsPhotoController
//-(NSArray *)photoArray
//{
//    if (_photoArray==nil) {
//        _photoArray=[[NSArray alloc]init];
//        
//    }
//    return _photoArray;
//}
-(void)viewDidLoad
{
    [self setcollectionV];

    [HttpTool getNewsDetailWithPhotoid:self.photoUrl complete:^(NSArray *array) {
        
        self.photoArray=array;
        self.imageCollecV.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        [self.imageCollecV reloadData];
        [self setDetailview];
    }];
   
    [self setTopBack];
}
-(void)setDetailview
{
    _photoTitle=[[PhotoTitle alloc]init];
    _photoTitle.photoItem=self.photoArray[0];
    CGFloat H=[PhotoTitle heightWithPhoto:self.photoArray[0]];
    _photoTitle.frame=CGRectMake(0, kScreenHeight-H-10, kScreenWidth-10, H);
    _photoTitle.pageCountL.text=[NSString stringWithFormat:@"1/%ld",(unsigned long)_photoArray.count];
    [self.view addSubview:_photoTitle];
}
#pragma mark  创建collectionView
-(void)setcollectionV
{
    //布局
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
   //尺寸
    layout.itemSize=self.view.bounds.size;
    layout.minimumLineSpacing=0;
    layout.minimumInteritemSpacing=0;
    //横向布局
    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;

    UICollectionView *collecV=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    //背景图片
    UIImageView *backgroundV=[UIImageView new];
    backgroundV.image=[UIImage imageNamed:@"photosetBackGround"];
    backgroundV.frame=collecV.bounds;
    collecV.backgroundView=backgroundV;
    collecV.pagingEnabled=YES;
    //数据源
    collecV.delegate=self;
    collecV.dataSource=self;
    //注册cell
    [collecV registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    [self.view addSubview:collecV];
    self.imageCollecV=collecV;
}
-(void)setPhotoArray:(NSArray*)photoArray
{

    _photoArray=photoArray;
}
#pragma mark 上面的返回按钮
-(void)setTopBack
{
    // 左边返回按钮
    UIButton *backBtn = [[UIButton alloc] init];
    backBtn.frame = CGRectMake(10, 20, 40, 40);
    [backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImage:[UIImage imageNamed:@"weather_back"] forState:UIControlStateNormal];
    [self.view addSubview:backBtn];
}
#pragma mark 返回
-(void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];

}

#pragma mark collectionView代理
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.photoArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    // 消除循环利用数据错误
    [cell.subviews.lastObject removeFromSuperview];
    UIImageView *imageV=[UIImageView new];
    [imageV sd_setImageWithURL:[NSURL URLWithString:self.photoArray[indexPath.row].imgurl] placeholderImage:[UIImage imageNamed:@"newsTitleImage"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [imageV sizeToFit];
        imageV.bounds = CGRectMake(0, 0, kScreenWidth, imageV.bounds.size.height * kScreenWidth/imageV.bounds.size.width);
        imageV.center = CGPointMake(kScreenWidth/2, kScreenHeight/2);
    }];
    [cell addSubview:imageV];
    return cell;
}
-(void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=YES;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/kScreenWidth;
    self.photoTitle.photoItem = _photoArray[index];
    self.photoTitle.pageCountL.text = [NSString stringWithFormat:@"%ld/%ld",index+1,_photoArray.count];
    CGFloat H=[PhotoTitle heightWithPhoto:self.photoArray[index]];
    _photoTitle.frame=CGRectMake(0, kScreenHeight-H-10, kScreenWidth-10, H);
    [self.view addSubview:_photoTitle];
}
@end
