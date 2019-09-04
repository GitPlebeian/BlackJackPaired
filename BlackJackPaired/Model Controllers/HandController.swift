//
//  HandController.swift
//  BlackJackPaired
//
//  Created by Jackson Tubbs on 9/4/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import Foundation

class HandController {
    
    static func getInitialHand(hand: Hand) {
        hand.cards.append(CardController.shared.getCard())
        hand.cards.append(CardController.shared.getCard())
        calculateValue(hand: hand)
    }
    
    static func hit(hand: Hand) {
        hand.cards.append(CardController.shared.getCard())
        calculateValue(hand: hand)
    }
    
    static func isBust(hand: Hand) -> Bool {
        if hand.value > 21 {
            return true
        } else {
            return false
        }
    }
    
    private static func calculateValue(hand: Hand) {
        
    }
}
