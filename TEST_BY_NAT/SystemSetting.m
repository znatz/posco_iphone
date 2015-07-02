//
//  SystemSetting.m
//  TEST_BY_NAT
//
//  Created by POSCO on 15/07/02.
//  Copyright (c) 2015年 POSCO. All rights reserved.
//

#import "SystemSetting.h"

@interface SystemSetting () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *ipInput;
@end

@implementation SystemSetting

// Dismiss Keyboard After Editing
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self.ipInput resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.ipInput resignFirstResponder];
    return YES;
}
- (void)dismissKeyboard {
    [self.ipInput resignFirstResponder];
}

// Handle Submit Button
- (IBAction)changeIP:(id)sender {
    NSURL * url = [[NSURL alloc] initWithString:self.ipInput.text];
    NSLog(@"%@",url);
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    [settings setURL:url forKey:@"host"];
    [settings synchronize];
    NSLog(@"changed to %@", [[NSUserDefaults standardUserDefaults] URLForKey:@"host"]);
}


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
    // Background setup
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"order_bg.png"]];
    [backgroundView setOpaque:YES];
    [self.view addSubview:backgroundView];
    [self.view sendSubviewToBack:backgroundView];
    
    // IP Default Setup
    self.ipInput.text = [[[NSUserDefaults standardUserDefaults] URLForKey:@"host"] description];
    
    // UITextView delegate
    self.ipInput.delegate = self;
    
    // Dismiss Keyboard After Editing
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
