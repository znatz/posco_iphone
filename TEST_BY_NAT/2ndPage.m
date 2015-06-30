//
//  2ndPage.m
//  TEST_BY_NAT
//
//  Created by POSCO on 15/06/25.
//  Copyright (c) 2015年 POSCO. All rights reserved.
//

#import "2ndPage.h"

@interface _ndPage ()
@property (weak, nonatomic) IBOutlet UILabel *msg;

@end

@implementation _ndPage

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
    [super viewDidLoad];
    [self.msg setText:@"DONE"];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
