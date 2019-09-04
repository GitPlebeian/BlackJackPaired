//
//  DeckController.swift
//  BlackJackPaired
//
//  Created by Jackson Tubbs on 9/4/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import Foundation

class CardController {
    
    static let shared = CardController()
    
    var cards: [Card] = []
    
    func newDeck() {
        let cards: [Card] = {
            let two = Card(title: "2", value: 2)
            let three = Card(title: "3", value: 3)
            let four = Card(title: "4", value: 4)
            let five = Card(title: "5", value: 5)
            let six = Card(title: "6", value: 6)
            let seven = Card(title: "7", value: 7)
            let eight = Card(title: "8", value: 8)
            let nine = Card(title: "9", value: 9)
            let ten = Card(title: "10", value: 10)
            let jack = Card(title: "J", value: 10)
            let queen = Card(title: "Q", value: 10)
            let king = Card(title: "K", value: 10)
            let ace = Card(title: "A", value: 11)
            
            let cardsArray = [two, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace]
            var finalDeck: [Card] = []
            
            for card in cardsArray {
                var time = 0
                while time < 4 {
                    finalDeck.append(card)
                }
                time += 1
            }
            return finalDeck
        }()
        self.cards = cards
    }
    
    func getCard() -> Card {
        let indexOfCard = Int.random(in: 0..<cards.count)
        return cards.remove(at: indexOfCard)
    }
}
