//
//  CommentController.h
//  Runner
//
//  Created by lxx on 16/7/19.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsDetailModel.h"
/**
 *  评论视图
 */
@interface CommentController : UIViewController
@property(nonatomic,strong)NSString *docid;
@property(nonatomic,strong)NSString *boardid;
@property(nonatomic,strong)NewsDetailModel *detailList;
@end
