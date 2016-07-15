//
//  NewsDetailFrame.m
//  Runner
//
//  Created by lxx on 16/7/15.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "NewsDetailFrame.h"
#define DetailLeftX 10
#define DetailTopY 15
#define TopBarH 64
@implementation NewsDetailFrame
-(void)setDetailList:(NewsDetailModel *)detailList
{
    _detailList=detailList;
    CGFloat titleX=DetailLeftX;
    CGFloat titleY=TopBarH+DetailTopY;
    CGSize titleSize=[detailList.title boundingRectWithSize:CGSizeMake(kScreenWidth-DetailLeftX*2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    _titleF=(CGRect){titleX,titleY,titleSize};

    CGFloat timeX=DetailLeftX;
    CGFloat timeY=TopBarH+DetailTopY+titleSize.height;
    CGSize timeSize=[detailList.ptime sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    _timeF=(CGRect){timeX,timeY,timeSize};
    
    CGFloat souceX=DetailLeftX*2+timeSize.width;
    CGFloat souceY=timeY;
    CGSize souceSize=[detailList.source sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    _souceF=(CGRect){souceX,souceY,souceSize};
    
    
// 文字内容 加图片内容
    XXLog(@"______________________________%@",detailList.img[0][@"pixel"]);
//    for(int i=0;i<detailList.img.count;i++)
//    {
//    
//    
//    }
}
@end
