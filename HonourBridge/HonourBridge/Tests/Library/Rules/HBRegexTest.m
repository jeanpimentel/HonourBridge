//
//  HBRegexTest.m
//  HonourBridge
//
//  Created by Jean Pimentel on 5/19/15.
//  Copyright (c) 2015 Jean Pimentel. All rights reserved.
//

#import "HBRegexTest.h"

@implementation HBRegexTest

+ (void)test
{
    [self testValidEntryForRegex];
    [self testInvalidEntryForRegex];
}

+ (void)testValidEntryForRegex
{
    AssertTrue([[[HBRegex alloc] initWithValue:@"^[a-z]+$"] validate:@"foobar"]);
    AssertTrue([[[HBRegex alloc] initWithValue:@"^[a-zA-Z]+$"] validate:@"foobar"]);
    AssertTrue([[[HBRegex alloc] initWithValue:@"^[a-z]+$" caseInsensitive:YES] validate:@"foobar"]);

    AssertTrue([[[HBRegex alloc] initWithValue:@"^#?([a-f0-9]{6}|[a-f0-9]{3})$"] validate:@"#ff0000"]);
    AssertTrue([[[HBRegex alloc] initWithValue:@"^#?([a-f0-9]{6}|[a-f0-9]{3})$"] validate:@"#f00"]);

    AssertTrue([[[HBRegex alloc] initWithValue:@"^#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$"] validate:@"#FF00cc"]);
    AssertTrue([[[HBRegex alloc] initWithValue:@"^#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$"] validate:@"#F0c"]);

    AssertTrue([[[HBRegex alloc] initWithValue:@"^#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$" caseInsensitive:YES] validate:@"#Ff00Cc"]);
    AssertTrue([[[HBRegex alloc] initWithValue:@"^#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$" caseInsensitive:YES] validate:@"#f0C"]);
}

+ (void)testInvalidEntryForRegex
{
    AssertFalse([[[HBRegex alloc] initWithValue:@"^#?([a-f0-9]{6}|[a-f0-9]{3})$"] validate:@""]);
    AssertFalse([[[HBRegex alloc] initWithValue:@"^[a-z]+$"] validate:@"fooBar"]);
    AssertFalse([[[HBRegex alloc] initWithValue:@"^#?([a-f0-9]{6}|[a-f0-9]{3})$"] validate:@"#FF0000"]);
    AssertFalse([[[HBRegex alloc] initWithValue:@"^#?([a-f0-9]{6}|[a-f0-9]{3})$"] validate:@"#F00"]);
}

@end