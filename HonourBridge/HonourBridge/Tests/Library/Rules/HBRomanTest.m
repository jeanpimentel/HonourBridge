//
//  HBRomanTest.m
//  HonourBridge
//
//  Created by Jean Pimentel on 5/19/15.
//  Copyright (c) 2015 Jean Pimentel. All rights reserved.
//

#import "HBRomanTest.h"

@implementation HBRomanTest

+ (void)test
{
    [self testValidRoman];
    [self testInvalidRoman];
}

+ (void)testValidRoman
{
    AssertTrue([[HBRoman new] validate:@"III"]);
    AssertTrue([[HBRoman new] validate:@"IV"]);
    AssertTrue([[HBRoman new] validate:@"VI"]);
    AssertTrue([[HBRoman new] validate:@"XIX"]);
    AssertTrue([[HBRoman new] validate:@"XLII"]);
    AssertTrue([[HBRoman new] validate:@"LXII"]);
    AssertTrue([[HBRoman new] validate:@"CXLIX"]);
    AssertTrue([[HBRoman new] validate:@"CLIII"]);
    AssertTrue([[HBRoman new] validate:@"MCCXXXIV"]);
    AssertTrue([[HBRoman new] validate:@"MMXXIV"]);
    AssertTrue([[HBRoman new] validate:@"MCMLXXV"]);
    AssertTrue([[HBRoman new] validate:@"MMMMCMXCIX"]);
}

+ (void)testInvalidRoman
{
    AssertFalse([[HBRoman new] validate:@"IIII"]);
    AssertFalse([[HBRoman new] validate:@"IVVVX"]);
    AssertFalse([[HBRoman new] validate:@"CCDC"]);
    AssertFalse([[HBRoman new] validate:@"MXM"]);
    AssertFalse([[HBRoman new] validate:@"XIIIIIIII"]);
    AssertFalse([[HBRoman new] validate:@"MIMIMI"]);
}

@end
