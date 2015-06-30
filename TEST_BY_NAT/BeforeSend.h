//
//  BeforeSend.h
//  TEST_BY_NAT
//
//  Created by POSCO on 15/06/29.
//  Copyright (c) 2015年 POSCO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeforeSend : UIViewController

@property NSMutableArray *order;
@property (weak, nonatomic) IBOutlet UITextView *OrderBeforeSend;
@property NSMutableArray * totalOrder;
@end
