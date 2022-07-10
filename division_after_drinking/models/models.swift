//
//  models.swift
//  division_after_drinking
//
//  Created by Владимир Федоров on 03.07.2022.
//

import Foundation

public struct Payer: Hashable, Codable {
    var id: Int
    var firstName: String
    var lastName: String
    var isDrinkAlcohol: Bool
    var isEatMeat: Bool
    public var price: Int

    public init(id: Int, firstName: String, lastName: String, isDrinkAlcohol: Bool, isEatMeat: Bool, price: Int) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.isDrinkAlcohol = isDrinkAlcohol
        self.isEatMeat = isEatMeat
        self.price = price
    }
}

public struct Outcome: Hashable, Codable {
    var id: Int
    var name: String
    public var price: Int
    var isAlcohol: Bool
    var isMeat: Bool
    var payerID: Int?

    public init(id: Int, name: String, price: Int, isAlcohol: Bool, isMeat: Bool, payerID: Int?) {
        self.id = id
        self.name = name
        self.price = price
        self.isAlcohol = isAlcohol
        self.isMeat = isMeat
        self.payerID = payerID
    }

    func getLabelText(payers: [Payer]) -> String {
        if payerID != nil {
            for payer in payers {
                if payer.id == payerID {
                    let s = payer.lastName
                    if s == "" {
                        return payer.firstName
                    }
                    return payer.lastName + " " + payer.firstName
                }
            }
        }
        if isAlcohol {
            return "Алкоголь"
        }
        if isMeat {
            return "Мясо"
        }
        return ""
    }
}
