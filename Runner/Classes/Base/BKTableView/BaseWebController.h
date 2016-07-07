//
//  BaseWebController.h
//  Runner
//
//  Created by lxx on 16/6/28.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "BaseViewController.h"
/**
 *  网页 基类
 */
@interface BaseWebController : BaseViewController
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, copy) NSString *urlString;
@property (nonatomic, copy) NSString *titleString;
@property (nonatomic, copy) NSString *rootTitle;


@end
