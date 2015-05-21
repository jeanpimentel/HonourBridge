//
//  HBNoWhitespaceTest.m
//  HonourBridge
//
//  Created by Jean Pimentel on 5/19/15.
//  Copyright (c) 2015 Jean Pimentel. All rights reserved.
//

#import "HBNoWhitespaceTest.h"

@implementation HBNoWhitespaceTest

+ (void)test
{
    [self testValidNoWhitespace];
    [self testInvalidNoWhitespace];
}

+ (void)testValidNoWhitespace
{
    AssertTrue([[HBNoWhitespace new] validate:@""]);
    AssertTrue([[HBNoWhitespace new] validate:@"foobar"]);
}

+ (void)testInvalidNoWhitespace
{
    AssertFalse([[HBNoWhitespace new] validate:@" "]);
    AssertFalse([[HBNoWhitespace new] validate:@"\n"]);
    AssertFalse([[HBNoWhitespace new] validate:@"foo "]);
    AssertFalse([[HBNoWhitespace new] validate:@" foo "]);
    AssertFalse([[HBNoWhitespace new] validate:@" foo"]);
    AssertFalse([[HBNoWhitespace new] validate:@"foo bar"]);
    AssertFalse([[HBNoWhitespace new] validate:@"foo\nbar"]);
    AssertFalse([[HBNoWhitespace new] validate:@"foo\tbar"]);
    AssertFalse([[HBNoWhitespace new] validate:@"foo\rbar"]);
}

@end
