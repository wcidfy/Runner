//
//  NewsHeadView.m
//  Runner
//
//  Created by lxx on 16/7/5.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "NewsHeadView.h"
#import "NewsHeadModel.h"
#import "UIImageView+WebCache.h"

static NSString *headId=@"headId";
@interface NewsHeadView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UILabel *titleLable;
@property(nonatomic,strong)UIPageControl *pageControl;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) UICollectionView *collectionV;

@property(nonatomic,strong)NSArray<NewsHeadModel*> *adItemArray;

@end
@implementation NewsHeadView
-(NSArray *)adItemArray
{
    if (_adItemArray==nil) {
        _adItemArray=[[NSArray alloc]init];
    }
    return _adItemArray;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        _titleLable=[UILabel new];
        _titleLable.font=[UIFont systemFontOfSize:16];
        _titleLable.textColor=[UIColor redColor];
        _titleLable.numberOfLines=0;
        [self addSubview:_titleLable];
        
        _pageControl=[UIPageControl new];
        _pageControl.currentPageIndicatorTintColor=[UIColor redColor];
        _pageControl.pageIndicatorTintColor=[UIColor grayColor];
        [self addSubview:_pageControl];
    
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    _titleLable.frame=CGRectMake(10, 180, kScreenWidth-20, 20);
    _pageControl.frame=CGRectMake(kScreenWidth-80, 170, 80, 10);
}
-(void)setContItem:(NewsListItems *)contItem
{
    _contItem=contItem;
    if (contItem.ads==nil) return;
     self.adItemArray=contItem.ads;
    XXLog(@"____%@",contItem.ads);
//     XXLog(@"%@  %@",contItem.ads,self.adItemArray);
    [self setCollectView];
    self.titleLable.text=self.adItemArray[0].title;
    self.pageControl.numberOfPages=self.adItemArray.count;
//单图 不可滚动 不加pageControll
//    if (self.adItemArray.count==1) {
//        self.pageControl.hidden=YES;
//        self.collectionV.scrollEnabled=NO;
//    }
}
-(void)setCollectView
{
    UICollectionViewFlowLayout *layout=({
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing=0;
        layout.itemSize=CGSizeMake(kScreenWidth, 200);
        layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        layout;
    });

    UICollectionView *collectionV=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 200) collectionViewLayout:layout];
    collectionV.backgroundColor=[UIColor greenColor];
    collectionV.pagingEnabled=YES;
    collectionV.scrollEnabled=YES;
    collectionV.showsVerticalScrollIndicator=NO;
    collectionV.showsHorizontalScrollIndicator=NO;
    collectionV.scrollsToTop=NO;
    collectionV.delegate=self;
    collectionV.dataSource=self;
    [self addSubview:collectionV];
    [self sendSubviewToBack:collectionV];
    [collectionV registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:headId];

    self.collectionV=collectionV;
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
   NSInteger indexPage = self.indexPath.row;
    self.pageControl.currentPage=indexPage;
    self.titleLable.text=self.adItemArray[indexPage].title;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.adItemArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.indexPath=indexPath;
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:headId forIndexPath:indexPath];
    if (cell.contentView.subviews.count) {
        [cell.contentView.subviews[0] removeFromSuperview];
    }
    UIImageView *headImageV=[[UIImageView alloc]init];
    headImageV.userInteractionEnabled=YES;

    [headImageV sd_setImageWithURL:[NSURL URLWithString:self.adItemArray[indexPath.row].imgsrc] placeholderImage:[UIImage imageNamed:@"newsTitleImage"]];

    headImageV.frame=cell.bounds;
    [cell.contentView addSubview:headImageV];
        return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.adClickBlock) {
        self.adClickBlock(_contItem,indexPath.row);
    }

}
@end
