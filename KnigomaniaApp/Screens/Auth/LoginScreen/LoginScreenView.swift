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
                NavBar(title: .entryTitle) {
					entryCoordinator?.backAction()
				}
				.padding(.top, 20)
				VStack{
					Text("E-mail")
						.font(.system(size: 14))
						.foregroundStyle(CustomColors.darkBrownColor)
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(.horizontal, 16)
					TextField(text: $email) {
						Text("Введите электронную почту")
							.foregroundStyle(CustomColors.brownColor)
							.font(.system(size: 14))
					}
					.foregroundStyle(CustomColors.darkBrownColor)
					.padding(.horizontal, 12)
					.padding(.vertical, 15)
					.background(RoundedRectangle(cornerRadius: 10).foregroundStyle(Color.white))
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
						entryCoordinator?.fromEntryToReg()
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
        .onTapGesture {
            self.endEditing()
        }
	}
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

#Preview {
	LoginScreenView()
}
