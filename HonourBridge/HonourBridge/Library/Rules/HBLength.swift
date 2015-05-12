//
//  HBLength.swift
//  HonourBridge
//
//  Created by Jean Pimentel on 5/5/15.
//
//

import Foundation

@objc public class HBLength : HBRule {

    public init(min: Int) {
        super.init()
        self.rule = Length(min: min)
    }

    public init(max: Int) {
        super.init()
        self.rule = Length(max: max)
    }

    public init(min: Int, max: Int) {
        super.init()
        self.rule = Length(min: min, max: max)
    }

}