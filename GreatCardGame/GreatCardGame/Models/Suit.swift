//
//  Suit.swift
//  GreatCardGame
//
//  Created by Christopher Olsen on 4/6/19.
//  Copyright © 2019 Christopher Olsen. All rights reserved.
//

import Foundation

enum Suit {
    case club
    case diamond
    case heart
    case spade

    var color: CardColor {
        switch self {
        case .diamond, .heart:
            return .red
        case .club, .spade:
            return .black
        }
    }

    var characterForImageName: String {
        switch self {
        case .club:
            return "C"
        case .diamond:
            return "D"
        case .heart:
            return "H"
        case .spade:
            return "S"
        }
    }
}
