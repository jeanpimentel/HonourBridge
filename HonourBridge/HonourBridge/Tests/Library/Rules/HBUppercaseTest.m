//
//  HBUppercaseTest.m
//  HonourBridge
//
//  Created by Jean Pimentel on 5/14/15.
//  Copyright (c) 2015 Jean Pimentel. All rights reserved.
//

#import "HBUppercaseTest.h"

@implementation HBUppercaseTest

+ (void)test
{
    [self testValidUppercase];
    [self testInvalidUppercase];
}

+ (void)testValidUppercase
{
    AssertTrue([[HBUppercase new] validate:@""]);
    AssertTrue([[HBUppercase new] validate:@"UPPERCASE"]);
    AssertTrue([[HBUppercase new] validate:@"UPPERCASE-WITH-DASHES"]);
    AssertTrue([[HBUppercase new] validate:@"UPPERCASE WITH SPACES"]);
    AssertTrue([[HBUppercase new] validate:@"UPPERCASE WITH NUMBERS 123"]);
    AssertTrue([[HBUppercase new] validate:@"UPPERCASE WITH SPECIALS CHARACTERS LIKE Ã Ç Ê"]);
    AssertTrue([[HBUppercase new] validate:@"WITH SPECIALS CHARACTERS LIKE # $ % & * +"]);
    AssertTrue([[HBUppercase new] validate:@"ΤΆΧΙΣΤΗ ΑΛΏΠΗΞ ΒΑΦΉΣ ΨΗΜΈΝΗ ΓΗ, ΔΡΑΣΚΕΛΊΖΕΙ ΥΠΈΡ ΝΩΘΡΟΎ ΚΥΝΌΣ"]);
}

+ (void)testInvalidUppercase
{
    AssertFalse([[HBUppercase new] validate:@"lowercase"]);
    AssertFalse([[HBUppercase new] validate:@"CamelCase"]);
    AssertFalse([[HBUppercase new] validate:@"First Character Uppercase"]);
    AssertFalse([[HBUppercase new] validate:@"With Numbers 1 2 3"]);
}

@end
