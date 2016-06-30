//
//  OneView.h
//  Runner
//
//  Created by lxx on 16/6/28.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "BKTableView.h"
#import "JCTopic.h"
/**
 *  one View
 */
@interface OneView : BKTableView
@property(nonatomic, strong) JCTopic *topScrollView;
@property(nonatomic, strong) UIPageControl *pangeControl;
- (void)setCarousel:(NSMutableArray *)array;
@end
