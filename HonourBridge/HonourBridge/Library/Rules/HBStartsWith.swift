//
//  HBStartsWith.swift
//  HonourBridge
//
//  Created by Jean Pimentel on 5/5/15.
//
//

import Foundation

@objc public class HBStartsWith : HBRule {

    public init(value: String) {
        super.init()
        self.rule = StartsWith(startValue: value);
    }

    public init(value: String, caseSensitive: Bool) {
        super.init()
        self.rule = StartsWith(startValue: value, caseSensitive: caseSensitive);
    }
    
}