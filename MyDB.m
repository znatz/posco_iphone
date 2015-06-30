//
//  Connection.m
//  TEST_BY_NAT
//
//  Created by POSCO on 15/06/29.
//  Copyright (c) 2015年 POSCO. All rights reserved.
//

#import "MyDB.h"
#import "FMDatabase.h"

@implementation MyDB
NSString * const DB_NAME = @"test.db";

+ (FMDatabase *) connect {
NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
NSString *db_path = [[paths objectAtIndex:0] stringByAppendingPathComponent:DB_NAME];
    FMDatabase *db = [FMDatabase databaseWithPath:db_path];
    return db;
}

+ (void)executeUpdate:(NSString *)sql {
    FMDatabase *db = [self connect];
    [db open];
    [db executeUpdate:sql];
    [db close];
}

+ (NSMutableArray *) getColumnOfIndex:(int)index FromTable:(NSString *)table {
    NSMutableArray * result = [[NSMutableArray alloc] init];
    NSString * sql = [NSString stringWithFormat:@"SELECT * FROM %@", table];
    NSLog(@"%@",sql);
    FMDatabase * db = [self connect];
    [db open];
    FMResultSet * rs = [db executeQuery:sql];
    while ([rs next]) {
        NSString * jap = [NSString stringWithUTF8String:[[rs stringForColumnIndex:index] UTF8String]];
//        [result addObject:[rs stringForColumnIndex:index]];
        [result addObject:jap];
    }
    [db close];
//    NSLog(@"%@", [NSString stringWithUTF8String: [result[0] UTF8String]]);
//    NSLog(@"%@", result[0]);
    return result;
}
@end
