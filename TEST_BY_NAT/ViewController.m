//
//  ViewController.m
//  TEST_BY_NAT
//
//  Created by POSCO on 15/06/25.
//  Copyright (c) 2015年 POSCO. All rights reserved.
//

#import "ViewController.h"
#import "FMDatabase.h"
#import "MyDB.h"

@interface ViewController ()
//@property (weak, nonatomic) IBOutlet UILabel *msg;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Background setup
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"topview_bg.png"]];
    [backgroundView setOpaque:YES];
    [self.view addSubview:backgroundView];
    [self.view sendSubviewToBack:backgroundView];
    
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    
    // Setup IP if exists
    if (![settings URLForKey:@"host"]) {
        [settings setURL:[NSURL URLWithString:@"http://127.0.0.1:3000"] forKey:@"host"];
    }

    
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
