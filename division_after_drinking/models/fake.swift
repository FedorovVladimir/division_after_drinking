//
//  fake.swift
//  division_after_drinking
//
//  Created by Владимир Федоров on 03.07.2022.
//

import Foundation

var fakePayers: [Payer] = [
    Payer(id: 1, firstName: "Вован", lastName: "", isDrinkAlcohol: false, isEatMeat: false, price: 10000),
    Payer(id: 2, firstName: "Макс", lastName: "", isDrinkAlcohol: false, isEatMeat: true, price: 1000),
    Payer(id: 3, firstName: "Леха", lastName: "", isDrinkAlcohol: true, isEatMeat: false, price: 5000),
    Payer(id: 4, firstName: "Гоген", lastName: "", isDrinkAlcohol: true, isEatMeat: true, price: 14000),
    Payer(id: 5, firstName: "Катала", lastName: "", isDrinkAlcohol: true, isEatMeat: true, price: 12000),
]

var fakeOutcomes: [Outcome] = [
    Outcome(id: 1, name: "Пиво", price: 10000, isAlcohol: true, isMeat: false, payerID: nil),
    Outcome(id: 2, name: "Чипсы", price: 5000, isAlcohol: false, isMeat: false, payerID: nil),
    Outcome(id: 3, name: "Цезарь", price: 25000, isAlcohol: false, isMeat: false, payerID: 5),
    Outcome(id: 4, name: "Шашлык", price: 50000, isAlcohol: false, isMeat: true, payerID: nil),
    Outcome(id: 5, name: "Компот", price: 12000, isAlcohol: false, isMeat: false, payerID: nil),
    Outcome(id: 6, name: "Кофе", price: 15000, isAlcohol: false, isMeat: false, payerID: 1),
]
