//
//  HBTestable.h
//  HonourBridge
//
//  Created by Jean Pimentel on 5/12/15.
//  Copyright (c) 2015 Jean Pimentel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <HonourBridge-Swift.h>

#define AssertTrue(condition) NSAssert(condition, @"")
#define AssertFalse(condition) NSAssert(!condition, @"")

@protocol HBTestable <NSObject>

+ (void)test;

@end
