//
//  AddPayerModalView.swift
//  division_after_drinking
//
//  Created by Владимир Федоров on 04.07.2022.
//

import SwiftUI

struct AddPayerModalView: View {
    @State var userFirstName: String = ""
    @State var userLastName: String = ""
    @State var isDrinkAlcohol: Bool = true
    @State var isEatMeat: Bool = true

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Профиль")) {
                    TextField("Фамилия", text: $userFirstName)
                    TextField("Имя", text: $userLastName)
                }
                Section(header: Text("Предпочтения")) {
                    Toggle(isOn: $isDrinkAlcohol) {
                        Text("Пьет алкоголь")
                    }
                    Toggle(isOn: $isEatMeat) {
                        Text("Ест мясо")
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
                    .navigationBarTitle("Новый участник попоя")
        }
    }
}

struct AddPayerModalView_Previews: PreviewProvider {
    static var previews: some View {
        AddPayerModalView()
                .previewLayout(.fixed(width: 500, height: 500))
    }
}
