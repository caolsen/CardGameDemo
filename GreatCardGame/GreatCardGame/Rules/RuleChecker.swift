//
//  RuleChecker.swift
//  GreatCardGame
//
//  Created by Christopher Olsen on 4/13/22.
//  Copyright © 2022 Christopher Olsen. All rights reserved.
//

import Foundation

struct RuleChecker {
    let rule: Rule
    
    init(rule: Rule) {
        self.rule = rule
    }

    func checkCardForPoints(_ card: Card) -> Int {
        return rule.calculatePoints(for: card)
    }
}
