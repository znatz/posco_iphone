//
//  ModifyMenuController.m
//  TEST_BY_NAT
//
//  Created by POSCO on 15/07/01.
//  Copyright (c) 2015年 POSCO. All rights reserved.
//

#import "ModifyMenuController.h"
#import "MyDB.h"

@interface ModifyMenuController ()<UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *list;
@property NSMutableArray * cusine;
@property NSInteger selectedRow;
@end

@implementation ModifyMenuController

// Handle Selected Cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedRow = indexPath.row;
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"処理を選択してください" message:nil delegate:self cancelButtonTitle:@"戻る" otherButtonTitles:@"編集",@"削除", nil];
    alert.delegate = self;
    [alert setTag:1];
    [alert show];
    
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"%d", [alertView tag]);
    switch ([alertView tag]) {
        /* outter alert */
        case 1:
            
            switch (buttonIndex) {
                case 0:
                    break;
                case 1:
                {
                    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"新名前を入力してください" message:nil delegate:self cancelButtonTitle:@"戻る" otherButtonTitles:@"保存", nil];
                    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
                    UITextField * tf = [alert textFieldAtIndex:0];
                    tf.placeholder = self.cusine[self.selectedRow];
                    alert.delegate = self;
                    [alert setTag:2];
                    [alert show];
                    break;
                }
                case 2:
                    [MyDB deleteMenu:self.selectedRow + 1];
                    break;
            }
            
            break;
            
        /* inner alert */
        case 2:
            
            switch (buttonIndex) {
                case 0:
                    break;
                case 1:
                {
                    NSString * title = [alertView textFieldAtIndex:0].text;
                    [MyDB updateMenuAtIndex:self.selectedRow+1 withTitle:title];
                    NSLog(@"GO EDIT");
                }
            }
                        
            break;
    }
    
}



// Fill Cells
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cusine.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = self.cusine[indexPath.row];
    
    
    /* Cell Style */
    cell.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:100];
    cell.textLabel.textColor = [UIColor colorWithRed:23 green:220 blue:110 alpha:30];
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:15];
    cell.textLabel.text = [NSString stringWithFormat:@"    %@", self.cusine[indexPath.row] ];
    
    return cell;
}

// Hide Empty Cell
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *dummy = @"";
    if ([self.cusine[indexPath.row] isEqual:dummy]) return 0;
    else return 35;
}

// Handle View
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
    self.list.delegate = self;
    self.list.dataSource = self;
    self.cusine = [MyDB findAllTitle];
    NSLog(@"%@",self.cusine[0]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
