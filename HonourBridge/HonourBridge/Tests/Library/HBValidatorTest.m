//
//  HBValidatorTest.m
//  HonourBridge
//
//  Created by Jean Pimentel on 5/12/15.
//  Copyright (c) 2015 Jean Pimentel. All rights reserved.
//

#import "HBValidatorTest.h"

@implementation HBValidatorTest

+ (void)test
{
    [self testEmptyRules];
    [self testOneRule];
    [self testTwoRules];
    [self testChainRules];

    [self testAssertWithoutRules];
    [self testAssertWithOneValidRule];
    [self testAssertWithValidRules];
    [self testAssertWithOneInvalidRule];
    [self testAssertWithInvalidRules];

    [self testCheckWithoutRules];
    [self testCheckWithOneValidRule];
    [self testCheckWithValidRules];
    [self testCheckWithOneInvalidRule];
    [self testCheckWithInvalidRule];

    [self testValidateWithoutRules];
    [self testValidateWithOneValidRule];
    [self testValidateWithValidRules];
    [self testValidateWithOneInvalidRule];
    [self testValidateWithInvalidRules];

    [self testInstanceMethod];
    [self testSyntaxSugarMethods];
}

+ (void)testEmptyRules
{
    HBValidator *validator = [[HBValidator alloc] init];
    AssertTrue([validator getRules].count == 0);
}

+ (void)testOneRule
{
    HBValidator *validator = [[HBValidator alloc] init];
    [validator addRule:[[HBUppercase alloc] init]];
    AssertTrue([validator getRules].count == 1);
}

+ (void)testTwoRules
{
    HBValidator *validator = [[HBValidator alloc] init];
    [validator addRule:[[HBUppercase alloc] init]];
    [validator addRule:[[HBStartsWith alloc] initWithValue:@"J"]];
    AssertTrue([validator getRules].count == 2);
}

+ (void)testChainRules
{
    HBValidator *validator = [[HBValidator alloc] init];
    [[validator addRule:[[HBUppercase alloc] init]] addRule:[[HBStartsWith alloc] initWithValue:@"J"]];
    AssertTrue([validator getRules].count == 2);
}

#pragma mark - Assert
+ (void)testAssertWithoutRules
{
    HBValidator *validator = [[HBValidator alloc] init];

    HBAssertResult *result = [validator assert:@""];
    AssertTrue(result.isValid);
    AssertTrue(result.invalidRules.count == 0);

    result = [validator assert:@"J"];
    AssertTrue(result.isValid);
    AssertTrue(result.invalidRules.count == 0);
}

+ (void)testAssertWithOneValidRule
{
    HBValidator *validator = [[HBValidator alloc] init];
    [validator addRule:[[HBUppercase alloc] init]];

    HBAssertResult *result = [validator assert:@"JEAN"];
    AssertTrue(result.isValid);
    AssertTrue(result.invalidRules.count == 0);
}

+ (void)testAssertWithValidRules
{
    HBValidator *validator = [[HBValidator alloc] init];
    [validator addRule:[[HBUppercase alloc] init]];
    [validator addRule:[[HBStartsWith alloc] initWithValue:@"J"]];

    HBAssertResult *result = [validator assert:@"JEAN"];
    AssertTrue(result.isValid);
    AssertTrue(result.invalidRules.count == 0);
}

+ (void)testAssertWithOneInvalidRule
{
    HBValidator *validator = [[HBValidator alloc] init];
    [validator addRule:[[HBUppercase alloc] init]];
    [validator addRule:[[HBStartsWith alloc] initWithValue:@"J"]];

    HBAssertResult *result = [validator assert:@"FOOBAR"];
    AssertFalse(result.isValid);
    AssertTrue(result.invalidRules.count == 1);
    AssertTrue([result.invalidRules[0] isMemberOfClass:[HBStartsWith class]]);
}

+ (void)testAssertWithInvalidRules
{
    HBValidator *validator = [[HBValidator alloc] init];
    [validator addRule:[[HBLowercase alloc] init]];
    [validator addRule:[[HBStartsWith alloc] initWithValue:@"j"]];

    HBAssertResult *result = [validator assert:@"FOOBAR"];
    AssertFalse(result.isValid);
    AssertTrue(result.invalidRules.count == 2);
    AssertTrue([result.invalidRules[0] isMemberOfClass:[HBLowercase class]]);
    AssertTrue([result.invalidRules[1] isMemberOfClass:[HBStartsWith class]]);
}

#pragma mark - Check
+ (void)testCheckWithoutRules
{
    HBValidator *validator = [[HBValidator alloc] init];

    HBCheckResult *result = [validator check:@""];
    AssertTrue(result.isValid);
    AssertTrue(result.invalidRule == nil);

    result = [validator check:@"J"];
    AssertTrue(result.isValid);
    AssertTrue(result.invalidRule == nil);
}

+ (void)testCheckWithOneValidRule
{
    HBValidator *validator = [[HBValidator alloc] init];
    [validator addRule:[[HBUppercase alloc] init]];

    HBCheckResult *result = [validator check:@"JEAN"];
    AssertTrue(result.isValid);
    AssertTrue(result.invalidRule == nil);
}

