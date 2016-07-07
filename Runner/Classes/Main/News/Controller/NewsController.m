//
//  NewsController.m
//  Runner
//
//  Created by lxx on 16/7/4.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "NewsController.h"
#import "NewsListController.h"
#import "NewsModel.h"
#import "MJExtension.h"
@interface NewsController ()
@property(nonatomic,strong)NSArray <NewsModel*>*newsArray;
@end

@implementation NewsController
-(NSArray *)newsArray
{
    if (_newsArray==nil) {
      
        _newsArray = [NewsModel mj_objectArrayWithFilename:@"NewsURLs.plist"];
    }
    return _newsArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor grayColor];
    [self setControllers];
    [self setPrepare];
}

-(void)setControllers
{
    NewsListController *headVc=[NewsListController new];
    headVc.title=self.newsArray[0].title;
    headVc.pgmid=self.newsArray[0].urlString;
    [self addChildViewController:headVc];
    
    NewsListController *NBAVc=[NewsListController new];
    NBAVc.title=self.newsArray[1].title;
    NBAVc.pgmid=self.newsArray[1].urlString;
    [self addChildViewController:NBAVc];
    
    NewsListController *phoneVc=[NewsListController new];
    phoneVc.title=self.newsArray[2].title;
    phoneVc.pgmid=self.newsArray[2].urlString;
    [self addChildViewController:phoneVc];
    
    NewsListController *moveVc=[NewsListController new];
    moveVc.title=self.newsArray[3].title;
    moveVc.pgmid=self.newsArray[3].urlString;

    [self addChildViewController:moveVc];
    
    NewsListController *amuseVc=[NewsListController new];
    amuseVc.title=self.newsArray[4].title;
    amuseVc.pgmid=self.newsArray[4].urlString;

    [self addChildViewController:amuseVc];
    
    NewsListController *fashionVc=[NewsListController new];
    fashionVc.title=self.newsArray[5].title;
    fashionVc.pgmid=self.newsArray[5].urlString;

    [self addChildViewController:fashionVc];
    
    NewsListController *filmVc=[NewsListController new];
    filmVc.title=self.newsArray[6].title;
    filmVc.pgmid=self.newsArray[6].urlString;

    [self addChildViewController:filmVc];
    
    NewsListController *scienceVc=[NewsListController new];
    scienceVc.title=self.newsArray[7].title;
    scienceVc.pgmid=self.newsArray[7].urlString;

    [self addChildViewController:scienceVc];
    
    

}
@end
