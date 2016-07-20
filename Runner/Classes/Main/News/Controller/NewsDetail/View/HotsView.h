//
//  HotsView.h
//  Runner
//
//  Created by lxx on 16/7/18.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotsView : UIView
@property(nonatomic,strong)NSArray *hotArray;
@property(nonatomic,assign)CGFloat hotsHeight;

+(CGFloat)HeightWithHotsArray:(NSArray *)hotsArray;
@end
