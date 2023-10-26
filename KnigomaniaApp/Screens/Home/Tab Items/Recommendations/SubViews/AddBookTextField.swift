//
//  AddBookTextField.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 26/10/23.
//

import SwiftUI

struct AddBookTextField: View {
    @Binding var text: String
    private(set) var placeholder: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 48)
                .background(Color.white)
                .cornerRadius(10)
            HStack {
                TextField(placeholder, text: $text)
                    .foregroundColor(CustomColors.greyColor)
                    .font(.system(size: 14))
                    .padding(.leading, 12)
            }
        }
    }
}

#Preview {
    AddBookTextField(text: .constant(""), placeholder: "Укажите автора")
}
