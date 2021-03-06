//
//  Connection.h
//  TEST_BY_NAT
//
//  Created by POSCO on 15/06/29.
//  Copyright (c) 2015年 POSCO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
@interface MyDB : NSObject 
+ (FMDatabase *) connect;
+ (NSMutableArray *) findAllTitle ;
+ (void) insertMenu:(NSString *) title ;
+ (void) updateMenuAtIndex:(NSInteger) i withTitle:(NSString *) t;
+ (void) deleteMenu:(NSInteger) i ;
+ (void) executeUpdate:(NSString *) sql;
+ (NSMutableArray *) getColumnOfIndex:(int)index FromTable:(NSString *)table;
@end
