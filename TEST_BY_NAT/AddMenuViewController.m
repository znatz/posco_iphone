//
//  AddMenuViewController.m
//  TEST_BY_NAT
//
//  Created by POSCO on 15/07/01.
//  Copyright (c) 2015年 POSCO. All rights reserved.
//

#import "AddMenuViewController.h"
#import "MyDB.h"

@interface AddMenuViewController () <UITextFieldDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameInput;

@end

@implementation AddMenuViewController


// Dismiss Keyboard After Editing
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self.nameInput resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.nameInput resignFirstResponder];
    return YES;
}
- (void)dismissKeyboard {
    [self.nameInput resignFirstResponder];
}

// Handle Submit Button
- (IBAction)submitNewMenu:(id)sender {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"追加よろしいですか？" message:self.nameInput.text delegate:nil cancelButtonTitle:@"キャンセル" otherButtonTitles:@"追加", nil];
    [alert show];
    alert.delegate = self;
}

// Handle Alert Button
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            break;            
        default:
            [MyDB insertMenu:self.nameInput.text];
            break;
    }
}

// Init View
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // BG setup
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"addMenu.png"]];
    [background setOpaque:YES];
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
    
    // UITextView delegate
    self.nameInput.delegate = self;
    
    // Dismiss Keyboard After Editing
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
