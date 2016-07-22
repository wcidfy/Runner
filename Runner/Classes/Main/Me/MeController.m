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
#import "CellModel.h"
#import "ORIndicatorView.h"

static NSString * const ID = @"collection";
@interface MeController ()<UICollectionViewDelegate,UICollectionViewDataSource,BKTableViewAdapterDelegate>

@property(nonatomic,strong)MeTableView *meTableView;
@property(nonatomic,strong)MeTableAdapter *meTableAdapter;

@property(nonatomic,strong)NSArray<ItemsModel*> *itemArray;
@property(nonatomic,strong)UICollectionView *collectionV;
@property(nonatomic,strong)NSMutableArray<CellModel*> *contentArray;
@end

@implementation MeController
-(NSArray *)itemArray
{
    if (_itemArray==nil) {
        _itemArray=[[NSArray alloc]init];
       
    }
    return _itemArray;
}
-(NSMutableArray *)contentArray
{
    
        _contentArray=[[NSMutableArray alloc]init];
       CellModel *model=[CellModel new];
        model.imageStr=@"tabbar_icon_me_highlight";
        model.titleStr=@"我的消息";
        [_contentArray addObject:model];
        
       model=[CellModel new];
        model.imageStr=@"tabbar_icon_me_highlight";
        model.titleStr=@"金币商城";
        [_contentArray addObject:model];
        
        model=[CellModel new];
        model.imageStr=@"tabbar_icon_me_highlight";
        model.titleStr=@"金币任务";
        [_contentArray addObject:model];
        
        model=[CellModel new];
        model.imageStr=@"tabbar_icon_me_highlight";
        model.titleStr=[NSString stringWithFormat:@"清出缓存 %@",[self getCacheSize]];
        [_contentArray addObject:model];
    
    return _contentArray;
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
    _meTableAdapter.delegate=self;
    [_meTableView setAdapter:_meTableAdapter];
    [self.view addSubview:_meTableView];
    UIView *view=[UIView new];
    view.frame=CGRectMake(0, 0, kScreenWidth, 40);
    UILabel *lable=[UILabel new];
    lable.text=@"  登录/注册";
    lable.frame=CGRectMake(0, 0, kScreenWidth, 40);
    [view addSubview:lable];
    _meTableView.dataTableView.tableHeaderView=view;
    [HttpTool getItemsCount:^(NSArray *array) {
        self.itemArray=array;
        [self setCollectionV];
        [_meTableView.dataTableView reloadData];
    }];
    _meTableAdapter.dataArray=self.contentArray;
    [self.meTableView refreshTableView];
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
#pragma mark - 计算缓存大小
-(NSString *)getCacheSize
{
    //定义变量存储总的缓存大小
        long long sumSize = 0;

       //01.获取当前图片缓存路径
        NSString *cacheFilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];

        //02.创建文件管理对象
       NSFileManager *filemanager = [NSFileManager defaultManager];
       //获取当前缓存路径下的所有子路径
        NSArray *subPaths = [filemanager subpathsOfDirectoryAtPath:cacheFilePath error:nil];
        //遍历所有子文件
        for (NSString *subPath in subPaths) {
                     //1）.拼接完整路径
                NSString *filePath = [cacheFilePath stringByAppendingFormat:@"/%@",subPath];
                    //2）.计算文件的大小
               long long fileSize = [[filemanager attributesOfItemAtPath:filePath error:nil]fileSize];
                    //3）.加载到文件的大小
                sumSize += fileSize;
            }
        float size_m = sumSize/(1000*1000);
    
       return [NSString stringWithFormat:@"%.2fM",size_m];
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

#pragma mark tableview点击代理
-(void)didTableViewCellSelected:(UITableViewCell *)aCellData{};
-(void)didTableViewSelected:(NSInteger)index
{
    if (index==3) {
        [ORIndicatorView showLoading];
        XXLog(@"111111");
        NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
        //    NSLog(@"文件数 ：%d",[files count]);
        for (NSString *p in files)
        {
            NSError *error;
            NSString *path = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",p]];
            if([[NSFileManager defaultManager] fileExistsAtPath:path])
            {
                [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
                
            }
            
        }
        [ORIndicatorView hideLoading];
        [MBProgressHUD showSuccess:@"清除缓存成功"];
        [self getCacheSize];
        _meTableAdapter.dataArray=self.contentArray;
        [self.meTableView.dataTableView reloadData];
    }
}

@end
