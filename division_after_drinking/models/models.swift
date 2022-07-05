//
//  models.swift
//  division_after_drinking
//
//  Created by Владимир Федоров on 03.07.2022.
//

import Foundation

struct Payer: Hashable, Codable {
    var id: Int
    var firstName: String
    var lastName: String
    var isDrinkAlcohol: Bool
    var isEatMeat: Bool
}

struct Outcome: Hashable, Codable {
    var id: Int
    var name: String
    var price: Float64
    var isAlcohol: Bool
    var isMeat: Bool
    var payerID: Int?

    func getLabelText(payers: [Payer]) -> String {
        if payerID != nil {
            for payer in payers {
                if payer.id == payerID {
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
