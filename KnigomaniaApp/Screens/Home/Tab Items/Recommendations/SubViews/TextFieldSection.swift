//
//  TextFieldSection.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 26/10/23.
//

import SwiftUI

struct TextFieldSection: View {
    @State private var searchText = ""
    private(set) var title: String
    private(set) var placeholder: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundColor(CustomColors.darkBrownColor)
                    .font(.system(size: 14, weight: .regular))
                Spacer()
            }
            .padding(.horizontal, 16)
            AddBookTextField(text: $searchText, placeholder: placeholder)
                .padding(.top, 8)
                .padding(.horizontal, 16)
            Spacer()
        }
    }
}

#Preview {
    TextFieldSection(title: "Автор", placeholder: "Укажите автора")
}
