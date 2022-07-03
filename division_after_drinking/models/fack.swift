//
//  fack.swift
//  division_after_drinking
//
//  Created by Владимир Федоров on 03.07.2022.
//

import Foundation

var payers: [Payer] = [
    Payer(id: 1, name: "Вован"),
    Payer(id: 2, name: "Макс"),
    Payer(id: 3, name: "Леха"),
    Payer(id: 4, name: "Гоген"),
    Payer(id: 5, name: "Катала"),
]

var outcomes: [Outcome] = [
    Outcome(id: 1, name: "Пиво", isAlcohol: true, isMeat: false, payerID: nil),
    Outcome(id: 2, name: "Чипсы", isAlcohol: false, isMeat: false, payerID: nil),
    Outcome(id: 3, name: "Цезарь", isAlcohol: false, isMeat: false, payerID: 5),
    Outcome(id: 4, name: "Шашлык", isAlcohol: false, isMeat: true, payerID: nil),
    Outcome(id: 5, name: "Компот", isAlcohol: false, isMeat: false, payerID: nil),
    Outcome(id: 6, name: "Кофе", isAlcohol: false, isMeat: false, payerID: 1),
]
