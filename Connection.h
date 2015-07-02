//
//  Connection.h
//  TEST_BY_NAT
//
//  Created by POSCO on 15/07/02.
//  Copyright (c) 2015年 POSCO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Connection : NSObject
+ (void) sendToHost:(NSURL *) host withKey:(NSString *) key withValue:(NSString *) value byCaller:(UITextView *)caller ;
+ (void) sendToHost:(NSURL *) host withData:(NSString *) data byCaller: (UITextView *) caller;
@end
