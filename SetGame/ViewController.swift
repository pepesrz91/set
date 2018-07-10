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
    //var deck = Deck()
//    var selectedCards : [Card]
    var selectedCards:[Int]! {
        didSet(newValue) {
            if(selectedCards.count == 3){
                //Check for match method that accepts an array of indexes in Set class
                let set = game.checkMatcOfCardsWith(Indexes:selectedCards)
                print(set)
                selectedCards = []
            } else {
                return
            }
        }
    }
    
    @IBOutlet var cardButton: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(deck.deck)
        //let selectedCards = [deck.deck[30],deck.deck[5],deck.deck[60]]
        selectedCards = []
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        for index in cardButton.indices{
            let card = game.deck.deck[index]
            print(card)
            makeButtonWith(card: card, button: cardButton[index])
        
        }
    }
    @IBAction func selectCard(_ sender: UIButton) {
        var index = 0

        if let cardIndex = cardButton.index(of: sender) {
            index = cardIndex
        } else {
            print("The card is out of range or something went wrong")
            return
        }
        
        if (!selectedCards.contains(index) && (selectedCards.count < 3)){
            selectedCards.append(index)
            } else {
            return
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // FUNCTION RESPONSIBLE FOR DRAWING THE CARDS ON UI BUTTONS
    // Function that accepts a card and return a button with layout
    func makeButtonWith(card c:Card, button:UIButton) -> () {
        var shape = ""
        var buttonTitle = ""
        //var title:String = ""
        //let button:UIButton = UIButton.init()
        switch c.color {
        case .Blue:
            button.tintColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        case .Green:
            button.tintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        case .Red:
            button.tintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
        switch c.shape {
        case .Triangle:
            shape = "▲"
        case .Circle:
            shape = "●"
        case .Square:
            shape = "■"
        }
        switch c.amount {
        case .One:
            buttonTitle = shape
            //button.setTitle(shape, for: .normal)
        case .Two:
            buttonTitle = shape + " " + shape
            //button.setTitle(shape + " " + shape, for: .normal)
        case .Three:
            buttonTitle = shape + " " + shape + " " + shape
            //button.setTitle(shape + " " + shape + " " + shape, for: .normal)
        
        }
        switch c.shadow {
        case .Empty:
            let shapeEmpty = NSAttributedString(string: buttonTitle, attributes: [NSAttributedStringKey.strokeWidth:10])
            button.setAttributedTitle(shapeEmpty, for: .normal)
        case .Full:
            let shapeFill = NSAttributedString(string: buttonTitle, attributes: [NSAttributedStringKey.strokeWidth:-10])
            button.setAttributedTitle(shapeFill, for: .normal)
        case .Stripes:
            let shapeStriped = NSAttributedString(string: buttonTitle,
                                                  attributes: [NSAttributedStringKey.foregroundColor:button.tintColor.withAlphaComponent(0.15)])
            button.setAttributedTitle(shapeStriped, for: .normal)
        }
  }
}
