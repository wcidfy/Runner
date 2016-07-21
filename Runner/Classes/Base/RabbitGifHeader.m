//
//  RabbitGifHeader.m
//  Runner
//
//  Created by lxx on 16/7/21.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "RabbitGifHeader.h"
@interface RabbitGifHeader()
@property(nonatomic,strong)NSArray *imagesArray;
@end

@implementation RabbitGifHeader
-(NSArray *)imagesArray
{
    if(_imagesArray==nil)
    {
        _imagesArray = @[[UIImage imageNamed:@"image1.png"],[UIImage imageNamed:@"image3.png"],
                         [UIImage imageNamed:@"image1.png"],[UIImage imageNamed:@"image3.png"],
                         [UIImage imageNamed:@"image2.png"],[UIImage imageNamed:@"image4.png"],
                         [UIImage imageNamed:@"image2.png"],[UIImage imageNamed:@"image4.png"]];
    }
    return _imagesArray;
}
-(void)prepare
{
    [super prepare];
    //时间面板隐藏
    self.lastUpdatedTimeLabel.hidden=YES;
    //状态面板隐藏
    self.stateLabel.hidden=YES;
    [self setImages:self.imagesArray forState:MJRefreshStateIdle];
    [self setImages:self.imagesArray forState:MJRefreshStatePulling];
    [self setImages:self.imagesArray forState:MJRefreshStateRefreshing];
}
@end
