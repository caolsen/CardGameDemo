//
//  RuleChecker.swift
//  GreatCardGame
//
//  Created by Christopher Olsen on 4/8/19.
//  Copyright © 2019 Christopher Olsen. All rights reserved.
//

import Foundation

struct RuleChecker {

    var activeRule = SimpleRule.self

    func checkCardForPoints(_ card: Card) -> Int {
        return activeRule.calculatePoints(for: card)
    }
}
