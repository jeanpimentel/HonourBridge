//
//  HBVersionTest.m
//  HonourBridge
//
//  Created by Jean Pimentel on 5/19/15.
//  Copyright (c) 2015 Jean Pimentel. All rights reserved.
//

#import "HBVersionTest.h"

@implementation HBVersionTest

+ (void)test
{
    [self testValidVersion];
    [self testInvalidVersion];
}

+ (void)testValidVersion
{
    AssertTrue([[HBVersion new] validate:@"1.0.0"]);
    AssertTrue([[HBVersion new] validate:@"1.0.0-alpha"]);
    AssertTrue([[HBVersion new] validate:@"1.0.0-alpha.1"]);
    AssertTrue([[HBVersion new] validate:@"1.0.0-0.3.7"]);
    AssertTrue([[HBVersion new] validate:@"1.0.0-x.7.z.92"]);
    AssertTrue([[HBVersion new] validate:@"1.3.7+build.2.b8f12d7"]);
    AssertTrue([[HBVersion new] validate:@"1.3.7-rc.1"]);
}

+ (void)testInvalidVersion
{
    AssertFalse([[HBVersion new] validate:@""]);
    AssertFalse([[HBVersion new] validate:@"1.3.7--"]);
    AssertFalse([[HBVersion new] validate:@"1.3.7++"]);
    AssertFalse([[HBVersion new] validate:@"foo"]);
    AssertFalse([[HBVersion new] validate:@"1.2.3.4"]);
    AssertFalse([[HBVersion new] validate:@"1.2.3.4-beta"]);
    AssertFalse([[HBVersion new] validate:@"beta"]);
}

@end
