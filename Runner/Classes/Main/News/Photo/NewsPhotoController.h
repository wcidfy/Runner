//
//  NewsPhotoController.h
//  Runner
//
//  Created by lxx on 16/7/6.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsListItems.h"
#import "NewsPhotoModel.h"
/**
 *  图集控制器
 */
@interface NewsPhotoController : UIViewController
/**
 *  用来获取选择的图集cell数据
 */
@property(nonatomic,strong)NSArray<NewsPhotoModel*> *photoArray;
@property(nonatomic,copy)NSString *photoUrl;
@property(nonatomic,strong)NewsListItems *listItem;
@end
