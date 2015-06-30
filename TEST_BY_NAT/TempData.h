//
//  TempData.h
//  TEST_BY_NAT
//
//  Created by POSCO on 15/06/29.
//  Copyright (c) 2015年 POSCO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TempData : NSObject
@property NSMutableArray * tmpMA;
+ (void) set:(NSMutableArray *) val;
@end
