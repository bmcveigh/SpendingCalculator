//
//  BMViewController.h
//  SpendingCalculator
//
//  Created by Brian McVeigh on 10/23/13.
//  Copyright (c) 2013 Brian McVeigh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *addBalanceField;
@property (weak, nonatomic) IBOutlet UITextField *setBudgetField;
@property (weak, nonatomic) IBOutlet UILabel *totalSpentLabel;
@property (weak, nonatomic) IBOutlet UILabel *leftToSpendLabel;

@property (weak) NSString *totalSpentString;
@property (weak) NSString *leftToSpendString;

- (IBAction)calculate:(id)sender;
- (IBAction)clear:(id)sender;


@end
