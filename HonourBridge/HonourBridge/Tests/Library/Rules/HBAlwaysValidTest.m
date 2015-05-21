//
//  HBAlwaysValidTest.m
//  HonourBridge
//
//  Created by Jean Pimentel on 5/19/15.
//  Copyright (c) 2015 Jean Pimentel. All rights reserved.
//

#import "HBAlwaysValidTest.h"

@implementation HBAlwaysValidTest

+ (void)test
{
    AssertTrue([[HBAlwaysValid new] validate:@""]);
    AssertTrue([[HBAlwaysValid new] validate:@"a"]);
    AssertTrue([[HBAlwaysValid new] validate:@"1"]);
    AssertTrue([[HBAlwaysValid new] validate:@"   "]);
}

@end
