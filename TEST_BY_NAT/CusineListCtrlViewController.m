//
//  CusineListCtrlViewController.m
//  TEST_BY_NAT
//
//  Created by POSCO on 15/06/26.
//  Copyright (c) 2015年 POSCO. All rights reserved.
//

#import "CusineListCtrlViewController.h"
#import "MyCustomCell.h"
#import "FMDatabase.h"
#import "MyDB.h"
#import "BeforeSend.h"


@interface CusineListCtrlViewController()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *total;
@property (weak, nonatomic) IBOutlet UITableView *list;
@property (weak, nonatomic) IBOutlet UILabel *stepper;
@property int count;
@property NSMutableArray *countOfEachItem;
@property NSMutableArray *totalOrder;
@property (strong, nonatomic) NSMutableArray *cusine;

@end

@implementation CusineListCtrlViewController

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
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"order_bg.png"]];
    [background setOpaque:YES];
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
    
    
	self.list.delegate = self;
    self.list.dataSource = self;
    

    // row => title
    self.cusine = [[NSMutableArray alloc] init];
    self.cusine = [MyDB getColumnOfIndex:1 FromTable:@"employee"];

    // row => count
    self.countOfEachItem = [[NSMutableArray alloc] initWithCapacity:self.cusine.count];
    
    self.totalOrder = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [self.cusine count]; i++) {
        NSMutableArray* cusine_count = [[NSMutableArray alloc] init];
        [cusine_count addObject:self.cusine[i]];
        NSLog(@"%@", self.cusine[i]);
        [cusine_count addObject:[NSNumber numberWithInt:0] ];
        [self.totalOrder insertObject:cusine_count atIndex:i];
    }
    

 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

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
    

    
    // Stepper Setup
    UIStepper *stp = [[UIStepper alloc] init];
    [stp setFrame:CGRectMake(220,0, 5, 5)];
    [stp setTag:indexPath.row];
    [stp addTarget:self action:@selector(stepperTriggered:) forControlEvents:UIControlEventValueChanged];
    [cell addSubview:stp];
    
    // Counter Setup
    UILabel *counter = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    counter.text = [NSString stringWithFormat:@"%d",(int)stp.value];
    counter.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:100];
    counter.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"order_bg.png"]];
    [cell addSubview:counter];
    [self.countOfEachItem insertObject:counter atIndex:indexPath.row];
    
    
    // Cell Setup
    cell.backgroundColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:100];
    cell.textLabel.textColor = [UIColor colorWithRed:23 green:220 blue:110 alpha:30];
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:15];
    cell.textLabel.text = [NSString stringWithFormat:@"    %@", self.cusine[indexPath.row] ];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (IBAction)SendOrder:(id)sender {
    
    BeforeSend * viewController;
    viewController =[self.storyboard instantiateViewControllerWithIdentifier:@"GVC"];
    viewController.totalOrder=self.totalOrder;
    viewController.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentViewController:viewController animated:YES completion:nil];


}

- (IBAction)stepperTriggered:(id)sender {

    
    UIStepper *tmp = (UIStepper *) sender;
    int cusineID = [tmp tag];
    
    UILabel * targetRow = (UILabel *)[self.countOfEachItem objectAtIndex:cusineID];
    targetRow.text = [NSString stringWithFormat:@"%i", (int)[tmp value]];
    
    
    NSMutableArray* cusine_count = [[NSMutableArray alloc] init];
    [cusine_count addObject:self.cusine[cusineID]];
    [cusine_count addObject:[NSNumber numberWithInt:[tmp value]] ];
//    [self.totalOrder insertObject:cusine_count atIndex:cusineID];
    [self.totalOrder replaceObjectAtIndex:cusineID withObject:cusine_count];
    
    self.stepper.text =
    [NSString stringWithFormat:@"%@", self.totalOrder[0][1]];
    
//    NSLog(@"%@", self.totalOrder[0][0]);
    
    
}

@end
