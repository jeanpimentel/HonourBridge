//
//  HBRuleTest.m
//  HonourBridge
//
//  Created by Jean Pimentel on 5/12/15.
//  Copyright (c) 2015 Jean Pimentel. All rights reserved.
//

#import "HBRuleTest.h"



@implementation HBRuleTest

+ (void)test
{
    [self testHashable];
    [self testEquatable];
}

+ (void)testHashable
{
    AssertTrue([[HBStartsWith alloc] initWithValue:@"J"] != [[HBStartsWith alloc] initWithValue:@"J"]);
}

+ (void)testEquatable
{
    HBStartsWith *s1 = [[HBStartsWith alloc] initWithValue:@"J"];
    HBStartsWith *s2 = s1;
    AssertTrue(s1 = s2);
}

@end
