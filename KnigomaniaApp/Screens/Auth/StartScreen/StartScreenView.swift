//
//  StartScreenView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 28/9/23.
//

import SwiftUI

struct StartScreenView: View {
    var body: some View {
        ZStack {
            CustomColors.background
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("startscreenimage")
                    .padding(.top, 32)
                VStack(spacing: 10) {
                    Text("Добро пожаловать")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(CustomColors.darkBrownColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 17)
                    Text("Отслеживайте свой прогресс по чтению, и соревнуйтесь с друзьями ")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(CustomColors.darkBrownColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 17)
                }
                .padding(.top, 40)
                Spacer(minLength: 32)
                ButtonView(title: "Регистрация", isButtonEnable: true) {
                    
                }
                Spacer()
                VStack(spacing: 24) {
                    HStack(spacing: 4) {
                        Text("Уже есть аккаунт?")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(CustomColors.darkBrownColor)
                        Button(action: {
                            
                        }) {
                            Text("Войти")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(CustomColors.darkBrownColor)
                        }
                    }
                    // TODO: underline links
                    Text("Продолжая, вы соглашаетесь с [правилами использования приложения](https://www.apple.com/) и [политикой конфиденциальности](https://www.apple.com/)")
                        .font(.system(size: 11))
                        .foregroundColor(CustomColors.beigeColor)
                        .accentColor(CustomColors.darkBrownColor)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 17)
                Spacer()
            }
        }
    }
}

#Preview {
    StartScreenView()
}
