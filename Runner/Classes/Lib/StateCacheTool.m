//
//  StateCacheTool.m
//  Runner
//
//  Created by lxx on 16/7/22.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "StateCacheTool.h"
#import "FMDB.h"
static FMDatabaseQueue *_baseQueue;
@implementation StateCacheTool
+(void)setupWithName:(NSString *)tname
{
    //在沙河路径中创建数据库
    NSString *file=[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject ] stringByAppendingPathComponent:@"states.sqlite"];
    _baseQueue=[FMDatabaseQueue databaseQueueWithPath:file];
    //创表
    [_baseQueue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:[NSString stringWithFormat:@"create table if not exists %@(id integer primary key autoincrement,timeid integer,dic blob);",tname]];
    }];

}
+(void)addStateCache:(NSArray *)array tname:(NSString *)tname
{

    NSString *t_name=[NSString stringWithFormat:@"t_%@",tname];
    [self setupWithName:t_name];
    for (NSObject *states in array) {
        long ptimeId=[[states valueForKey:@"timeid"]longValue];
        NSData *data=[NSKeyedArchiver archivedDataWithRootObject:states];
        [_baseQueue inDatabase:^(FMDatabase *db) {
            [db executeUpdate:[NSString stringWithFormat:@"insert into %@(timeid,dic)values(%ld,?);",t_name,ptimeId],data];
            // 删除重复记录
            [db executeUpdate:[NSString stringWithFormat:@"delete from %@ where id not in(select max(id) from %@ group by timeid)",t_name,t_name]];
        }];
        
    }
    [_baseQueue close];
}
+(NSMutableArray *)getStatusCache:(StatesParam*)param
{
    NSString *t_name=[NSString stringWithFormat:@"t_%@",param.modelName];
    [self setupWithName:t_name];
    NSMutableArray *statusArray=[NSMutableArray array];
    [_baseQueue inDatabase:^(FMDatabase *db) {
        //读取数据库
        FMResultSet *result=nil;
        if (param.timeid==0) {
            NSString *sql= [NSString stringWithFormat:@"select *from %@ order by timeid desc limit 0,%ld;",t_name,param.count];
            result=[db executeQuery:sql];
        }
        else if(param.timeid!=0)
        {
          NSString   *sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE timeid  <%ld ORDER BY idstr DESC LIMIT 20;",t_name, param.timeid];
            result=[db executeQuery:sql];
        
        }
        while (result.next) {
            NSObject *status=[NSKeyedUnarchiver unarchiveObjectWithData:[result dataForColumn:@"dic"]];
            //存入数组
            [statusArray addObject:status];
        }
       
    }];
    [_baseQueue close];
    return  statusArray;

}
@end
