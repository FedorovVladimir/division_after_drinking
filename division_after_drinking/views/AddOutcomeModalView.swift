//
//  AddPayerModalView.swift
//  division_after_drinking
//
//  Created by Владимир Федоров on 04.07.2022.
//

import SwiftUI

struct AddOutcomeModalView: View {
    @EnvironmentObject var payersModel: PayersModel
    @Environment(\.presentationMode) var presentationMode

    @State var name: String = ""
    @State var price: String = ""
    @State var isAlcohol: Bool = false
    @State var isMeat: Bool = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Профиль")) {
                    TextField("Название", text: $name)
                    TextField("Стоимость", text: $price)
                            .keyboardType(.numberPad)
                }
                Section(header: Text("Особености")) {
                    Toggle(isOn: $isAlcohol) {
                        Text("Алкоголь")
                    }
                    Toggle(isOn: $isMeat) {
                        Text("Мясо")
                    }
                }
                Section {
                    Button(action: {
                        payersModel.data.outcomes.append(
                                Outcome(
                                        id: payersModel.data.outcomes.count + 1,
                                        name: name,
                                        price: (Float64(price) ?? 0) * 100,
                                        isAlcohol: isAlcohol,
                                        isMeat: isMeat
                                )
                        )
                        payersModel.calc()
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Добавить")
                    }
                }
            }
                    .navigationBarTitle("Новая статья расходов")
        }
    }
}

struct AddOutcomeModalView_Previews: PreviewProvider {
    static var previews: some View {
        AddOutcomeModalView()
                .previewLayout(.fixed(width: 500, height: 500))
    }
}
