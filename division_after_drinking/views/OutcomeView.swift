//
//  OutcomeView.swift
//  division_after_drinking
//
//  Created by Владимир Федоров on 03.07.2022.
//

import SwiftUI

struct OutcomeView: View {
    var outcome: Outcome
    var payers: [Payer]

    var body: some View {
        HStack(spacing: 10.0) {
            Text(outcome.name)
                    .padding(.vertical, 5)
            Spacer()
            let labelText = outcome.getLabelText(payers: payers)
            let labelColor: Color = outcome.payerID != nil ? Color.yellow : Color.green
            if (labelText != "") {
                Text(labelText)
                        .foregroundColor(Color.black)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 10)
                        .background(labelColor)
                        .cornerRadius(15)
            }
            Text(String(format: "%.2f", outcome.price / 100))
                    .frame(
                            width: 70,
                            alignment: .trailing)
        }
    }
}

struct OutcomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OutcomeView(outcome: outcomes[0], payers: payers)
            OutcomeView(outcome: outcomes[1], payers: payers)
            OutcomeView(outcome: outcomes[2], payers: payers)
        }
                .previewLayout(.fixed(width: 300, height: 100))
    }
}
