//
//  ContentView.swift
//  division_after_drinking
//
//  Created by Владимир Федоров on 03.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(spacing: 0) {
            List {
                Section(header: Text("Участники попоя")) {
                    ForEach(payers, id: \.id) { item in
                        Text(item.name)
                    }
                            .listStyle(.sidebar)
                    Button(action: {}) {
                        Text("Добавить")
                    }
                }
            }
            List {
                Section(header: Text("Чек")) {
                    ForEach(outcomes, id: \.id) { item in
                        OutcomeView(outcome: item, payers: payers)
                    }
                            .listStyle(.sidebar)
                    Button(action: {}) {
                        Text("Добавить")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
                .previewInterfaceOrientation(.landscapeLeft)
    }
}
