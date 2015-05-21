//
//  HBEmail.swift
//  HonourBridge
//
//  Created by Jean Pimentel on 5/18/15.
//
//

import Foundation

@objc public class HBEmail : HBRule {

    public override init() {
        super.init()
        self.rule = Email()
    }

}