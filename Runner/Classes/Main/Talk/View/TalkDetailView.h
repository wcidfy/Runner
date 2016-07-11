//
//  TalkDetailView.h
//  Runner
//
//  Created by lxx on 16/7/11.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TalkListItem.h"
/**
 *  话题详情页View
 */
@interface TalkDetailView : UIView
@property(nonatomic,strong)UIView *topView;
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)UILabel *titleLable;

@property(nonatomic,strong)UIImageView *headBgV;

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIView *imageBottonView;
@property(nonatomic,strong)UILabel  *lableTop;
@property(nonatomic,strong)UILabel *lableBotton;
@property(nonatomic,strong)UIButton *attentionButton;;

-(void)setImageBottonWith:(TalkListItem *)listItem;
@end
