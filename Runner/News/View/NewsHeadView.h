//
//  NewsHeadView.h
//  Runner
//
//  Created by lxx on 16/7/5.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsListItems.h"
/**
 *  头部广告视图
 */
@interface NewsHeadView : UIView
@property(nonatomic,strong)NewsListItems *contItem;
@property(nonatomic,strong)void(^adClickBlock)(NewsListItems *,NSInteger index);

@end
