//
//  NewsDetailItem.m
//  Runner
//
//  Created by lxx on 16/7/15.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "NewsDetailItem.h"

@implementation NewsDetailItem
+(NewsDetailModel *)itemWithDetailItem:(NewsDetailModel*)item complete:(void(^)(id))complete
{
    item.body=[item.body stringByReplacingOccurrencesOfString:@"</p><p>" withString:@"\n\n"];
    item.body=[item.body stringByReplacingOccurrencesOfString:@"</p>" withString:@"\n"];
    item.body=[item.body stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
    for (int i=0; i<=20; i++) {
        item.body=[item.body stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"<!--IMG#%d-->",i] withString:@""];
    }
    
    
    NSMutableArray *mutableArray=[[NSMutableArray alloc]init];
    for (int i=0; i<100; i++) {
        if ([item.body containsString:@"<strong>"]) {
            NSRange rangBegin=[item.body rangeOfString:@"<strong>"];
            NSInteger locBegin=rangBegin.location;
            
            NSRange rangEnd=[item.body rangeOfString:@"</strong>"];
            NSInteger locEnd=rangEnd.location;
            [mutableArray addObject:[NSValue valueWithRange:NSMakeRange(locBegin, locEnd-locBegin)]];
            complete(mutableArray);
            item.body=[item.body stringByReplacingCharactersInRange:rangBegin withString:@""];
            item.body=[item.body stringByReplacingCharactersInRange:rangEnd withString:@""];

        }
    }
    for (int i=0; i<100; i++) {
        if ([item.body containsString:@"<b>"]) {
            NSRange rangBegin=[item.body rangeOfString:@"<b>"];
            NSInteger locBegin=rangBegin.location;
            
            NSRange rangEnd=[item.body rangeOfString:@"</b>"];
            NSInteger locEnd=rangEnd.location;
            [mutableArray addObject:[NSValue valueWithRange:NSMakeRange(locBegin, locEnd-locBegin)]];
            complete(mutableArray);
            item.body=[item.body stringByReplacingCharactersInRange:rangBegin withString:@""];
            item.body=[item.body stringByReplacingCharactersInRange:rangEnd withString:@""];

        }
    }
    return item;
}

@end
