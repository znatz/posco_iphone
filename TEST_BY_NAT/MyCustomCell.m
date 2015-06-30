//
//  MyCustomCell.m
//  TEST_BY_NAT
//
//  Created by POSCO on 15/06/26.
//  Copyright (c) 2015年 POSCO. All rights reserved.
//

#import "MyCustomCell.h"

@implementation MyCustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)cellcounter:(id)sender {
}
@end
