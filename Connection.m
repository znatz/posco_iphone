//
//  Connection.m
//  TEST_BY_NAT
//
//  Created by POSCO on 15/07/02.
//  Copyright (c) 2015年 POSCO. All rights reserved.
//

#import "Connection.h"

@implementation Connection

+ (void) sendToHost:(NSURL *) host withData:(NSString *) data byCaller:(UITextView *)caller{
    
    NSString *param = [NSString stringWithFormat:@"cusine=%@", data];
    
    NSMutableURLRequest *request;
    request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"POST"];
    [request setURL:host];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setTimeoutInterval:20];
    [request setHTTPShouldHandleCookies:FALSE];
    [request setHTTPBody:[param dataUsingEncoding:NSUTF8StringEncoding]];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]  completionHandler:^(NSURLResponse *response, NSData *d, NSError *err) {
        if (err) {
            caller.text = @"接続失敗しました";
        }
        else {
            caller.text = @"接続しました";
        }
    }];

}

+ (void) sendToHost:(NSURL *) host withKey:(NSString *) key withValue:(NSString *) value byCaller:(UITextView *)caller
{
    
    NSString *param = [NSString stringWithFormat:@"key=%@&cusine=%@", key, value];
    
    NSMutableURLRequest *request;
    request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"POST"];
    [request setURL:host];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setTimeoutInterval:20];
    [request setHTTPShouldHandleCookies:FALSE];
    [request setHTTPBody:[param dataUsingEncoding:NSUTF8StringEncoding]];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue]  completionHandler:^(NSURLResponse *response, NSData *d, NSError *err) {
        if (err) {
            caller.text = @"接続失敗しました";
        }
        else {
            caller.text = @"接続しました";
        }
    }];
    
}


@end
