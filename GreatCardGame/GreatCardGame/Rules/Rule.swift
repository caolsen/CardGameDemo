//
//  Rule.swift
//  GreatCardGame
//
//  Created by Christopher Olsen on 4/8/19.
//  Copyright © 2019 Christopher Olsen. All rights reserved.
//

import Foundation

struct RuleChecker {

    var activeRule = LiftRule.self

    func checkCardForPoints(_ card: Card) -> Int {
        return activeRule.calculatePoints(for: card)
    }
}

protocol Rule {
    static func calculatePoints(for card: Card) -> Int
}

struct SimpleRule: Rule {

    /// A very simple rule. Each card is worth it's face
    /// value in points.
    static func calculatePoints(for card: Card) -> Int {
        return card.numericValue
    }
}

struct DavonteRule: Rule {

    static func calculatePoints(for card: Card) -> Int {
        if card.suit?.color == .red {
            return -13
        } else {
            return card.numericValue
        }
    }
}

struct LiftRule: Rule {

    static func calculatePoints(for card: Card) -> Int {
        if card.numericValue < 10 {
            return 100
        } else if card.numericValue > 10 {
            return -50
        } else {
            return card.numericValue
        }
    }
}
