//
//  AddPayerModalView.swift
//  division_after_drinking
//
//  Created by Владимир Федоров on 04.07.2022.
//

import SwiftUI

let zeroPayer = Payer(id: 0, firstName: "Всех", lastName: "", isDrinkAlcohol: false, isEatMeat: false, price: 0)

struct AddOutcomeModalView: View {
    @EnvironmentObject var payersModel: PayersModel

    @Environment(\.presentationMode) var presentationMode

    @State var name: String = ""
    @State var price: String = ""
    @State var isAlcohol: Bool = false
    @State var isMeat: Bool = false
    @State var payer: Payer = zeroPayer

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
                Section(header: Text("Частный заказ")) {
                    Picker(selection: $payer, label: Text("Это блюдо для")) {
                        Text(zeroPayer.getName()).tag(zeroPayer)
                        ForEach(payersModel.data.payers, id: \.id) { item in
                            Text(item.getName()).tag(item)
                        }
                    }
                }
                Section {
                    Button(action: {
                        if name == "" || price == "" || Int((Float64(price) ?? 0) * 100) == 0 {
                            return
                        }
                        var selectPayerID: Int? = nil
                        if payer.id != 0 {
                            selectPayerID = payer.id
                        }
                        payersModel.data.outcomes.append(
                                Outcome(
                                        id: payersModel.data.outcomes.count + 1,
                                        name: name,
                                        price: Int((Float64(price) ?? 0) * 100),
                                        isAlcohol: isAlcohol,
                                        isMeat: isMeat,
                                        payerID: selectPayerID
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
