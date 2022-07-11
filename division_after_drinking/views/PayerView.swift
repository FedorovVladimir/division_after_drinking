//
//  OutcomeView.swift
//  division_after_drinking
//
//  Created by Владимир Федоров on 03.07.2022.
//

import SwiftUI

struct PayerView: View {
    var payer: Payer

    var body: some View {
        HStack(spacing: 10.0) {
            Text(payer.getName())
                    .padding(.vertical, 5)
            Spacer()
            if (!payer.isDrinkAlcohol) {
                Text("Не пьет")
                        .foregroundColor(Color.init("90000000"))
                        .padding(.vertical, 2)
                        .padding(.horizontal, 10)
                        .background(.green)
                        .clipShape(Capsule())
            }
            if (!payer.isEatMeat) {
                Text("Не ест мясо")
                        .foregroundColor(Color.init("90000000"))
                        .padding(.vertical, 2)
                        .padding(.horizontal, 10)
                        .background(.green)
                        .clipShape(Capsule())
            }
            Text(String(format: "%.2f", Float64(payer.price) / 100))
                    .frame(
                            width: 70,
                            alignment: .trailing)
        }
    }
}

struct PayerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PayerView(payer: fakePayers[0])
            PayerView(payer: fakePayers[1])
            PayerView(payer: fakePayers[2])
        }
                .previewLayout(.fixed(width: 400, height: 70))
    }
}
