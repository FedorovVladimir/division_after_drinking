//
//  models.swift
//  division_after_drinking
//
//  Created by Владимир Федоров on 03.07.2022.
//

import Foundation

struct Payer: Hashable, Codable {
    var id: Int
    var name: String
}

struct Outcome: Hashable, Codable {
    var id: Int
    var name: String
    var isAlcohol: Bool
    var isMeat: Bool
    var payerID: Int?

    func getLabelText(payers: [Payer]) -> String {
        if payerID != nil {
            for payer in payers {
                if payer.id == payerID {
                    return payer.name
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
