//
//  Card.swift
//  SetGame
//
//  Created by Krakenn  on 6/20/18.
//  Copyright © 2018 Revelation Tech. All rights reserved.
//

import Foundation

enum CardColor:Int {
    case Red = 1
    case Blue = 2
    case Green = 3
}

enum CardShape:Int {
    case Circle = 1
    case Triangle = 2
    case Square = 3
}

enum CardShadow:Int {
    case Empty = 1
    case Stripes = 2
    case Full = 3
}

enum CardAmount:Int {
    case One = 1
    case Two = 2
    case Three = 3
}

class Card: Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.indentifier == rhs.indentifier
    }
    
    
    let indentifier: Int
    let color : CardColor
    let shape : CardShape
    let shadow : CardShadow
    let amount : CardAmount
    
    init(color c:CardColor ,shape s:CardShape ,shadow sh:CardShadow ,amount a:CardAmount,ident:()->Int){
        color = c
        shape = s
        shadow = sh
        amount = a
        indentifier = ident()
    }
    
    
    
    

}


