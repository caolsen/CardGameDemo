//
//  Player.swift
//  GreatCardGame
//
//  Created by Christopher Olsen on 4/6/19.
//  Copyright © 2019 Christopher Olsen. All rights reserved.
//

import Foundation

struct Player {
    let name: String
    var points: Int

    init(name: String = "", points: Int = 0) {
        self.name = name
        self.points = points
    }
}
