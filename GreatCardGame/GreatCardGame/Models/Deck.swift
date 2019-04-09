//
//  Deck.swift
//  GreatCardGame
//
//  Created by Christopher Olsen on 4/6/19.
//  Copyright © 2019 Christopher Olsen. All rights reserved.
//

import Foundation

struct Deck {
    static let defaultDeck: [Suit] = [.club, .diamond, .heart, .spade]

    var cards: [Card] = []

    init(useSuits suits: [Suit], addJokers: Bool = false) {
        func generateSuit(_ suit: Suit, startingAt index: Int = 1) {
            guard let cardValue = CardValue(rawValue: index) else { return }

            let card  = Card(suit: suit, value: cardValue)
            print("Adding the \(card.value) of \(card.suit!)s")

            cards.append(card)
            generateSuit(suit, startingAt: index + 1)
        }

        for suit in suits {
            generateSuit(suit)
        }

        if addJokers {
            cards.append(Card(suit: nil, value: .joker))
            cards.append(Card(suit: nil, value: .joker))
        }
    }

    func drawCard() -> Card {
        return cards[Int.random(in: 0...cards.count)]
    }
}
