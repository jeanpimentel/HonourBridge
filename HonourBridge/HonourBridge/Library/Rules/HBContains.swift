//
//  HBContains.swift
//  HonourBridge
//
//  Created by Jean Pimentel on 5/5/15.
//
//

import Foundation

@objc public class HBContains : HBRule {

    public init(value: String) {
        super.init()
        self.rule = Contains(value: value)
    }

    public init(value: String, caseSensitive: Bool) {
        super.init()
        self.rule = Contains(value: value, caseSensitive: caseSensitive)
    }
    
}