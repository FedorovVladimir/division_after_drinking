//
//  calc.swift
//  division_after_drinking
//
//  Created by Владимир Федоров on 10.07.2022.
//

import Foundation

public func calcAllSumOutcomes(_ outcomes: [Outcome]) -> Int {
    var sum = 0
    for i in 0..<outcomes.count {
        sum += outcomes[i].price
    }
    return sum
}

public func calcAllSumPayers(_ payers: [Payer]) -> Int {
    var sum = 0
    for i in 0..<payers.count {
        sum += payers[i].price
    }
    return sum
}

public func calc(_ outcomes: [Outcome], _ payers: [Payer]) -> [Payer] {
    var payers = payers
    if payers.count == 0 {
        return payers
    }

    let payersCount = payers.count
    var payersAlcoholCount = 0
    for i in 0..<payersCount {
        if payers[i].isDrinkAlcohol {
            payersAlcoholCount += 1
        }
    }
    var payersMeatCount = 0
    for i in 0..<payersCount {
        if payers[i].isEatMeat {
            payersMeatCount += 1
        }
    }

    var outcomeSum = 0
    var outcomeAlcoholSum = 0
    var outcomeMeatSum = 0
    for i in 0..<outcomes.count {
        if outcomes[i].isAlcohol {
            outcomeAlcoholSum += outcomes[i].price
            continue
        }
        if outcomes[i].isMeat {
            outcomeMeatSum += outcomes[i].price
            continue
        }
        outcomeSum += outcomes[i].price
    }

    let oneItemSum = outcomeSum / payersCount
    var oneItemAlcoholSum = 0
    if payersAlcoholCount != 0 {
        oneItemAlcoholSum = outcomeAlcoholSum / payersAlcoholCount
    }
    var oneItemMeatSum = 0
    if payersMeatCount != 0 {
        oneItemMeatSum = outcomeMeatSum / payersMeatCount
    }

    for i in 0..<payersCount {
        payers[i].price = oneItemSum
        if payers[i].isDrinkAlcohol {
            payers[i].price += oneItemAlcoholSum
        }
        if payers[i].isEatMeat {
            payers[i].price += oneItemMeatSum
        }
    }
    return payers
}
