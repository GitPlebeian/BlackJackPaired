//
//  GameController.swift
//  BlackJackPaired
//
//  Created by Jackson Tubbs on 9/4/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import Foundation

class GameController  {
    
    static let shared = GameController()
    
    var player = Player()
    var house = Player()
    
    func reset() {
        player = Player()
        house = Player()
    }
    
    func newRound() {
        CardController.shared.newDeck()
        player.hand.setInitialHand()
        house.hand.setInitialHand()
    }
    
    func placeBet(int: Int) {
        player.bet = 0
    }
    
    func isHouse21() -> Bool {
        if house.hand.value == 21 {
            return true
        } else {
            return false
        }
    }
    
    func isPlayer21() -> Bool {
        if player.hand.value == 21 {
            return true
        } else {
            return false
        }
    }
    
    func playerWon21() {
    
    }
    
    func playerWon() {
        
    }
    
    func playerLost() {
        
    }
    
    func isPlayerBust() -> Bool {
        return true
    }
    
    func isHouseBust() -> Bool {
        return true
    }
    
    func houseHit(completion: (Card, Bool) -> Void) {
        completion(Card(title: "3", value: 3), false)
    }
    
    func playerHit(completion: (Card) -> Void) {
        player.hand.hit()
        completion(player.hand.cards[player.hand.cards.count - 1])
    }
}
