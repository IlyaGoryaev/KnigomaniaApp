//
//  RestorePasswordScreenConfirmationView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 2/10/23.
//

import SwiftUI

struct RestorePasswordScreenConfirmationView: View {
	
	weak var resetPasswordCoordinator: ResetPasswordCoordinator?
	
	@State private var passwordTextField: String = ""
	@State private var confirmPasswordTextField: String = ""
	
	var body: some View {
		ZStack {
			CustomColors.background
				.edgesIgnoringSafeArea(.all)
			VStack {
                NavBar(title: .entryTitle, action: {
					resetPasswordCoordinator?.backAction()
				})
				.padding(.top, 32)
				VStack(spacing: 8) {
					HStack {
						Text("Новый пароль")
							.font(.system(size: 14, weight: .regular))
							.foregroundColor(CustomColors.darkBrownColor)
							.padding(.leading, 17)
						Spacer()
					}
					PasswordTextField(text: $passwordTextField, title: "Введите пароль")
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
					PasswordTextField(text: $confirmPasswordTextField, title: "Введите пароль")
				}
				.padding(.top, 16)
				// TODO: add password fields
				Button(action: {
					resetPasswordCoordinator?.savePassword()
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
        .onTapGesture {
            self.endEditing()
        }
	}
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

#Preview {
	RestorePasswordScreenConfirmationView()
}
