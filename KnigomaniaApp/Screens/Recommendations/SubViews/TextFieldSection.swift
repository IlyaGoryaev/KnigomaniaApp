//
//  TextFieldSection.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 26/10/23.
//

import SwiftUI

struct TextFieldSection: View {
    @Binding var text: String
    
    private(set) var title: String
    private(set) var star: String
    private(set) var placeholder: String
    
    var body: some View {
        VStack {
            HStack {
                Group {
                    Text(title)
                        .foregroundColor(CustomColors.darkBrownColor)
                        .font(.system(size: 14, weight: .regular)) +
                    Text(star)
                        .foregroundColor(.red)
                        .font(.system(size: 14, weight: .regular))
                }
                Spacer()
            }
            .padding(.horizontal, 16)
            AddBookTextField(text: $text, placeholder: placeholder)
                .padding(.top, 8)
                .padding(.horizontal, 16)
            Spacer()
        }
    }
}
