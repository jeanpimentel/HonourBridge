//
//  HBNotEmptyTest.m
//  HonourBridge
//
//  Created by Jean Pimentel on 5/19/15.
//  Copyright (c) 2015 Jean Pimentel. All rights reserved.
//

#import "HBNotEmptyTest.h"

@implementation HBNotEmptyTest

+ (void)test
{
    [self testValidNotEmpty];
    [self testInvalidNotEmpty];
}

+ (void)testValidNotEmpty
{
    AssertTrue([[HBNotEmpty new] validate:@"foobar"]);
    AssertTrue([[HBNotEmpty new] validate:@"foo bar"]);
}

+ (void)testInvalidNotEmpty
{
    AssertFalse([[HBNotEmpty new] validate:@""]);
    AssertFalse([[HBNotEmpty new] validate:@" "]);
    AssertFalse([[HBNotEmpty new] validate:@"\n"]);
    AssertFalse([[HBNotEmpty new] validate:@"\t"]);
    AssertFalse([[HBNotEmpty new] validate:@"\n "]);
    AssertFalse([[HBNotEmpty new] validate:@"     "]);
}

@end
