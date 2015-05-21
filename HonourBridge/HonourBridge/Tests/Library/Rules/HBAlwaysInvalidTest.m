//
//  HBAlwaysInvalidTest.m
//  HonourBridge
//
//  Created by Jean Pimentel on 5/19/15.
//  Copyright (c) 2015 Jean Pimentel. All rights reserved.
//

#import "HBAlwaysInvalidTest.h"

@implementation HBAlwaysInvalidTest

+ (void)test
{
    AssertFalse([[HBAlwaysInvalid new] validate:@""]);
    AssertFalse([[HBAlwaysInvalid new] validate:@"a"]);
    AssertFalse([[HBAlwaysInvalid new] validate:@"1"]);
    AssertFalse([[HBAlwaysInvalid new] validate:@"   "]);
}

@end
