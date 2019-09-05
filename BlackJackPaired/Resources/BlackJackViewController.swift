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
    @IBOutlet weak var placeBetButton: UIButton!
    @IBOutlet weak var standButton: UIButton!
    @IBOutlet weak var hitButton: UIButton!
    @IBOutlet weak var valueOfHandLabel: UILabel!
    
    // MARK: - Properties
    
    var currentCard = 2
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideLabels()
        setupMoneySlider()
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func standButtonTapped(_ sender: Any) {
        endPlayerTurn()
    }
    
    @IBAction func hitButtonTapped(_ sender: Any) {
        currentCard += 1
        addCardToPlayerHand()
    }
    
    @IBAction func placeBetButtonTapped(_ sender: Any) {
        GameController.shared.placeBet(int: bet)
        newRound()
        moneyValueSlider.isHidden = true
        placeBetButton.isHidden = true
    }
    
    @IBAction func moneySliderMoved(_ sender: Any) {
        bet = Int(moneyValueSlider.value)
        moneyLabel.text = "\(bet)"
    }
    
    // MARK: - Custom Functions
    
    func endPlayerTurn() {
        
        
        
        var condition = true
        while condition == true {
            GameController.shared.houseHit { (card, isBust) in
                if isBust {
                    GameController.shared.playerWon()
                    presentBasicAlert(message: "You Win: Dealer Bust")
                    hideLabels()
                    setupMoneySlider()
                    condition = false
                }
            }
            if condition == false {
                return
            }
            if GameController.shared.isHouseOver16() {
                condition = false
            }
        }
        if GameController.shared.getHandValue() > GameController.shared.getHouseHandValue() {
            GameController.shared.playerWon()
            presentBasicAlert(message: "You Win: Greater Hand")
            hideLabels()
            setupMoneySlider()
        } else {
            presentBasicAlert(message: "You Lost: Dealer has big hand")
            GameController.shared.playerLost()
            hideLabels()
            setupMoneySlider()
        }
    }
    
    func playerLost(message: String) {
        presentBasicAlert(message: "You Lost: \(message)")
        GameController.shared.playerLost()
        hideLabels()
        setupMoneySlider()
    }
    
    func updateHandValue() {
        valueOfHandLabel.text = "\(GameController.shared.getHandValue())"
    }
    
    func hideLabels() {
        dealerCardOneLabel.isHidden = true
        dealerCardTwoLabel.isHidden = true
        dealerCardThreeLabel.isHidden = true
        dealerCardFourLabel.isHidden = true
        dealerCardFiveLabel.isHidden = true
        dealerCardSixLabel.isHidden = true
        dealerCardSevenLabel.isHidden = true
        
        playerCardOneLabel.isHidden = true
        playerCardTwoLabel.isHidden = true
        playerCardThreeLabel.isHidden = true
        playerCardFourLabel.isHidden = true
        playerCardFiveLabel.isHidden = true
        playerCardSixLabel.isHidden = true
        playerCardSevenLabel.isHidden = true
        standButton.isHidden = true
        hitButton.isHidden = true
        valueOfHandLabel.isHidden = true
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
        var outlet: UILabel
        
        switch currentCard {
        case 3: outlet = playerCardThreeLabel
        case 4: outlet = playerCardFourLabel
        case 5: outlet = playerCardFiveLabel
        case 6: outlet = playerCardSixLabel
        case 7: outlet = playerCardSevenLabel
        default:
            outlet = playerCardThreeLabel
        }
        GameController.shared.playerHit { (card) in
            outlet.text = card.title
            outlet.isHidden = false
        }
        updateHandValue()
        if GameController.shared.isPlayerBust() {
            playerLost(message: "You Bust! Hand Value: \(GameController.shared.getHandValue())")
        }
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
        playerCardOneLabel.isHidden = false
        playerCardTwoLabel.isHidden = false
        valueOfHandLabel.isHidden = false
        playerCardOneLabel.text = playerCards[0].title
        playerCardTwoLabel.text = playerCards[1].title
        updateHandValue()
        standButton.isHidden = false
        hitButton.isHidden = false
//        hitOrStand()
    }
    
//    func hitOrStand() {
//        standButton.isHidden = false
//        hitButton.isHidden = false
//
//    }
    
    func setupMoneySlider() {
        placeBetButton.isHidden = false
        moneyValueSlider.isHidden = false
        moneyLabel.text = "\(Int(GameController.shared.getPlayerCash() / 2))"
        moneyValueSlider.minimumValue = 1
        moneyValueSlider.maximumValue = Float(GameController.shared.getPlayerCash())
        moneyValueSlider.value = Float(GameController.shared.getPlayerCash() / 2)
    }
    
    func presentBasicAlert(message: String) {
        let alertController = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
}
