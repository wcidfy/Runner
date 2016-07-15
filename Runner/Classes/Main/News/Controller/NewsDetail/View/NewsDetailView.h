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
@interface NewsDetailView : UIView
@property(nonatomic,strong)NewsDetailModel *detailItem;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,assign)CGFloat viewHeight;

@end
