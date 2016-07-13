//
//  LeftView.h
//  Runner
//
//  Created by lxx on 16/6/23.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftView : BKTableView
/**
 *  头部 view
 */
@property(nonatomic,strong)UIView *headView;
/**
 *  头像
 */
@property(nonatomic,strong)UIImageView *headImage;
/**
 *  昵称
 */
@property(nonatomic,strong)UILabel *lableName;
/**
 *  性别图片
 */
@property(nonatomic,strong)UIImageView *sexImage;
/**
 *  性别
 */
@property(nonatomic,strong)UILabel *lableSex;
/**
 *  年龄
 */
@property(nonatomic,strong)UILabel *lableAge;
/**
 *  账户余额
 */
@property(nonatomic,strong)UILabel *lableMoney;
/**
 *  提现
 */
@property(nonatomic,strong)UIButton *withdrawButton;





@end
