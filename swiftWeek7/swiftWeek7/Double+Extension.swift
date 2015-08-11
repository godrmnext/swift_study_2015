//
//  Double+Extension.swift
//  swiftWeek7
//
//  Created by Jung Kim on 8/11/15.
//  Copyright © 2015 NHN NEXT. All rights reserved.
//

import Foundation

extension Double {
    var km: Double { return self * 1_000.0 }
    var m : Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}


extension Int {
    subscript(var digitIndex: Int) -> Int {
        var decimalBase = 1
        while digitIndex > 0 {
            decimalBase *= 10
            --digitIndex
        }
        return (self / decimalBase) % 10
    }
}
extension Int {
    mutating func square() {
        self = self * self
    }
}
extension Int {
    enum Kind {
        case Negative, Zero, Positive
    }
    var kind : Kind {
        switch self {
        case 0: return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
}






