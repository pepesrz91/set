//
//  ViewController.swift
//  SetGame
//
//  Created by Krakenn  on 6/18/18.
//  Copyright © 2018 Revelation Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var game = Set()
    var deck = Deck()
//    var selectedCards : [Card]
    var selectedCards:[Int]! {
        didSet(newValue) {
            if(selectedCards.count == 3){
                //Check for match method that accepts an array of indexes in Set class
                var set = game.checkMatcOfCardsWith(Indexes:selectedCards)
                print(set)
            }else{
                return
            }
            
        }
    }
    
    
   
    @IBOutlet var cardButton: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(deck.deck)
        //let selectedCards = [deck.deck[30],deck.deck[5],deck.deck[60]]
        selectedCards = []
    
    }
    @IBAction func selectCard(_ sender: UIButton) {
        
        var index = 0
        if let cardIndex = cardButton.index(of: sender) {
            index = cardIndex
        }else{
            print("The card is out of range or something went wrong")
            return
        }
        if (!selectedCards.contains(index) && (selectedCards.count < 3)){
            selectedCards.append(index)
            }else{
            return
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

