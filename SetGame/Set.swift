//
//  Set.swift
//  SetGame
//
//  Created by Krakenn  on 6/25/18.
//  Copyright © 2018 Revelation Tech. All rights reserved.
//

import Foundation

// This class holds all of the game's logic
class Set {
    //Create an instance of a deck
    let deck = Deck()
    
    //TODO: Method that takes a deck and shuffles it.
    
    //TODO: Method that will take a deck and return a set match
    
    //TODO: Method that will take an array holding three cards returning true if it is a set
    
    //TODO: Method that takes an array of ints and creates and compares a 3 cards in deck with respect of indes
    func checkMatcOfCardsWith(Indexes indexArray:[Int]) -> Bool {
        var cards = [Card]()
        for i in indexArray {
            let card = deck.randomDeck[i]
            cards.append(card)
        }
        let cardOne = cards[0]
        let cardTwo = cards[1]
        let cardThree = cards[2]
        
        let shape = ((cardOne.shape.rawValue + cardTwo.shape.rawValue + cardThree.shape.rawValue) % 3) == 0
        let color = ((cardOne.color.rawValue + cardTwo.color.rawValue + cardThree.color.rawValue) % 3) == 0
        let size = ((cardOne.amount.rawValue + cardTwo.amount.rawValue + cardThree.amount.rawValue) % 3) == 0
        let shadow = ((cardOne.shadow.rawValue + cardTwo.shadow.rawValue + cardThree.shadow.rawValue) % 3) == 0
        
        //If there is a set remove 3 card and add 3 new
        if (shape && color && size && shadow) {
            print("Set!!")
            for index in indexArray {
                deck.randomDeck.remove(at: index)
            }
            
            return true
        }else{
            print("Not a Set!!")
            return false
        }
    }
}
