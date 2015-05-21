//
//  HBAlwaysValid.swift
//  HonourBridge
//
//  Created by Jean Pimentel on 5/18/15.
//
//

import Foundation

@objc public class HBAlwaysValid : HBRule {

    public override init() {
        super.init()
        self.rule = AlwaysValid()
    }

}