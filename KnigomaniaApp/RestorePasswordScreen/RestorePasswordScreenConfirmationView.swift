//
//  RestorePasswordScreenConfirmationView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 2/10/23.
//

import SwiftUI

struct RestorePasswordScreenConfirmationView: View {
    var body: some View {
        ZStack {
            CustomColors.background
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Войти")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(CustomColors.darkBrownColor)
                    .padding(.top, 32)
                VStack(spacing: 8) {
                    HStack {
                        Text("Новый пароль")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(CustomColors.darkBrownColor)
                            .padding(.leading, 17)
                        Spacer()
                    }
                }
                .padding(.top, 32)
                VStack(spacing: 8) {
                    HStack {
                        Text("Повторите пароль")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(CustomColors.darkBrownColor)
                            .padding(.leading, 17)
                        Spacer()
                    }
                }
                .padding(.top, 16)
                // TODO: add password fields
                Button(action: {
                    
                }) {
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(CustomColors.yellowColor)
                        .cornerRadius(10)
                        .overlay(
                            Text("Сохранить")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        )
                }
                .padding(.horizontal, 16)
                .padding(.top, 32)
                Spacer()
            }
        }
    }
}

#Preview {
    RestorePasswordScreenConfirmationView()
}
