//
//  HBValidator.swift
//  HonourBridge
//
//  Created by Jean Pimentel on 5/6/15.
//
//

import Foundation
import Swift

@objc public class HBAssertResult {
    public var isValid: Bool
    public var invalidRules: Array<HBRule>
    public init(isValid: Bool, invalidRules: Array<HBRule>) {
        self.isValid = isValid
        self.invalidRules = invalidRules
    }
}

@objc public class HBCheckResult {
    public var isValid: Bool
    public var invalidRule: HBRule?
    public init(isValid: Bool) {
        self.isValid = isValid
    }
    public init(isValid: Bool, invalidRule: HBRule) {
        self.isValid = isValid
        self.invalidRule = invalidRule
    }
}

@objc public class HBValidator : NSObject {

    private var validator: Validator
    private var mapRules: Dictionary<Rule, HBRule>

    public override init() {
        self.validator = Validator()
        self.mapRules = [:]
    }

    public func addRule(rule: HBRule) {
        if let rawRule = rule.getRawRule() {
            self.mapRules[rawRule] = rule
            self.validator.addRule(rawRule)
        }
    }

    public func getRules() -> Array<HBRule> {
        var rules: Array<HBRule> = []
        for rule in self.mapRules {
            rules.append(rule.1)
        }
        return rules
    }


    public func assert(value: String) -> HBAssertResult {

        let assert = self.validator.assert(value);

        var invalidRules: Array<HBRule> = []
        for invalidRule in assert.invalidRules {
            if let bridgeRule : HBRule = self.mapRules[invalidRule] {
                invalidRules.append(bridgeRule)
            }
        }

        return HBAssertResult(isValid: assert.isValid, invalidRules: invalidRules)
    }

    public func check(value: String) -> HBCheckResult {

        let check = self.validator.check(value);

        if check.isValid {
            return HBCheckResult(isValid: true)
        }

        if let rule = check.invalidRule {
            if let bridgeRule : HBRule = self.mapRules[rule] {
                return HBCheckResult(isValid: false, invalidRule: bridgeRule)
            }
        }

        return HBCheckResult(isValid: false)
    }

    public func validate(value: String) -> Bool {
        return self.validator.validate(value)
    }

}