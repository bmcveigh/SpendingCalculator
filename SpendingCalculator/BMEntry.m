//
//  BMEntry.m
//  SpendingCalculator
//
//  Created by Brian McVeigh on 10/23/13.
//  Copyright (c) 2013 Brian McVeigh. All rights reserved.
//

#import "BMEntry.h"

@implementation BMEntry

@synthesize entry, budget;

- (id)init
{
    if (self) {
        self = [super init];
        entry = @"What?";
        budget = @"Hello";
    }
    return self;
    
}

@end
