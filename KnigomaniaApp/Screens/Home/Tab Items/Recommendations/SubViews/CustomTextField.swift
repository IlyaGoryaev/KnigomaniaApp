//
//  CustomTextField.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 25/10/23.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    @State private var isEditing = false

    var body: some View {
        ZStack(alignment: .trailing) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 36)
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(isEditing ? CustomColors.darkBrownColor : Color.clear, lineWidth: 1)
                )
            HStack {
                Image("searchicon")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundColor(CustomColors.greyColor)
                    .padding(.leading, 8)
                TextField("Название, автор или ISBN", text: $text)
                    .foregroundColor(CustomColors.greyColor)
                    .font(.system(size: 14))
                    .padding(.leading, 12)
                    .onTapGesture {
                        isEditing = true
                    }
                    .onSubmit {
                        isEditing = false
                    }
                Image("scanicon")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundColor(CustomColors.greyColor)
                    .padding(.trailing, 8)
            }
        }
    }
}

#Preview {
    CustomTextField(text: .constant(""))
}
