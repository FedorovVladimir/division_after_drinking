//
//  AddPayerModalView.swift
//  division_after_drinking
//
//  Created by Владимир Федоров on 04.07.2022.
//

import SwiftUI

struct AddOutcomeModalView: View {
    @State var name: String = ""
    @State var price: String = "0"
    @State var isAlcohol: Bool = false
    @State var isMeat: Bool = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Профиль")) {
                    TextField("Название", text: $name)
                    TextField("Стоимость", text: $price)
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
                        print("Perform an action here...")
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
