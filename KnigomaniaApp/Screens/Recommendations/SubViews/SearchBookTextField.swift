//
//  SearchBookTextField.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 25/10/23.
//

import SwiftUI

struct SearchBookTextField: View {
    @Binding var text: String
    @FocusState private var isFocused: Bool
    
    private (set) var scanAction: () -> ()
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 36)
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(isFocused ? CustomColors.darkBrownColor : Color.clear, lineWidth: 1)
                )
            HStack {
                Image("searchicon")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundColor(isFocused ? CustomColors.darkBrownColor : CustomColors.greyColor)
                    .padding(.leading, 8)
                HStack(spacing: 8) {
                    TextFieldDynamicWidth(title: "Название, автор или ISBN", text: $text)
                        .focused($isFocused)
                        .foregroundColor(CustomColors.greyColor)
                        .font(.system(size: 14))
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
                Button(action: {
                    scanAction()
                }, label: {
                    Image("scanicon")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(isFocused ? CustomColors.darkBrownColor : CustomColors.greyColor)
                        .padding(.trailing, 8)
                })
            }
        }
    }
}

#Preview {
    SearchBookTextField(text: .constant("")) {}
}
