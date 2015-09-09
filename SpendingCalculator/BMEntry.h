//
//  BMEntry.h
//  SpendingCalculator
//
//  Created by Brian McVeigh on 10/23/13.
//  Copyright (c) 2013 Brian McVeigh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BMEntry : NSObject
{
    NSString *entry;
    NSString *budget;
}

@property NSString *entry;
@property NSString *budget;

@end