+ (void)testCheckWithValidRules
{
    HBValidator *validator = [[HBValidator alloc] init];
    [validator addRule:[[HBUppercase alloc] init]];
    [validator addRule:[[HBStartsWith alloc] initWithValue:@"J"]];

    HBCheckResult *result = [validator check:@"JEAN"];
    AssertTrue(result.isValid);
    AssertTrue(result.invalidRule == nil);
}

+ (void)testCheckWithOneInvalidRule
{
    HBValidator *validator = [[HBValidator alloc] init];
    [validator addRule:[[HBUppercase alloc] init]];
    [validator addRule:[[HBStartsWith alloc] initWithValue:@"J"]];

    HBCheckResult *result = [validator check:@"FOOBAR"];
    AssertFalse(result.isValid);
    AssertTrue(result.invalidRule != nil);
    AssertTrue([result.invalidRule isMemberOfClass:[HBStartsWith class]]);
}

+ (void)testCheckWithInvalidRule
{
    HBValidator *validator = [[HBValidator alloc] init];
    [validator addRule:[[HBLowercase alloc] init]];
    [validator addRule:[[HBStartsWith alloc] initWithValue:@"j"]];

    HBCheckResult *result = [validator check:@"FOOBAR"];
    AssertFalse(result.isValid);
    AssertTrue(result.invalidRule != nil);
    AssertTrue([result.invalidRule isMemberOfClass:[HBLowercase class]]);
}


#pragma mark - Validate
+ (void)testValidateWithoutRules
{
    HBValidator *validator = [[HBValidator alloc] init];
    AssertTrue([validator validate:@""]);
    AssertTrue([validator validate:@"J"]);
}

+ (void)testValidateWithOneValidRule
{
    HBValidator *validator = [[HBValidator alloc] init];
    [validator addRule:[[HBUppercase alloc] init]];
    AssertTrue([validator validate:@"JEAN"]);
}

+ (void)testValidateWithValidRules
{
    HBValidator *validator = [[HBValidator alloc] init];
    [validator addRule:[[HBUppercase alloc] init]];
    [validator addRule:[[HBStartsWith alloc] initWithValue:@"J"]];
    AssertTrue([validator validate:@"JEAN"]);
}

+ (void)testValidateWithOneInvalidRule
{
    HBValidator *validator = [[HBValidator alloc] init];
    [validator addRule:[[HBUppercase alloc] init]];
    [validator addRule:[[HBStartsWith alloc] initWithValue:@"J"]];
    AssertFalse([validator validate:@"FOOBAR"]);
}

+ (void)testValidateWithInvalidRules
{
    HBValidator *validator = [[HBValidator alloc] init];
    [validator addRule:[[HBLowercase alloc] init]];
    [validator addRule:[[HBStartsWith alloc] initWithValue:@"j"]];
    AssertFalse([validator validate:@"FOOBAR"]);
}

#pragma mark - Sugar
+ (void)testInstanceMethod
{
    HBValidator *validator = [HBValidator addRule:[[HBUppercase alloc] init]];
    [validator addRule:[[HBStartsWith alloc] initWithValue:@"J"]];
    AssertTrue([validator validate:@"JEAN"]);

    validator = [[HBValidator addRule:[[HBUppercase alloc] init]] addRule:[[HBStartsWith alloc] initWithValue:@"J"]];
    AssertTrue([validator validate:@"JEAN"]);

    AssertTrue([[[HBValidator addRule:[[HBUppercase alloc] init]] addRule:[[HBStartsWith alloc] initWithValue:@"J"]] validate:@"JEAN"]);
}

+ (void)testSyntaxSugarMethods
{
    AssertTrue([[[HBValidator addRule:[[HBUppercase alloc] init]] addRule:[[HBStartsWith alloc] initWithValue:@"J"]] validate:@"JEAN"]);

    AssertTrue([[[[[HBValidator alloc] init] addRule:[[HBUppercase alloc] init]] addRule:[[HBStartsWith alloc] initWithValue:@"J"]] validate:@"JEAN"]);

    AssertTrue([[[HBValidator mustBe:[HBUppercase new]] andMust:[[HBStartsWith alloc] initWithValue:@"J"]] validate:@"JEAN"]);

    AssertTrue([[[HBValidator must:[[HBStartsWith alloc] initWithValue:@"J"]] and:[[HBEndsWith alloc] initWithValue:@"N"]] validate:@"JEAN"]);

    AssertTrue([[[[HBValidator must:[[HBStartsWith alloc] initWithValue:@"J"]] and:[[HBEndsWith alloc] initWithValue:@"N"]] andMustHave:[[HBLength alloc] initWithMin:3 max:60]] validate:@"JEAN"]);

    HBValidator *username = [HBValidator new];
    [username must:[[HBStartsWith alloc] initWithValue:@"J"]];
    [username must:[[HBEndsWith alloc] initWithValue:@"N"]];
    [username mustHave:[[HBLength alloc] initWithMin:3 max:60]];
    AssertTrue([username validate:@"JEAN"]);
}

@end
