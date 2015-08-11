//
//  Blackjack.swift
//  swiftWeek7
//
//  Created by Jung Kim on 8/11/15.
//  Copyright © 2015 NHN NEXT. All rights reserved.
//

import Foundation

struct BlackjackCard {
    enum Suit : Character {
        case Spades="S", Hearts="H", Diamonds="D", Clubs="C"
    }
    enum Rank : Int {
        case Two=2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .Ace: return Values(first: 1, second: 11)
            case .Jack, .Queen, .King: return Values(first: 10, second: nil)
            default: return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    let rank: Rank, suit: Suit
}