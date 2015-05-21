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

#import "HBAlwaysInvalidTest.h"
#import "HBAlwaysValidTest.h"
#import "HBContainsTest.h"
#import "HBEmailTest.h"
#import "HBEndsWithTest.h"
#import "HBLengthTest.h"
#import "HBLowercaseTest.h"
#import "HBNoWhitespaceTest.h"
#import "HBNotEmptyTest.h"
#import "HBRegexTest.h"
#import "HBRomanTest.h"
#import "HBStartsWithTest.h"
#import "HBUppercaseTest.h"
#import "HBVersionTest.h"

#import "HBLocale_BR_CPFTest.h"


@implementation HonourBridgeTests

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [HBRuleTest test];
    [HBValidatorTest test];

    // Rules
    [HBAlwaysInvalidTest test];
    [HBAlwaysValidTest test];
    [HBContainsTest test];
    [HBEmailTest test];
    [HBEndsWithTest test];
    [HBLengthTest test];
    [HBLowercaseTest test];
    [HBNoWhitespaceTest test];
    [HBNotEmptyTest test];
    [HBRegexTest test];
    [HBRomanTest test];
    [HBStartsWithTest test];
    [HBUppercaseTest test];
    [HBVersionTest test];

    [HBLocale_BR_CPFTest test];

    return YES;
}

@end
