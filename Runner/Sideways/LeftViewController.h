//
//  LeftViewController.h
//  Runner
//
//  Created by lxx on 16/6/23.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"

/**
 *  侧滑左边 controller
 */
@interface LeftViewController : UIViewController<SlideNavigationControllerDelegate>
typedef NS_ENUM(NSInteger)
{
    CellTypePerson=0,//个人
    CellTypeCert,//认证
     CellTypeIssue,//发布任务
    CellTypeAgree,//接收任务
     CellTypeRecommend,//推荐
    CellTypeMyNumber,//我的积分
     CellTypeSetting//设置

}cellType;


@end
