//
//  BMViewController.m
//  SpendingCalculator
//
//  Created by Brian McVeigh on 10/23/13.
//  Copyright (c) 2013 Brian McVeigh. All rights reserved.
//

#import "BMViewController.h"
#import "BMTableViewController.h"
#import "BMEntry.h"

@interface BMViewController ()
{
    float totalSpent;
    float leftToSpend;
    
    NSMutableArray *entries;
}

@end

@implementation BMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _addBalanceField.delegate = self;
    _setBudgetField.delegate = self;
    entries = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculate:(id)sender {
    
    // Increment the total spend and decrement the left to spend field
    leftToSpend = [_setBudgetField.text floatValue];
    totalSpent += [_addBalanceField.text floatValue];
    leftToSpend -= [_addBalanceField.text floatValue];
    
    // Set the labels to the updated values
    [_totalSpentLabel setText:[NSString stringWithFormat:@"$%f", totalSpent]];
    [_leftToSpendLabel setText:[NSString stringWithFormat:@"$%f", leftToSpend]];
    
    // Now clear the fields
    [_addBalanceField setText:@"0.0"];
    if (leftToSpend < 0.0)
    {
        [_leftToSpendLabel setTextColor:[UIColor redColor]];
        [_setBudgetField setTextColor:[UIColor redColor]];
    }
    else
    {
        
        [_leftToSpendLabel setTextColor:[UIColor greenColor]];
        [_setBudgetField setTextColor:[UIColor greenColor]];
    }
    [_setBudgetField setText:[NSString stringWithFormat:@"%f", leftToSpend]];
    
    BMEntry *entry = [[BMEntry alloc] init];
    [entry setEntry:[NSString stringWithFormat:@"Total spent: %@", _totalSpentLabel.text]];
    [entry setBudget:[NSString stringWithFormat:@"Left to spend: %@", _leftToSpendLabel.text]];
    [entries addObject:entry];
    
    
}

- (IBAction)clear:(id)sender {
    [entries removeAllObjects];
    
    [_totalSpentLabel setText:@"0.00"];
    [_leftToSpendLabel setText:@"0.00"];
    [_addBalanceField setText:@"0.00"];
    [_setBudgetField setText:@"0.00"];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Data cleared" message:@"The entries were successfully cleared." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alert show];

}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    BMTableViewController *controller = segue.destinationViewController;
    [controller setEntriesArray:entries];
 
}


@end
