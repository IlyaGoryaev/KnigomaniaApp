//
//  LoginScreenView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 30/9/23.
//

import SwiftUI

struct LoginScreenView: EntryViewProtocol {
	
	// MARK: Dependencies
	
	weak var entryCoordinator: EntryCoordinator?
	
	// MARK: Properties
	
	@State private var email: String = ""
	@State private var passwordText: String = ""
	
	// MARK: View
	
	var body: some View {
		ZStack {
			CustomColors.background
				.edgesIgnoringSafeArea(.all)
			VStack {
                NavBar(title: .entryTitle) {
					entryCoordinator?.backAction(type: .backAction)
				}
				.padding(.top, Sizes.Padding.double)
				VStack{
					Text("E-mail")
						.font(.system(size: 14))
						.foregroundStyle(CustomColors.darkBrownColor)
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(.horizontal, Sizes.Padding.normal)
					TextField(text: $email) {
						Text("Введите электронную почту")
							.foregroundStyle(CustomColors.brownColor)
							.font(.system(size: 14))
					}
					.foregroundStyle(CustomColors.darkBrownColor)
					.padding(.horizontal, 12)
					.padding(.vertical, 15)
					.background(RoundedRectangle(cornerRadius: 10).foregroundStyle(Color.white))
					.padding(.horizontal, Sizes.Padding.normal)
				}
				.padding(.top, Sizes.Padding.large)
				VStack(spacing: 8) {
					Text("Пароль")
						.font(.system(size: 14, weight: .regular))
						.foregroundColor(CustomColors.darkBrownColor)
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(.leading, Sizes.Padding.normal)
					PasswordTextField(text: $passwordText, title: "Введите пароль")
				}
				.padding(.top, Sizes.Padding.normal)
				HelpButton(title: .missPassword) {
					entryCoordinator?.resetPassword()
				}
				.frame(maxWidth: .infinity, alignment: .leading)
				.padding([.top, .horizontal], Sizes.Padding.normal)
				ButtonView(title: .entry, isButtonEnable: true) {
					entryCoordinator?.logIn()
				}
				.padding(.top, Sizes.Padding.double)
				HStack(spacing: 3) {
					Text("Еще нет аккаунта?")
						.font(.system(size: 14, weight: .regular))
						.foregroundColor(CustomColors.darkBrownColor)
					HelpButton(title: .registration) {
						entryCoordinator?.backAction(type: .backAction, animated: false)
						entryCoordinator?.route(view: .regScreen, animated: false)
					}
				}
				.padding(.top, Sizes.Padding.normal)
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

// MARK: Preview

#Preview {
	LoginScreenView()
}
