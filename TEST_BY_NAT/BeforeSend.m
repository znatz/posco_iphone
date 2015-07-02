//
//  BeforeSend.m
//  TEST_BY_NAT
//
//  Created by POSCO on 15/06/29.
//  Copyright (c) 2015年 POSCO. All rights reserved.
//

#import "BeforeSend.h"
#import "Connection.h"

@interface BeforeSend () <NSURLConnectionDelegate>
@property NSMutableData *_responseData;

@end

@implementation BeforeSend

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.OrderBeforeSend.text = @"";
    [super viewDidLoad];
    // BG setup
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"msg.png"]];
    [background setOpaque:YES];
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
    
    
    // Prepare to send
    NSLog(@"%d", [self.totalOrder count]);
    NSMutableString * orderString = [[NSMutableString alloc] initWithString:@""];
    for(int i=0; i<self.totalOrder.count; i++) {
        [orderString appendString:[
                                   NSString stringWithFormat:@"%@ %@\n",
                                   self.totalOrder[i][0],
                                   self.totalOrder[i][1]
                                ]
         ];
    }
//    self.OrderBeforeSend.text = orderString;

    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@" YYYY-MM-dd HH:mm:ss"];
    orderString = [NSString stringWithFormat:@"%@ %@",[formatter stringFromDate:[NSDate date]], orderString];
    
    self.OrderBeforeSend.text = @"注文しました";
    [Connection sendToHost:[[NSUserDefaults standardUserDefaults] URLForKey:@"host"]  withData:orderString
     byCaller:self.OrderBeforeSend];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// Handle Connection To Remote Server
#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
}


@end
