//
//  HBUppercase.swift
//  HonourBridge
//
//  Created by Jean Pimentel on 5/5/15.
//
//

import Foundation

@objc public class HBUppercase : HBRule {

    public override init() {
        super.init()
        self.rule = Uppercase()
    }

}