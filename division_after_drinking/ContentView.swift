//
//  ContentView.swift
//  division_after_drinking
//
//  Created by Владимир Федоров on 03.07.2022.
//

import SwiftUI

struct Data {
    var payers: [Payer] = []
    var outcomes: [Outcome] = []
}

class PayersModel: ObservableObject {
    @Published var data: Data = Data()

    func calc() {
        data.payers = division_after_drinking.calc(data.outcomes, data.payers)
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
                    ForEach(payersModel.data.payers, id: \.id) { item in
                        PayerView(payer: item)
                                .swipeActions {
                                    Button {
                                        for i in 0..<payersModel.data.payers.count {
                                            if payersModel.data.payers[i].id == item.id {
                                                payersModel.data.payers.remove(at: i)
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
                    ForEach(payersModel.data.outcomes, id: \.id) { item in
                        OutcomeView(outcome: item, payers: payersModel.data.payers)
                                .swipeActions {
                                    Button {
                                        for i in 0..<payersModel.data.outcomes.count {
                                            if payersModel.data.outcomes[i].id == item.id {
                                                payersModel.data.outcomes.remove(at: i)
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
                    payersModel.data.payers += fakePayers
                    payersModel.data.outcomes += fakeOutcomes
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
