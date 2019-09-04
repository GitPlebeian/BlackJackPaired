//
//  HandController.swift
//  BlackJackPaired
//
//  Created by Jackson Tubbs on 9/4/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import Foundation

extension Hand {
    
    func setInitialHand(){
        cards = []
        cards.append(CardController.shared.getCard())
        cards.append(CardController.shared.getCard())
        calculateValue()
    }
    
    func hit() {
        cards.append(CardController.shared.getCard())
        calculateValue()
    }
    
    func isBust() -> Bool {
        if value > 21 {
            return true
        } else {
            return false
        }
    }
    
    func is21() -> Bool {
        if cards.count == 2 && value == 21 {
            return true
        } else {
            return false
        }
    }
    
    private func calculateValue() {
        value = 0
        var numberOfAces = 0
        for card in cards {
            if card.title == "A" {
                numberOfAces += 1
            }
            value += card.value
        }
        while value > 21 && numberOfAces > 0 {
            value -= 10
            numberOfAces -= 1
        }
    }
}
