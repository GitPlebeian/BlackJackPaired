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
    
    func getHandValue() -> Int{
        return player.hand.value
    }
    
    func getHouseHandValue() -> Int {
        return house.hand.value
    }
    
    func placeBet(int: Int) {
        player.bet = int
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
        player.cash += player.bet * 2
    }
    
    func playerWon() {
        player.cash += player.bet
    }
    
    func playerLost() {
        player.cash -= player.bet
    }
    
    func isPlayerBust() -> Bool {
        return player.hand.isBust()
    }
    
    func isHouseBust() -> Bool {
        return house.hand.isBust()
    }
    
    func isHouseOver16() -> Bool {
        if house.hand.value >= 17 {
            return true
        }
        return false
    }
    
    func getPlayerCash() -> Int {
        return player.cash
    }
    
    func getPlayerHand() -> [Card] {
        return player.hand.cards
    }
    
    func getHouseHand() -> [Card] {
        return house.hand.cards
    }
    
    func houseHit(completion: (Card, Bool) -> Void) {
        house.hand.hit()
        completion(house.hand.cards[house.hand.cards.count - 1], house.hand.isBust())
    }
    
    func playerHit(completion: (Card) -> Void) {
        player.hand.hit()
        completion(player.hand.cards[player.hand.cards.count - 1])
    }
}
