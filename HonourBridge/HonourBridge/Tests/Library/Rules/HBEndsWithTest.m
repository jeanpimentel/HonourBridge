//
//  HBEndsWithTest.m
//  HonourBridge
//
//  Created by Jean Pimentel on 5/14/15.
//  Copyright (c) 2015 Jean Pimentel. All rights reserved.
//

#import "HBEndsWithTest.h"

@implementation HBEndsWithTest

+ (void)test
{
    [self testEndsWith];
    [self testNonEndsWith];
}

+ (void)testEndsWith
{
    AssertTrue([[[HBEndsWith alloc] initWithValue:@""] validate:@""]);
    AssertTrue([[[HBEndsWith alloc] initWithValue:@""] validate:@"foobarbaz"]);
    AssertTrue([[[HBEndsWith alloc] initWithValue:@"foo"] validate:@"barbazfoo"]);
    AssertTrue([[[HBEndsWith alloc] initWithValue:@"foo" caseSensitive:YES] validate:@"barbazfoo"]);
    AssertTrue([[[HBEndsWith alloc] initWithValue:@"foo" caseSensitive:NO] validate:@"barbazFOO"]);
}

+ (void)testNonEndsWith
{
    AssertFalse([[[HBEndsWith alloc] initWithValue:@"foo"] validate:@""]);
    AssertFalse([[[HBEndsWith alloc] initWithValue:@"foo"] validate:@"borbozfaa"]);
    AssertFalse([[[HBEndsWith alloc] initWithValue:@"foo" caseSensitive:YES] validate:@"barbazFOO"]);
}

@end
