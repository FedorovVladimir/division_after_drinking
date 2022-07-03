//
//  OutcomeView.swift
//  division_after_drinking
//
//  Created by Владимир Федоров on 03.07.2022.
//

import SwiftUI

struct OutcomeView: View {
    var outcome: Outcome

    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0.0) {
                Text(outcome.name)
                        .frame(
                                width: geo.size.width * 0.7,
                                alignment: .leading)
                        .padding(.vertical, 5)
                Text(outcome.getLabelText())
                        .frame(
                                width: geo.size.width * 0.3,
                                alignment: .trailing)
                        .padding(.vertical, 5)
            }
        }
    }
}

struct OutcomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OutcomeView(outcome: outcomes[0])
            OutcomeView(outcome: outcomes[1])
            OutcomeView(outcome: outcomes[2])
        }
                .previewLayout(.fixed(width: 300, height: 100))
    }
}
