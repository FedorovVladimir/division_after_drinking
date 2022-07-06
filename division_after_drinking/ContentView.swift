//
//  ContentView.swift
//  division_after_drinking
//
//  Created by Владимир Федоров on 03.07.2022.
//

import SwiftUI

class PayersModel: ObservableObject {
    @Published var payers: [Payer] = []
    @Published var outcomes: [Outcome] = []

    func calc() {
        var alcoholSum = 0.0
        var meatSum = 0.0
        var otherSum = 0.0
        outcomes.forEach { outcome in
            if outcome.isAlcohol {
                alcoholSum += outcome.price
                return
            }
            if outcome.isMeat {
                meatSum += outcome.price
                return
            }
            otherSum += outcome.price
        }
        var alcoholPayerCount = 0
        var meatPayerCount = 0
        var otherPayerCount = 0
        payers.forEach { payer in
            if payer.isDrinkAlcohol {
                alcoholPayerCount += 1
            }
            if payer.isEatMeat {
                meatPayerCount += 1
            }
            otherPayerCount += 1
        }

//        let oneOtherSum = otherSum / Float64(otherPayerCount)
        payers[0].price = 100
        // TODO
        print("calc")
    }
}

struct ContentView: View {
    @StateObject var payersModel = PayersModel()
    @State private var showAddPayerModal: Bool = false
    @State private var showAddOutcomeModal: Bool = false

    var body: some View {
        HStack(spacing: 0) {
            List {
                Section(header: Text("Участники попоя")) {
                    ForEach(payersModel.payers, id: \.id) { item in
                        PayerView(payer: item)
                                .swipeActions {
                                    Button {
                                        for i in 0..<payersModel.payers.count {
                                            if payersModel.payers[i].id == item.id {
                                                payersModel.payers.remove(at: i)
                                                break
                                            }
                                        }
                                        payersModel.calc()
                                    } label: {
                                        Label("Удалить", systemImage: "trash")
                                    }
                                            .tint(.red)
                                }
                    }
                            .listStyle(.sidebar)
                    Button(action: {
                        self.showAddPayerModal = true
                    }) {
                        Text("Добавить")
                    }
                            .sheet(isPresented: self.$showAddPayerModal) {
                                AddPayerModalView()
                                        .environmentObject(payersModel)
                            }
                }
            }
                    .frame(height: .infinity)
            List {
                Section(header: Text("Чек")) {
                    ForEach(payersModel.outcomes, id: \.id) { item in
                        OutcomeView(outcome: item, payers: payers)
                                .swipeActions {
                                    Button {
                                        for i in 0..<payersModel.outcomes.count {
                                            if payersModel.outcomes[i].id == item.id {
                                                payersModel.outcomes.remove(at: i)
                                                break
                                            }
                                        }
                                        payersModel.calc()
                                    } label: {
                                        Label("Удалить", systemImage: "trash")
                                    }
                                            .tint(.red)
                                }
                    }
                            .listStyle(.sidebar)
                    Button(action: {
                        self.showAddOutcomeModal = true
                    }) {
                        Text("Добавить")
                    }
                            .sheet(isPresented: self.$showAddOutcomeModal) {
                                AddOutcomeModalView()
                                        .environmentObject(payersModel)
                            }
                }
            }
        }
                .onAppear {
                    payersModel.payers += payers
                    payersModel.outcomes += outcomes
                    payersModel.calc()
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
                .previewInterfaceOrientation(.landscapeLeft)
    }
}
