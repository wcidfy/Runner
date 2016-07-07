//
//  NewsPhotoController.m
//  Runner
//
//  Created by lxx on 16/7/6.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "NewsPhotoController.h"
#import "HttpTool.h"
#import "NewsPhotoModel.h"
#import "UIImageView+WebCache.h"

static NSString * const ID = @"collecPhoto";
@interface NewsPhotoController()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)NSArray<NewsPhotoModel*> *photoArray;
@property(nonatomic,strong)UICollectionView *imageCollecV;
@end
@implementation NewsPhotoController
-(NSArray *)photoArray
{
    if (_photoArray==nil) {
        _photoArray=[[NSArray alloc]init];
        
    }
    return _photoArray;
}
-(void)viewDidLoad
{
    [self setcollectionV];

    [HttpTool getNewsDetailWithPhotoid:self.photoUrl complete:^(NSArray *array) {
        
        self.photoArray=array;
        self.imageCollecV.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        [self.imageCollecV reloadData];
        
    }];
   
    [self setTopBack];
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
@end
