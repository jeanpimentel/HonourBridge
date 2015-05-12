//
//  HBLengthTest.m
//  HonourBridge
//
//  Created by Jean Pimentel on 5/14/15.
//  Copyright (c) 2015 Jean Pimentel. All rights reserved.
//

#import "HBLengthTest.h"

@implementation HBLengthTest

+ (void)test
{
    [self testValidLength];
    [self testInvalidLength];
}

+ (void)testValidLength
{
    AssertTrue([[[HBLength alloc] initWithMin:1 max:12] validate:@"jeanpimentel"]);
    AssertTrue([[[HBLength alloc] initWithMin:4 max:6] validate:@"ççççç"]);
    AssertTrue([[[HBLength alloc] initWithMin:1 max:30] validate:@"               "]);
    AssertTrue([[[HBLength alloc] initWithMin:1] validate:@"jeanpimentel"]);
    AssertTrue([[[HBLength alloc] initWithMax:12] validate:@"jeanpimentel"]);
    AssertTrue([[[HBLength alloc] initWithMax:15] validate:@"jeanpimentel"]);
}

+ (void)testInvalidLength
{
    AssertFalse([[[HBLength alloc] initWithMin:1 max:4] validate:@""]);
    AssertFalse([[[HBLength alloc] initWithMin:1 max:3] validate:@"jeanpimentel"]);
    AssertFalse([[[HBLength alloc] initWithMin:15] validate:@"jeanpimentel"]);
    AssertFalse([[[HBLength alloc] initWithMax:10] validate:@"jeanpimentel"]);
}

@end

