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
//NSString * const DB_NAME = @"test.db";
NSString * const DB_NAME = @"tmp.db";

+ (FMDatabase *) connect {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *db_path = [[paths objectAtIndex:0] stringByAppendingPathComponent:DB_NAME];
    FMDatabase *db = [FMDatabase databaseWithPath:db_path];
    NSString * sql = [NSString stringWithFormat:@"create table if not exists menu (id integer primary key autoincrement, title text);"];
    [db open];
    [db executeStatements:sql];
    return db;
}

+ (void)insertMenu:(NSString *) t {
    FMDatabase * db = [self connect];
    [db open];
    [db executeStatements:[NSString stringWithFormat:@"INSERT INTO menu(title) VALUES ('%@')", t]];
    [db close];
}

+ (void)deleteMenu:(NSInteger) i {
    FMDatabase * db = [self connect];
    [db open];
    [db executeStatements:[NSString stringWithFormat:@"DELETE FROM menu WHERE id = '%d'", i]];
    [db close];
}

+ (void)updateMenuAtIndex:(NSInteger)i withTitle:(NSString *)t {
    FMDatabase * db = [self connect];
    [db open];
    [db executeStatements:[NSString stringWithFormat:@"UPDATE menu SET title='%@' WHERE id = '%d'", t, i]];
    [db close];
}

+ (void)executeUpdate:(NSString *)sql {
    FMDatabase *db = [self connect];
    [db open];
    [db executeUpdate:sql];
    [db close];
}

+ (NSMutableArray *) findAllTitle {
    
    FMDatabase *db = [self connect];
    FMResultSet * rs;
    
    int count = 1000;
     
    
    [db open];
    rs = [db executeQuery:@"SELECT * FROM menu"];
    NSString *dummy = @"";
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:count];
    for (int i=0; i<count; i++) {
        [result addObject:dummy];
    }
    while ([rs next]) {
        NSString *jap = [NSString stringWithUTF8String:[[rs stringForColumnIndex:1] UTF8String]];
        
        [result insertObject:jap atIndex:[rs intForColumnIndex:0]-1];
    }
    [db close];
    NSLog(@"%@", result[0]);
    return result;
}

+ (NSMutableArray *) getColumnOfIndex:(int)index FromTable:(NSString *)table {
    
    FMDatabase * db = [self connect];

    int count;
    
    // Get Count of Row
    [db open];
    FMResultSet * rs = [db executeQuery:@"SELECT COUNT(title) FROM menu"];
    while ([rs next]) {
        count = [rs intForColumnIndex:0];
    }
    [db close];
    
    NSMutableArray * result = [[NSMutableArray alloc] initWithCapacity:count++];
    NSString * sql = [NSString stringWithFormat:@"SELECT * FROM %@", table];

    [db open];
    rs = [db executeQuery:sql];
    while ([rs next]) {
        NSString * jap = [NSString stringWithUTF8String:[[rs stringForColumnIndex:index] UTF8String]];
        [result addObject:jap];
    }
    [db close];

    return result;
}
@end
