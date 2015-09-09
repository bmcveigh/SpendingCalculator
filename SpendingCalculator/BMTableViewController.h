//
//  BMTableViewController.h
//  SpendingCalculator
//
//  Created by Brian McVeigh on 10/23/13.
//  Copyright (c) 2013 Brian McVeigh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMTableViewController : UITableViewController
{
    NSMutableArray *entriesArray;
}
@property (strong) NSMutableArray *entriesArray;

@end
