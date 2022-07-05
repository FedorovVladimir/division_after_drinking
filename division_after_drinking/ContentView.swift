//
//  ContentView.swift
//  division_after_drinking
//
//  Created by Владимир Федоров on 03.07.2022.
//

import SwiftUI

class PayersModel: ObservableObject {
    @Published var payers: [Payer] = []
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
                        Text(item.name)
                    }
                            .listStyle(.sidebar)
                    Button(action: {
                        self.showAddPayerModal = true
                    }) {
                        Text("Добавить")
                    }
                            .sheet(isPresented: self.$showAddPayerModal) {
                                AddPayerModalView()
//                                payersModel.payers.append(Payer(id: 1, name: "Вован"))
                            }
                }
            }
            List {
                Section(header: Text("Чек")) {
                    ForEach(outcomes, id: \.id) { item in
                        OutcomeView(outcome: item, payers: payers)
                    }
                            .listStyle(.sidebar)
                    Button(action: {
                        self.showAddOutcomeModal = true
                    }) {
                        Text("Добавить")
                    }
                            .sheet(isPresented: self.$showAddOutcomeModal) {
                                AddOutcomeModalView()
//                                payersModel.payers.append(Payer(id: 1, name: "Вован"))
                            }
                }
            }
        }
                .onAppear {
                    payersModel.payers += payers
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
                .previewInterfaceOrientation(.landscapeLeft)
    }
}
