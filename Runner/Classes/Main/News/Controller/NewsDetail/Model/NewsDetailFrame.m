//
//  NewsDetailFrame.m
//  Runner
//
//  Created by lxx on 16/7/15.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "NewsDetailFrame.h"
#import "HotsView.h"
#define DetailLeftX 10
#define DetailTopY 15
#define TopBarH 0
@implementation NewsDetailFrame
-(NSMutableArray *)pictureFs
{
    if (!_pictureFs) {
        _pictureFs=[[NSMutableArray alloc]init];
    }
    return _pictureFs;
}
-(NSMutableArray *)altFs
{
    if (!_altFs) {
        _altFs=[[NSMutableArray alloc]init];
    }
    return _altFs;
}
-(void)setDetailList:(NewsDetailModel *)detailList
{
    _detailList=detailList;
    CGFloat titleX=DetailLeftX;
    CGFloat titleY=TopBarH;
    CGSize titleSize=[detailList.title boundingRectWithSize:CGSizeMake(kScreenWidth-DetailLeftX*2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    _titleF=(CGRect){titleX,titleY,titleSize};

    CGFloat timeX=DetailLeftX;
    CGFloat timeY=titleY+titleSize.height;
    CGSize timeSize=[detailList.ptime sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    _timeF=(CGRect){timeX,timeY,timeSize};
    
    CGFloat souceX=DetailLeftX*2+timeSize.width;
    CGFloat souceY=timeY;
    CGSize souceSize=[detailList.source sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    _souceF=(CGRect){souceX,souceY,souceSize};
    
    
// 文字内容 加图片内容
    for(int i=0;i<detailList.img.count;i++)
    {
    if(detailList.img[i][@"pixel"])
    {
        //根据请求数据截取图片宽高
        NSString *imageSizeStr=detailList.img[i][@"pixel"];
        NSInteger imgLoc=[imageSizeStr rangeOfString:@"*"].location;
         NSString *strW = [imageSizeStr substringToIndex:imgLoc];
        NSString *strH=[imageSizeStr substringFromIndex:imgLoc+1];
        CGFloat imgH=(kScreenWidth-DetailLeftX*2)*[strH intValue]/[strW intValue];
        CGFloat imgW=kScreenWidth-DetailLeftX*2;
        CGFloat imgX=DetailLeftX;
        CGFloat imgY=timeY+timeSize.height+DetailLeftX+_totalPicH;
        CGRect imgF=CGRectMake(imgX, imgY, imgW, imgH);
        [self.pictureFs addObject:[NSValue valueWithCGRect:imgF]];
        //图片描述
        NSString *imgDescribeStr=detailList.img[i][@"alt"];
        CGSize altSize=[imgDescribeStr boundingRectWithSize:CGSizeMake(kScreenWidth-DetailLeftX*2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size ;
        CGFloat altX=imgX;
        CGFloat altY=imgY+imgH;
        CGRect altF=(CGRect){altX,altY,altSize};
        [self.altFs addObject:[NSValue valueWithCGRect:altF]];
        //计算视图总高度 每个图片内容之间相隔DetailLeftX*2
        _totalPicH+=imgH+altF.size.height+DetailLeftX*2;
        
       
        
    }
    }
    
    CGFloat contentY=_totalPicH+souceY+souceSize.height;
    CGFloat contentX=DetailLeftX;
    CGSize contentsize=[detailList.body boundingRectWithSize:CGSizeMake(kScreenWidth-DetailLeftX*2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size;
    _contentF=(CGRect){contentX,contentY,contentsize};
    
    CGSize ecSize=[detailList.ec sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    CGFloat ecX=kScreenWidth-ecSize.width-DetailLeftX;
    CGFloat ecY=contentY+contentsize.height;
    _ecF=(CGRect){ecX,ecY,ecSize};
    
    CGFloat shareX=0;
    CGFloat shareY=ecY+ecSize.height+DetailTopY;
    CGFloat shareW=kScreenWidth;
    CGFloat shareH=80;
    _shareF=(CGRect){shareX,shareY,shareW,shareH};
    
    CGFloat replyX=DetailLeftX;
    CGFloat replyY=shareY+shareH+DetailTopY;
    CGFloat replyW=kScreenWidth-2*DetailLeftX;
    CGFloat replyH=0;
    if (_detailList.replys.count!=0) {
        replyH=[HotsView HeightWithHotsArray:_detailList.replys];
    }
    _replyF=(CGRect){replyX,replyY,replyW,replyH};
    
    
    _totalHeight=+replyH+DetailTopY*3+shareH+ecSize.height+contentsize.height+_totalPicH+souceSize.height+titleSize.height+64;
}
@end
