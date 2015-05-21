//
//  HBRegex.swift
//  HonourBridge
//
//  Created by Jean Pimentel on 5/18/15.
//
//

import Foundation

@objc public class HBRegex : HBRule {

    public init(value: String) {
        super.init()
        self.rule = Regex(regex: value);
    }

    public init(value: String, caseInsensitive: Bool) {
        super.init()
        self.rule = Regex(regex: value, caseInsensitive: caseInsensitive);
    }

}