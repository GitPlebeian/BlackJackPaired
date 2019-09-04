//
//  BlackJackViewController.swift
//  BlackJackPaired
//
//  Created by Blake kvarfordt on 9/4/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import UIKit

class BlackJackViewController: UIViewController {

    var bet: Int = 0
    
    @IBOutlet weak var dealerCardOneLabel: UILabel!
    @IBOutlet weak var dealerCardTwoLabel: UILabel!
    @IBOutlet weak var dealerCardThreeLabel: UILabel!
    @IBOutlet weak var dealerCardFourLabel: UILabel!
    @IBOutlet weak var dealerCardFiveLabel: UILabel!
    @IBOutlet weak var dealerCardSixLabel: UILabel!
    @IBOutlet weak var dealerCardSevenLabel: UILabel!
    
    @IBOutlet weak var playerCardOneLabel: UILabel!
    @IBOutlet weak var playerCardTwoLabel: UILabel!
    @IBOutlet weak var playerCardThreeLabel: UILabel!
    @IBOutlet weak var playerCardFourLabel: UILabel!
    @IBOutlet weak var playerCardFiveLabel: UILabel!
    @IBOutlet weak var playerCardSixLabel: UILabel!
    @IBOutlet weak var playerCardSevenLabel: UILabel!
    
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var dealerCardsStackView: UIStackView!
    @IBOutlet weak var playerCardsStackView: UIStackView!
    @IBOutlet weak var moneyValueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMoneySlider()
        newRound()
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func standButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func hitButtonTapped(_ sender: Any) {
        addCardToPlayerHand()
        
    }
    
    @IBAction func placeBetButtonTapped(_ sender: Any) {
        let sliderValue = bet
        GameController.shared.placeBet(int: sliderValue)
    }
    
    @IBAction func moneySliderMoved(_ sender: Any) {
        bet = Int(moneyValueSlider.value)
        moneyLabel.text = "\(bet)"
    }
    
    var newDealerCardLabel: UILabel = {
        let newDealerCardLabel = UILabel()
        return newDealerCardLabel
    }()
    
    var newPlayerCardLabel: UILabel = {
        let newPlayerCardLabel = UILabel()
        return newPlayerCardLabel
    }()
    
    func addCardToPlayerHand() {
        GameController.shared.playerHit { (card) in
            self.newPlayerCardLabel.text = card.title
            
        }
        playerCardsStackView.addSubview(newPlayerCardLabel)
        
    }
    
    func addCardToDealerHand() {
        var condition = true
        while condition == true {
            GameController.shared.houseHit { (card, bust) in
                if bust == true {
                    condition = false
                    GameController.shared.playerWon()
                    newRound()
                    
                }
                self.newDealerCardLabel.text = card.title
            }
            dealerCardsStackView.addSubview(newDealerCardLabel)
        }
    }
    
    func newRound() {
        GameController.shared.newRound()
        let playerCards = GameController.shared.getPlayerHand()
        playerCardOneLabel.text = playerCards[0].title
        playerCardTwoLabel.text = playerCards[1].title
        
    }
    
    func setupMoneySlider() {
        moneyValueSlider.value = 5
        moneyValueSlider.minimumValue = 1
        moneyValueSlider.maximumValue = 20
    }
}
