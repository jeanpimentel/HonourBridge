//
//  HBEmailTest.m
//  HonourBridge
//
//  Created by Jean Pimentel on 5/19/15.
//  Copyright (c) 2015 Jean Pimentel. All rights reserved.
//

#import "HBEmailTest.h"

@implementation HBEmailTest

+ (void)test
{
    [self testValidEmails];
    [self testInvalidEmails];
}

+ (void)testValidEmails
{
    AssertTrue([[HBEmail new] validate:@"test@test.com"]);
    AssertTrue([[HBEmail new] validate:@"mail+mail@gmail.com"]);
    AssertTrue([[HBEmail new] validate:@"mail.email@e.test.com"]);
    AssertTrue([[HBEmail new] validate:@"a@a.a"]);
    AssertTrue([[HBEmail new] validate:@"test@тест.рф"]);
}

+ (void)testInvalidEmails
{
    AssertFalse([[HBEmail new] validate:@""]);
    AssertFalse([[HBEmail new] validate:@" "]);
    AssertFalse([[HBEmail new] validate:@"mailto:test@test.com "]);
    AssertFalse([[HBEmail new] validate:@"test@test.com "]);
    AssertFalse([[HBEmail new] validate:@" test@test.com"]);
    AssertFalse([[HBEmail new] validate:@" test@test.com "]);
    AssertFalse([[HBEmail new] validate:@"test@test"]);
    AssertFalse([[HBEmail new] validate:@"test"]);
    AssertFalse([[HBEmail new] validate:@"@test.com"]);
    AssertFalse([[HBEmail new] validate:@"mail@test@test.com"]);
    AssertFalse([[HBEmail new] validate:@"test.test@"]);
    AssertFalse([[HBEmail new] validate:@"test.@test.com"]);
    AssertFalse([[HBEmail new] validate:@"test@.test.com"]);
    AssertFalse([[HBEmail new] validate:@"test@test..com"]);
}

@end