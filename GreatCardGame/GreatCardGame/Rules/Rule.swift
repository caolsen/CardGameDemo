//
//  Rule.swift
//  GreatCardGame
//
//  Created by Christopher Olsen on 4/8/19.
//  Copyright © 2019 Christopher Olsen. All rights reserved.
//

import Foundation

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
