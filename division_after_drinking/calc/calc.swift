//
//  calc.swift
//  division_after_drinking
//
//  Created by Владимир Федоров on 10.07.2022.
//

import Foundation

public func calcAllSumOutcomes(_ outcomes: [Outcome]) -> Int {
    var sum = 0
    for i in 0 ..< outcomes.count {
        sum += outcomes[i].price
    }
    return sum
}

public func calcAllSumPayers(_ payers: [Payer]) -> Int {
    var sum = 0
    for i in 0 ..< payers.count {
        sum += payers[i].price
    }
    return sum
}
