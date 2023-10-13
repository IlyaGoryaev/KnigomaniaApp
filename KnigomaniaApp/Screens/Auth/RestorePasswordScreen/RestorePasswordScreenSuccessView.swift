//
//  RestorePasswordScreenSuccessView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 2/10/23.
//

import SwiftUI

struct RestorePasswordScreenSuccessView: View {
    var body: some View {
        ZStack {
            CustomColors.background
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Войти")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(CustomColors.darkBrownColor)
                    .padding(.top, 32)
                Text("Вы успешно сменили\n пароль.")
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(CustomColors.darkBrownColor)
                    .padding(.top, 32)
                Text("Для продолжения работы вам необходимо авторизироваться.")
                    .font(.system(size: 16, weight: .regular))
                    .multilineTextAlignment(.center)
                    .foregroundColor(CustomColors.darkBrownColor)
                    .padding(.top, 24)
                Button(action: {
                    
                }) {
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(CustomColors.yellowColor)
                        .cornerRadius(10)
                        .overlay(
                            Text("Войти")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                        )
                }
                .padding(.horizontal, 16)
                .padding(.top, 22)
                Spacer()
            }
        }
    }
}

#Preview {
    RestorePasswordScreenSuccessView()
}
