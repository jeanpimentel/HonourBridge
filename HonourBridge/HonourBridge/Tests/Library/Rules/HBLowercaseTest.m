//
//  HBLowercaseTest.m
//  HonourBridge
//
//  Created by Jean Pimentel on 5/14/15.
//  Copyright (c) 2015 Jean Pimentel. All rights reserved.
//

#import "HBLowercaseTest.h"

@implementation HBLowercaseTest

+ (void)test
{
    [self testValidLowercase];
    [self testInvalidLowercase];
}

+ (void)testValidLowercase
{
    AssertTrue([[HBLowercase new] validate:@""]);
    AssertTrue([[HBLowercase new] validate:@"lowercase"]);
    AssertTrue([[HBLowercase new] validate:@"lowercase-with-dashes"]);
    AssertTrue([[HBLowercase new] validate:@"lowercase with spaces"]);
    AssertTrue([[HBLowercase new] validate:@"lowercase with numbers 123"]);
    AssertTrue([[HBLowercase new] validate:@"lowercase with specials characters like ã ç ê"]);
    AssertTrue([[HBLowercase new] validate:@"with specials characters like # $ % & * +"]);
    AssertTrue([[HBLowercase new] validate:@"τάχιστη αλώπηξ βαφής ψημένη γη, δρασκελίζει υπέρ νωθρού κυνός"]);
}

+ (void)testInvalidLowercase
{
    AssertFalse([[HBLowercase new] validate:@"UPPERCASE"]);
    AssertFalse([[HBLowercase new] validate:@"CamelCase"]);
    AssertFalse([[HBLowercase new] validate:@"First Character Lowercase"]);
    AssertFalse([[HBLowercase new] validate:@"With Numbers 1 2 3"]);
}

@end
