//
//  BlackJackViewController.swift
//  BlackJackPaired
//
//  Created by Blake kvarfordt on 9/4/19.
//  Copyright © 2019 Jax Tubbs. All rights reserved.
//

import UIKit

class BlackJackViewController: UIViewController {

    
    @IBOutlet weak var dealerCardOneLabel: UILabel!
    @IBOutlet weak var dealerCardTwoLabel: UILabel!
    @IBOutlet weak var playerCardOneLabel: UILabel!
    @IBOutlet weak var playerCardTwoLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var dealerCardsStackView: UIStackView!
    @IBOutlet weak var moneyValueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMoneySlider()
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func standButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func hitButtonTapped(_ sender: Any) {
        addLabelToStackView()
        
    }
    
    @IBAction func placeBetButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func moneySliderMoved(_ sender: Any) {
        
    }
    
    var newLabel: UILabel = {
        let newLabel = UILabel()
        return newLabel
    }()
    
    func addLabelToStackView() {
        dealerCardsStackView.addSubview(newLabel)
    }
    
    func setupMoneySlider() {
        moneyValueSlider.value = 5
        moneyValueSlider.minimumValue = 1
        moneyValueSlider.maximumValue = 20
    }
}
