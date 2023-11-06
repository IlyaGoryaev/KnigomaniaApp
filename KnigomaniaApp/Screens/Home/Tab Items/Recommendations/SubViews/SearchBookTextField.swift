//
//  SearchBookTextField.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 25/10/23.
//

import SwiftUI

struct SearchBookTextField: View {
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        ZStack {
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
                    .foregroundColor(isEditing ? CustomColors.darkBrownColor : CustomColors.greyColor)
                    .padding(.leading, 8)
                HStack(spacing: 8) {
                    TextFieldDynamicWidth(title: "Название, автор или ISBN", text: $text)
                        .foregroundColor(CustomColors.greyColor)
                        .font(.system(size: 14))
                        .onTapGesture {
                            isEditing = true
                        }
                        .onSubmit {
                            isEditing = false
                        }
                    if !text.isEmpty {
                        Button(action: {
                            text = ""
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .frame(width: 23, height: 23)
                                    .cornerRadius(50)
                                    .foregroundStyle(CustomColors.background)
                                Image("closeicon")
                                    .foregroundStyle(CustomColors.darkBrownColor)
                            }
                        })
                    }
                    Spacer()
                }
                .padding(.leading, 8)
                Image("scanicon")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundColor(isEditing ? CustomColors.darkBrownColor : CustomColors.greyColor)
                    .padding(.trailing, 8)
            }
        }
    }
}

#Preview {
    SearchBookTextField(text: .constant(""))
}
