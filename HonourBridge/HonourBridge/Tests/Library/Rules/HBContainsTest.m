//
//  HBContainsTest.m
//  HonourBridge
//
//  Created by Jean Pimentel on 5/14/15.
//  Copyright (c) 2015 Jean Pimentel. All rights reserved.
//

#import "HBContainsTest.h"

@implementation HBContainsTest

+ (void)test
{
    [self testContains];
    [self testNonContains];
}

+ (void)testContains
{
    AssertTrue([[[HBContains alloc] initWithValue:@""] validate:@""]);
    AssertTrue([[[HBContains alloc] initWithValue:@""] validate:@"foobarbaz"]);
    AssertTrue([[[HBContains alloc] initWithValue:@"foo"] validate:@"foobarbaz"]);
    AssertTrue([[[HBContains alloc] initWithValue:@"foo"] validate:@"barfoobaz"]);
    AssertTrue([[[HBContains alloc] initWithValue:@"foo"] validate:@"barbazfoo"]);
    AssertTrue([[[HBContains alloc] initWithValue:@"foo" caseSensitive:YES] validate:@"foobarbaz"]);
    AssertTrue([[[HBContains alloc] initWithValue:@"foo" caseSensitive:NO] validate:@"FOObarbaz"]);
    AssertTrue([[[HBContains alloc] initWithValue:@""] validate:@""]);
    AssertTrue([[[HBContains alloc] initWithValue:@"foo" caseSensitive:YES] validate:@"foobarbaz"]);
}

+ (void)testNonContains
{
    AssertFalse([[[HBContains alloc] initWithValue:@"foo"] validate:@""]);
    AssertFalse([[[HBContains alloc] initWithValue:@"foo"] validate:@"faaborboz"]);
    AssertFalse([[[HBContains alloc] initWithValue:@"foo" caseSensitive:YES] validate:@"FOObarbaz"]);
}

@end
