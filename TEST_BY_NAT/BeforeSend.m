//
//  BeforeSend.m
//  TEST_BY_NAT
//
//  Created by POSCO on 15/06/29.
//  Copyright (c) 2015年 POSCO. All rights reserved.
//

#import "BeforeSend.h"

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
    self.OrderBeforeSend.text = [NSString stringWithFormat:@"注文しました"];
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@" YYYY-MM-dd HH:mm:ss"];
    orderString = [NSString stringWithFormat:@"%@ %@",[formatter stringFromDate:[NSDate date]], orderString];
    
     
    NSString *param = [NSString stringWithFormat:@"cusine=%@", orderString];
    
//    NSURLResponse * response = nil;
//    NSError * error = nil;
    
   
    NSMutableURLRequest *request;
    request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"POST"];
    [request setURL:[NSURL URLWithString:@"http://127.0.0.1:3000"]];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setTimeoutInterval:20];
    [request setHTTPShouldHandleCookies:FALSE];
    [request setHTTPBody:[param dataUsingEncoding:NSUTF8StringEncoding]];

    NSLog(@"%@", self.totalOrder[0][0]);
/*
    NSData * data = [NSURLConnection sendSynchronousRequest:request
                                 returningResponse:&response
                                             error:&error];
    
    if (error == nil)
    {
        self.OrderBeforeSend.text = [[NSString alloc] initWithData:data encoding:NSShiftJISStringEncoding];
    }
*/
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]  completionHandler:^(NSURLResponse *response, NSData *d, NSError *err) {
        
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// Handle Connection To Remote Server
#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // __responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // [__responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
}




@end
