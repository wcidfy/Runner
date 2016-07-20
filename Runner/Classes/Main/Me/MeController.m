//
//  MeController.m
//  Runner
//
//  Created by lxx on 16/7/20.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "MeController.h"
#import "MeTableView.h"
#import "HttpTool.h"
#import "MeTableAdapter.h"
#import "CollectionItemCell.h"
#import "BaseWebController.h"
static NSString * const ID = @"collection";
@interface MeController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)MeTableView *meTableView;
@property(nonatomic,strong)MeTableAdapter *meTableAdapter;

@property(nonatomic,strong)NSArray<ItemsModel*> *itemArray;
@property(nonatomic,strong)UICollectionView *collectionV;

@end

@implementation MeController
-(NSArray *)itemArray
{
    if (_itemArray==nil) {
        _itemArray=[[NSArray alloc]init];
    }
    return _itemArray;
}
//-(void)loadView
//{
//    [super loadView];
//    _meTableView=[MeTableView new];
//    self.view=_meTableView;
//    _meTableAdapter=[MeTableAdapter new];
//    [_meTableView setAdapter:_meTableAdapter];
    

//}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _meTableView=[[MeTableView alloc]init];
    _meTableView.frame=CGRectMake(0, 64, kScreenWidth, kScreenHeight-64-49);
    _meTableAdapter=[MeTableAdapter new];
    [_meTableView setAdapter:_meTableAdapter];
    [self.view addSubview:_meTableView];
    UIView *view=[UIView new];
    view.frame=CGRectMake(0, 0, kScreenWidth, 40);
    UILabel *lable=[UILabel new];
    lable.text=@"登录/注册";
    lable.frame=CGRectMake(0, 0, kScreenWidth, 40);
    [view addSubview:lable];
    _meTableView.dataTableView.tableHeaderView=view;
    [HttpTool getItemsCount:^(NSArray *array) {
        self.itemArray=array;
        [self setCollectionV];
        [_meTableView.dataTableView reloadData];
    }];
}
-(void)setCollectionV
{
   
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    // 纵向布局
    layout.scrollDirection=UICollectionViewScrollDirectionVertical;
    //item 大小 间距
    CGFloat itemW=(kScreenWidth-20*5)/4;
    layout.itemSize=CGSizeMake(itemW, itemW);
    layout.minimumLineSpacing=20;
    layout.minimumInteritemSpacing=20;
//    layout.user
    _collectionV=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectionV.delegate=self;
    _collectionV.dataSource=self;
//    计算高度
   CGFloat H= self.itemArray.count/4*(itemW+20);
    _collectionV.frame=CGRectMake(0, 0, kScreenWidth, H);
    _collectionV.backgroundColor=[UIColor whiteColor];
    [_collectionV registerClass:[CollectionItemCell class] forCellWithReuseIdentifier:ID];
    _meTableView.dataTableView.tableFooterView=_collectionV;
    

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.itemArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionItemCell *cell=[self.collectionV dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.itemList=self.itemArray[indexPath.row];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    BaseWebController *web=[BaseWebController new];
    web.urlString=self.itemArray[indexPath.row].url;
    [self.navigationController pushViewController:web animated:YES];
    XXLog(@"%ld",(long)indexPath.row);
}
@end
