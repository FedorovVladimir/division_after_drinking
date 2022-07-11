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

    var outcomesSum: Int = 0
    var payersSum: Int = 0

    var seqPayers: Int = 1
    var seqOutcomes: Int = 1
}

class PayersModel: ObservableObject {
    @Published var data: Data = Data()

    func calc() {
        data.payers = division_after_drinking.calc(data.outcomes, data.payers)
        data.payersSum = division_after_drinking.calcAllSumPayers(data.payers)
        data.outcomesSum = division_after_drinking.calcAllSumOutcomes(data.outcomes)
    }
}

struct ContentView: View {
    @StateObject var payersModel = PayersModel()
    @State private var showAddPayerModal: Bool = false
    @State private var showAddOutcomeModal: Bool = false
    @State private var showInfo: Bool = false

    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            NavigationView {
                VStack(spacing: 0) {
                    List {
                        PayerSection(payersModel: payersModel)
                        OutcomeSection(payersModel: payersModel)
                    }
                }
                        .onAppear(perform: onAppearMainView)
                        .navigationBarTitle("Попил после попоя", displayMode: .inline)
                        .navigationBarItems(trailing: Button("Инфо") {
                            showInfo.toggle()
                        }
                                .sheet(isPresented: self.$showInfo) {
                                    InfoView()
                                }
                        )
            }
        } else {
            HStack(spacing: 0) {
                List {
                    PayerSection(payersModel: payersModel)
                }
                List {
                    OutcomeSection(payersModel: payersModel)
                }
            }
                    .onAppear(perform: onAppearMainView)
        }
    }

    func onAppearMainView() {
//        payersModel.data.payers += fakePayers
//        payersModel.data.outcomes += fakeOutcomes
        payersModel.calc()
    }
}

struct PayerSection: View {
    @StateObject var payersModel: PayersModel
    @State private var showAddPayerModal: Bool = false

    var body: some View {
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
                HStack {
                    Text("Добавить")
                    Spacer()
                    Text(String(format: "%.2f", Float64(payersModel.data.payersSum) / 100))
                }
            }
                    .sheet(isPresented: self.$showAddPayerModal) {
                        AddPayerModalView()
                                .environmentObject(payersModel)
                    }
        }
    }
}

struct OutcomeSection: View {
    @StateObject var payersModel: PayersModel
    @State private var showAddOutcomeModal: Bool = false

    var body: some View {
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
                HStack {
                    Text("Добавить")
                    Spacer()
                    Text(String(format: "%.2f", Float64(payersModel.data.outcomesSum) / 100))
                }
            }
                    .sheet(isPresented: self.$showAddOutcomeModal) {
                        AddOutcomeModalView()
                                .environmentObject(payersModel)
                    }
        }
    }
}

struct InfoView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Приложение \"Попил после попоя\"")
                Text("Разработчик 3CRABS")
                Text("Добавьте участников")
                Text("Добавьте чек")
                Text("Пришлите список для оплаты участникам")
                Text("Барнаул 2022")
            }
                    .frame(alignment: .leading)
                    .navigationBarTitle("Информация", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
                .previewDevice("iPhone 8")
                .previewInterfaceOrientation(.portrait)
        ContentView()
                .previewDevice("iPhone 8")
                .previewInterfaceOrientation(.landscapeLeft)
        ContentView()
                .previewDevice("iPad Air (5th generation)")
                .previewInterfaceOrientation(.portrait)
        ContentView()
                .previewDevice("iPad Air (5th generation)")
                .previewInterfaceOrientation(.landscapeLeft)
    }
}
