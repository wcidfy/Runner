//
//  NewsDetailView.h
//  Runner
//
//  Created by lxx on 16/7/15.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsDetailModel.h"
/**
 *  创建可滚动的cel点击之后详情界面view
 */
@interface NewsDetailView : UIScrollView
@property(nonatomic,strong)NewsDetailModel *detailItem;
@end
