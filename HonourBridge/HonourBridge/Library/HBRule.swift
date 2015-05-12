//
//  HBRule.swift
//  HonourBridge
//
//  Created by Jean Pimentel on 5/6/15.
//
//

import Foundation

public class HBRule : NSObject {

    var rule: Rule?

    public override init() {
    }

    public func validate(value: String) -> Bool {
        if let rule = self.rule {
            return rule.validate(value)
        }
        return false
    }

    internal func getRawRule() -> Rule? {
        return self.rule
    }
    
}