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
    @State var price: String = "0"
    @State var isAlcohol: Bool = false
    @State var isMeat: Bool = false

    @State var nameValid = FieldChecker()
    @State var priceValid = FieldChecker()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Профиль")) {
                    TextFieldWithValidator(title: "Название", value: $name, checker: $nameValid) { v in
                        if (v.isEmpty) {
                            return "Название не может быть пустым"
                        }
                        return nil
                    }
                    TextFieldWithValidator(title: "Стоимость", value: $price, checker: $priceValid) { v in
                        if (v.isEmpty || Int((Float64(price) ?? 0) * 100) == 0) {
                            return "Стоимость в рублях и не может быть 0"
                        }
                        return nil
                    }
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
                        if name == "" || price == "" || Int((Float64(price) ?? 0) * 100) == 0 {
                            return
                        }
                        payersModel.data.outcomes.append(
                                Outcome(
                                        id: payersModel.data.outcomes.count + 1,
                                        name: name,
                                        price: Int((Float64(price) ?? 0) * 100),
                                        isAlcohol: isAlcohol,
                                        isMeat: isMeat,
                                        payerID: nil
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
