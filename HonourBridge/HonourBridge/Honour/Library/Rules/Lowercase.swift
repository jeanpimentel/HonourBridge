//
//  Lowercase.swift
//  Honour
//
//  Created by Jean Pimentel on 4/30/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class Lowercase : Rule {

    public override func validate(value: String) -> Bool {
        return value.lowercaseString == value
    }
}