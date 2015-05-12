//
//  HBStartsWithTest.m
//  HonourBridge
//
//  Created by Jean Pimentel on 5/14/15.
//  Copyright (c) 2015 Jean Pimentel. All rights reserved.
//

#import "HBStartsWithTest.h"

@implementation HBStartsWithTest

+ (void)test
{
    [self testStartsWith];
    [self testNonStartsWith];
}

+ (void)testStartsWith
{
    AssertTrue([[[HBStartsWith alloc] initWithValue:@""] validate:@""]);
    AssertTrue([[[HBStartsWith alloc] initWithValue:@""] validate:@"foobarbaz"]);
    AssertTrue([[[HBStartsWith alloc] initWithValue:@"foo"] validate:@"foobarbaz"]);
    AssertTrue([[[HBStartsWith alloc] initWithValue:@"foo" caseSensitive:YES] validate:@"foobarbaz"]);
    AssertTrue([[[HBStartsWith alloc] initWithValue:@"foo" caseSensitive:NO] validate:@"FOObarbaz"]);
}

+ (void)testNonStartsWith
{
    AssertFalse([[[HBStartsWith alloc] initWithValue:@"foo"] validate:@""]);
    AssertFalse([[[HBStartsWith alloc] initWithValue:@"foo"] validate:@"faaborboz"]);
    AssertFalse([[[HBStartsWith alloc] initWithValue:@"foo" caseSensitive:YES] validate:@"FOObarbaz"]);
}

@end
