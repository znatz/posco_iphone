//
//  MyCustomCell.h
//  TEST_BY_NAT
//
//  Created by POSCO on 15/06/26.
//  Copyright (c) 2015年 POSCO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellimage;
@property (weak, nonatomic) IBOutlet UILabel *celllabel;
- (IBAction)cellcounter:(id)sender;

@end
