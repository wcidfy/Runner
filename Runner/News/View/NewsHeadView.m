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
        _titleLable.textColor=[UIColor redColor];
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
    _titleLable.frame=CGRectMake(0, 180, kScreenWidth, 20);
    _pageControl.frame=CGRectMake(kScreenWidth-100, 180, 100, 20);
}
-(void)setContItem:(NewsListItems *)contItem
{
    _contItem=contItem;
    if (contItem.ads==nil) return;
     self.adItemArray=contItem.ads;
//     XXLog(@"%@  %@",contItem.ads,self.adItemArray);
    [self setCollectView];
    self.titleLable.text=self.adItemArray[0].title;
    self.pageControl.numberOfPages=self.adItemArray.count;
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
    [collectionV scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:5000 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];

}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
   NSInteger indexPage = self.indexPath.row%self.adItemArray.count;
    self.pageControl.currentPage=indexPage;
    self.titleLable.text=self.adItemArray[indexPage].title;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return 10000;
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
    XXLog(@"%d",5000%4);

    [headImageV sd_setImageWithURL:[NSURL URLWithString:self.adItemArray[self.indexPath.row%self.adItemArray.count].imgsrc] placeholderImage:[UIImage imageNamed:@"newsTitleImage"]];

    headImageV.frame=cell.bounds;
    [cell.contentView addSubview:headImageV];
        return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index=self.indexPath.row%self.adItemArray.count;
    if (self.adClickBlock) {
        self.adClickBlock(_contItem,index);
    }

}
@end
