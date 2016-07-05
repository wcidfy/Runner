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
@interface NewsPhotoController()
@property(nonatomic,strong)NSArray<NewsPhotoModel*> *photoArray;
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

    [HttpTool getNewsDetailWithPhotoid:self.photoUrl complete:^(NSArray *array) {
        
        self.photoArray=array;
        
    }];
}

-(void)viewWillAppear:(BOOL)animated
{
     [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=YES;
}
@end
