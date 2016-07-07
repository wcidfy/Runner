//
//  NSObject+AddTimeid.m
//  Runner
//
//  Created by lxx on 16/7/5.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "NSObject+AddTimeid.h"

@implementation NSObject (AddTimeid)
+ (void)setTimeidAttributeWithModelArray:(NSArray *)modelArray timeName:(NSString *)timeName
{
    
    for (NSObject *item in modelArray) {
        NSString *timeStr = [item valueForKey:timeName];
        
        NSString *str1 = timeStr;
        
        // 创建设置日期格式
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        format.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        // 设置时间为北京时区
        [format setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Beijing"]];
        // 调用NSDateFormatter的对象方法得到NSDate  @"yyyy-MM-dd HH:mm:ss"
        NSDate *newsDate1 = [format dateFromString:str1];
        
        NSDateFormatter *customFormat1 = [[NSDateFormatter alloc] init];
        customFormat1.dateFormat = @"yyyyMMddHHmmss";
        NSString *customDateStr1 = [customFormat1 stringFromDate:newsDate1];
        
        long timeIndex = (long)[customDateStr1 longLongValue];
        
        NSNumber *timeid = [item valueForKey:@"timeid"];
        timeid = @(timeIndex);
        [item setValue:timeid forKey:@"timeid"];
    }
    
}

@end
