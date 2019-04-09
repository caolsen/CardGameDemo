//
//  Card.swift
//  GreatCardGame
//
//  Created by Christopher Olsen on 4/6/19.
//  Copyright © 2019 Christopher Olsen. All rights reserved.
//

import Foundation

enum CardColor {
    case black
    case red
}

enum CardValue: Int {

    // face cards
    case ace = 1
    case jack = 11
    case queen = 12
    case king = 13

    case two = 2, three, four, five, six, seven, eight, nine, ten

    case joker = 0

    var characterForImageName: String? {
        switch self {
        case .ace, .jack, .queen, .king:
            guard let character = "\(self)".first else { return nil }
            return String(character).uppercased()
        default:
            return "\(rawValue)"
        }
    }
}

struct Card {
    let suit: Suit?
    let value: CardValue

    var numericValue: Int {
        return value.rawValue
    }

    var imageName: String? {
        guard let suit = suit, let valueCharacter = value.characterForImageName else { return nil }
        return valueCharacter + "\(suit.characterForImageName)"
    }
}
