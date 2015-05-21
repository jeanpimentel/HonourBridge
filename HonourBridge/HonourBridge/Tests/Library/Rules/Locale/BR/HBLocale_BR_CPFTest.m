//
//  HBLocale_BR_CPFTest.m
//  HonourBridge
//
//  Created by Jean Pimentel on 5/19/15.
//  Copyright (c) 2015 Jean Pimentel. All rights reserved.
//

#import "HBLocale_BR_CPFTest.h"

@implementation HBLocale_BR_CPFTest

+ (void)test
{
    [self testValidFormattedCPF];
    [self testValidUnformattedCPF];
    [self testInvalidFormattedCPF];
    [self testInvalidUnformattedCPF];
    [self testInvalidEntries];
    [self testStrictValidEntries];
}

+ (void)testValidFormattedCPF
{
    AssertTrue([[HBLocale_BR_CPF new] validate:@"862.234.232-84"]);
    AssertTrue([[HBLocale_BR_CPF new] validate:@"862.234.232.84"]);
    AssertTrue([[HBLocale_BR_CPF new] validate:@"862-234-232-84"]);
    AssertTrue([[HBLocale_BR_CPF new] validate:@"8.6.2.2.3.4.2.3.2.8.4"]);
}

+ (void)testValidUnformattedCPF
{
    AssertTrue([[HBLocale_BR_CPF new] validate:@"86223423284"]);
    AssertTrue([[HBLocale_BR_CPF new] validate:@"95574461102"]);
}

+ (void)testInvalidFormattedCPF
{
    AssertFalse([[HBLocale_BR_CPF new] validate:@"000.000.000-00"]);
    AssertFalse([[HBLocale_BR_CPF new] validate:@"111.222.333-44"]);
    AssertFalse([[HBLocale_BR_CPF new] validate:@"999-999-999-99"]);
    AssertFalse([[HBLocale_BR_CPF new] validate:@"999999999.99"]);
}

+ (void)testInvalidUnformattedCPF
{
    AssertFalse([[HBLocale_BR_CPF new] validate:@"00000000000"]);
    AssertFalse([[HBLocale_BR_CPF new] validate:@"11122233344"]);
    AssertFalse([[HBLocale_BR_CPF new] validate:@"99999999999"]);
    AssertFalse([[HBLocale_BR_CPF new] validate:@"99999999999"]);
}

+ (void)testInvalidEntries
{
    AssertFalse([[HBLocale_BR_CPF new] validate:@""]);
    AssertFalse([[HBLocale_BR_CPF new] validate:@"foo"]);
    AssertFalse([[HBLocale_BR_CPF new] validate:@"1"]);
    AssertFalse([[HBLocale_BR_CPF new] validate:@"12"]);
    AssertFalse([[HBLocale_BR_CPF new] validate:@"123"]);
    AssertFalse([[HBLocale_BR_CPF new] validate:@"999999999999"]);
}

+ (void)testStrictValidEntries
{
    AssertTrue([[[HBLocale_BR_CPF alloc] initWithStrict:YES] validate:@"86223423284"]);
    AssertTrue([[[HBLocale_BR_CPF alloc] initWithStrict:YES] validate:@"95574461102"]);
    AssertFalse([[[HBLocale_BR_CPF alloc] initWithStrict:YES] validate:@"862.234.232-84"]);
    AssertFalse([[[HBLocale_BR_CPF alloc] initWithStrict:YES] validate:@"955-744-611-02"]);
}

@end
