//
//  NewsPhotoController.h
//  Runner
//
//  Created by lxx on 16/7/6.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsListItems.h"
/**
 *  图集控制器
 */
@interface NewsPhotoController : UIViewController
@property(nonatomic,copy)NSString *photoUrl;
@property(nonatomic,strong)NewsListItems *listItem;
@end
