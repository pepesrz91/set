//
//  Deck.swift
//  SetGame
//
//  Created by Krakenn  on 6/20/18.
//  Copyright © 2018 Revelation Tech. All rights reserved.
//

import Foundation


class Deck {
    var deck: [Card] = []
    var randomDeck:[Card] = []
    let shapes: [CardShape] = [.Circle,.Triangle,.Square]
    let colors:[CardColor] = [.Red,.Blue,.Green]
    let shadows:[CardShadow] = [.Empty,.Full,.Stripes]
    let shapesAmounts: [CardAmount] = [.One,.Two,.Three]
    
    static var identifierFactory = 0
    
    init(){
        createDeck()
        randomDeck = createRandomDeck(deck: deck)
        print(randomDeck)
        
    }
    //TODO: Function that shuffles current deck
    
    //TODO: Function that generates the deck with unique cards
    func createDeck(){
        var number = 0
        for shape in shapes{
            for color in colors{
                for shadow in shadows{
                    for amount in shapesAmounts{
                        let newCard = Card(color: color, shape: shape, shadow: shadow, amount: amount, ident: Deck.uniqueIdentifier)
                        deck.append(newCard);
                        print(newCard.indentifier)
                        number += 1
                    }
                }
            }
        }
        print(number)
    }
    
    func createRandomDeck(deck d:[Card])->[Card]{
        var randomDeck = [Card]()
        var deckCopy = deck
        for _ in deck{
            let randomIndex = deckCopy.count.arc4random
            randomDeck.append(deckCopy.remove(at: randomIndex))
        }
        return randomDeck
    }
    
    static func uniqueIdentifier()->Int{
        identifierFactory += 1
        return identifierFactory
    }
    
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
