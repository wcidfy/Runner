//
//  NewsDetailView.h
//  Runner
//
//  Created by lxx on 16/7/15.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsDetailModel.h"
#import "ShareBut.h"
/**
 *  创建可滚动的cel点击之后详情界面view
 */
@interface NewsDetailView : UIView
@property(nonatomic,strong)NewsDetailModel *detailItem;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,assign)CGFloat viewHeight;
@property(nonatomic,strong)UIView *shareView;

@property(nonatomic,strong)ShareBut *sinaButton;
@property(nonatomic,strong)ShareBut *wxButton;
@property(nonatomic,strong)ShareBut *qqButton;

@property(nonatomic,strong)void(^hotBlock)();
@end
