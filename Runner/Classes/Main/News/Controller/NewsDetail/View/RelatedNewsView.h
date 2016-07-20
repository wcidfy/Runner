//
//  RelatedNewsView.h
//  Runner
//
//  Created by lxx on 16/7/20.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsDetailModel.h"
/**
 *  相关新闻View
 */
@interface RelatedNewsView : UIView
@property(nonatomic,strong)NewsDetailModel *detailList;
@property(nonatomic,assign)CGFloat viewHeight;
+(CGFloat)heightWithDetailItem:(NewsDetailModel *)detailList;
@end
