//
//  NewsDetailController.h
//  Runner
//
//  Created by lxx on 16/7/15.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsListItems.h"
#import "NewsDetailModel.h"

@interface NewsDetailController : UIViewController
@property(nonatomic,strong)NewsListItems *listItem;
@property(nonatomic,strong)NewsDetailModel *detailItem;
@end
