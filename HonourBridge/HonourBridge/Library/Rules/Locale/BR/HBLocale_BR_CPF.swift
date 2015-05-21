//
//  HBLocale_BR_CPF.swift
//  HonourBridge
//
//  Created by Jean Pimentel on 5/19/15.
//
//

import Foundation

@objc public class HBLocale_BR_CPF : HBRule {

    public override init() {
        super.init()
        self.rule = BR_CPF()
    }

    public init(strict: Bool) {
        super.init()
        self.rule = BR_CPF(strict: strict);
    }

}