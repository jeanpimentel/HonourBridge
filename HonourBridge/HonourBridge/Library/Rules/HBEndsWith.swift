//
//  HBEndsWith.swift
//  HonourBridge
//
//  Created by Jean Pimentel on 5/5/15.
//
//

import Foundation

@objc public class HBEndsWith : HBRule {

    public init(value: String) {
        super.init()
        self.rule = EndsWith(endValue: value);
    }

    public init(value: String, caseSensitive: Bool) {
        super.init()
        self.rule = EndsWith(endValue: value, caseSensitive: caseSensitive);
    }
    
}