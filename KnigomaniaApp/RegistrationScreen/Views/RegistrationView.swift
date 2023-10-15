//
//  RegistrationView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 14.10.2023.
//

import SwiftUI

struct RegistrationView: View {
	
	weak var entryCoordinator: EntryCoordinator?
	
	@State private var email: String = ""
	
	@State private var passwordText: String = ""
	@State private var confirmPasswordText: String = ""
	
    var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			VStack(spacing: 0){
				NavBar(title: "Регистрация") {
					entryCoordinator?.backAction()
				}
				.padding(.top, 32)
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
				
				VStack{
					Text("Пароль")
						.font(.system(size: 14))
						.foregroundStyle(CustomColors.darkBrownColor)
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(.horizontal, 16)
					PasswordTextField(text: $passwordText, title: "Введите пароль")
				}
				.padding(.top, 16)
				
				VStack{
					Text("Повторите пароль")
						.font(.system(size: 14))
						.foregroundStyle(CustomColors.darkBrownColor)
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(.horizontal, 16)
					PasswordTextField(text: $confirmPasswordText, title: "Повторите пароль")
				}
				.padding(.top, 16)
				ButtonView(title: "Продолжить", isButtonEnable: true) {
					entryCoordinator?.startRegistrationOnboarding()
				}
				.padding(.top, 32)
				HStack(spacing: 4){
					Text("Уже есть аккаунт?")
						.font(.system(size: 14))
					Button(action: {
						entryCoordinator?.fromRegToEntry()
					}, label: {
						Text("Войти")
							.foregroundStyle(CustomColors.darkBrownColor)
							.font(.system(size: 14, weight: .bold))
					})
				}
				.frame(maxWidth: .infinity, alignment: .center)
				.padding(.top, 16)
				Spacer()
			}
		}
    }
}

#Preview {
    RegistrationView()
}
