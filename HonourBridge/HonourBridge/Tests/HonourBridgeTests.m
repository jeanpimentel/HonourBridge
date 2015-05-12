//
//  HonourBridgeTests.m
//  HonourBridge
//
//  Created by Jean Pimentel on 5/12/15.
//  Copyright (c) 2015 Jean Pimentel. All rights reserved.
//

#import "HonourBridgeTests.h"
#import <HonourBridge-Swift.h>

#import "HBRuleTest.h"
#import "HBValidatorTest.h"
#import "HBContainsTest.h"
#import "HBEndsWithTest.h"
#import "HBLengthTest.h"
#import "HBLowercaseTest.h"
#import "HBStartsWithTest.h"
#import "HBUppercaseTest.h"

@implementation HonourBridgeTests

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [HBRuleTest test];
    [HBValidatorTest test];

    // Rules
    [HBContainsTest test];
    [HBEndsWithTest test];
    [HBLengthTest test];
    [HBLowercaseTest test];
    [HBStartsWithTest test];
    [HBUppercaseTest test];

    return YES;
}

@end
