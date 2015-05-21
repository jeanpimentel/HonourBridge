//
//  HBNotEmpty.swift
//  HonourBridge
//
//  Created by Jean Pimentel on 5/18/15.
//
//

import Foundation

@objc public class HBNotEmpty : HBRule {

    public override init() {
        super.init()
        self.rule = NotEmpty()
    }

}