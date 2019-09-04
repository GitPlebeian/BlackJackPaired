//
//  Player.swift
//  BlackJackPaired
//
//  Created by Jackson Tubbs on 9/4/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import Foundation

struct PlayerContants {
    static let startingCash = 1000
}

class Player {
    
    var hand: Hand
    var cash: Int
    var bet: Int
    
    init() {
        self.hand = Hand()
        self.cash = PlayerContants.startingCash
        self.bet = 0
    }
}
