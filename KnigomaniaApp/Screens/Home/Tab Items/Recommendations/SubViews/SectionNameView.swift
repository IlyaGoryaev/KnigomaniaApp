//
//  SectionNameView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 25/10/23.
//

import SwiftUI

struct SectionNameView: View {
    private(set) var title: String
    private(set) var action: () -> ()
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(CustomColors.darkBrownColor)
                .font(.system(size: 16, weight: .semibold))
            Spacer()
            Button(action: {
                action()
            }, label: {
                HStack(spacing: 4) {
                    Text("Весь раздел")
                        .foregroundColor(CustomColors.darkBrownColor)
                        .font(.system(size: 14))
                    Image("rightactionableicon")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            })
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    SectionNameView(title: "Бестселлеры") {}
}
