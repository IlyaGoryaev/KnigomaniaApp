//
//  LoginScreenView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 30/9/23.
//

import SwiftUI

struct LoginScreenView: View {
	
	weak var entryCoordinator: EntryCoordinator?
	
    @State private var email: String = ""
	
	@State private var passwordText: String = ""
    
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
                        Text("E-mail")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(CustomColors.darkBrownColor)
                            .padding(.leading, 17)
                        Spacer()
                    }
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(height: 48)
                            .background(.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .inset(by: 0.5)
                                    .stroke(CustomColors.darkBrownColor)
                            )
                        TextField("", text: $email)
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.black)
                            .padding(.leading, 10)
                            .textFieldStyle(PlainTextFieldStyle())
                    }
                    .overlay(
                        HStack {
                            Text("Введите вашу электронную почту")
                                .lineLimit(1)
                                .font(.system(size: 16, weight: .regular))
                                .foregroundColor(CustomColors.beigeColor)
                                .padding(.leading, 14)
                            Spacer()
                        }
                    )
                    .padding(.horizontal, 16)
                }
                .padding(.top, 40)
                VStack(spacing: 8) {
                    HStack {
                        Text("Пароль")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(CustomColors.darkBrownColor)
                            .padding(.leading, 17)
                        Spacer()
                    }
					PasswordTextField(text: $passwordText, title: "Введите пароль")
                }
                .padding(.top, 16)
                // TODO: add password field
                HStack {
                    Button(action: {
						entryCoordinator?.resetPassword()
                    }, label: {
                        Text("Забыли пароль?")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(CustomColors.darkBrownColor)
                    })
                    .padding(.leading, 18)
                    Spacer()
                }
                .padding(.top, 16)
                Button(action: {
					entryCoordinator?.logIn()
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
                .padding(.top, 32)
                HStack(spacing: 3) {
                    Text("Еще нет аккаунта?")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(CustomColors.darkBrownColor)
                    Button(action: {
                        
                    }) {
                        Text("Зарегистрироваться")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(CustomColors.darkBrownColor)
                    }
                }
                .padding(.top, 16)
                Spacer()
            }
        }
    }
}

#Preview {
    LoginScreenView()
}
