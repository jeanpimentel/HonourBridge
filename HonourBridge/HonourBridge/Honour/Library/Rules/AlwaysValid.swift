//
//  AlwaysValid.swift
//  Honour
//
//  Created by Jean Pimentel on 5/18/15.
//  Copyright (c) 2015 Honour. All rights reserved.
//

import Foundation

public class AlwaysValid: Rule {

    public override func validate(value: String) -> Bool {
        return true
    }

}