//
//  division_after_drinkingTests.swift
//  division_after_drinkingTests
//
//  Created by Владимир Федоров on 10.07.2022.
//

import XCTest
import division_after_drinking

class division_after_drinkingTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmptyOutcomeList() throws {
        let outcomes: [Outcome] = []
        let allSum = calcAllSumOutcomes(outcomes)
        XCTAssertEqual(allSum, 0)
    }

    func testOutcomeListWithOneItem() throws {
        let outcomes: [Outcome] = [
            Outcome(id: 1, name: "Пиво", price: 10000, isAlcohol: false, isMeat: false, payerID: nil),
        ]
        let allSum = calcAllSumOutcomes(outcomes)
        XCTAssertEqual(allSum, 10000)
    }

    func testEmptyPayerList() throws {
        let payers: [Payer] = []
        let allSum = calcAllSumPayers(payers)
        XCTAssertEqual(allSum, 0)
    }

    func testPayerListWithOneItem() throws {
        let payers: [Payer] = [
            Payer(id: 1, firstName: "name 1", lastName: "", isDrinkAlcohol: false, isEatMeat: false, price: 10000),
        ]
        let allSum = calcAllSumPayers(payers)
        XCTAssertEqual(allSum, 10000)
    }
}
