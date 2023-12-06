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
    
    @ObservedObject private var viewModel = LoginScreenViewModel()
	
	// MARK: Properties
	
	@State private var email: String = ""
	@State private var passwordText: String = ""
    @State private var isEmailValid: Bool = true
	
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
                    Text(TextTitles.LoginScreenView.email.rawValue)
						.font(.system(size: 14))
						.foregroundStyle(CustomColors.darkBrownColor)
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(.horizontal, Sizes.Padding.normal)
					TextField(text: $email) {
                        Text(TextTitles.LoginScreenView.enterEmail.rawValue)
							.foregroundStyle(CustomColors.brownColor)
							.font(.system(size: 14))
					}
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
					.foregroundStyle(CustomColors.darkBrownColor)
					.padding(.horizontal, 12)
					.padding(.vertical, 15)
					.background(RoundedRectangle(cornerRadius: 10).foregroundStyle(Color.white))
					.padding(.horizontal, Sizes.Padding.normal)
                    .onChange(of: email) { newEmail in
                        isEmailValid = viewModel.validateEmail(newEmail)
                    }
                    if !isEmailValid {
                        HStack {
                            Text(TextTitles.RegistrationView.wrongEmail.rawValue)
                                .font(.system(size: 11))
                                .foregroundStyle(Color.red)
                            Spacer()
                        }
                        .padding(.horizontal, Sizes.Padding.normal)
                    }
				}
				.padding(.top, Sizes.Padding.large)
				VStack(spacing: 8) {
                    Text(TextTitles.LoginScreenView.password.rawValue)
						.font(.system(size: 14, weight: .regular))
						.foregroundColor(CustomColors.darkBrownColor)
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(.leading, Sizes.Padding.normal)
                    PasswordTextField(text: $passwordText, title: TextTitles.LoginScreenView.enterPassword.rawValue)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    if !viewModel.validatePassword() {
                        HStack {
                            Text(TextTitles.LoginScreenView.wrongPassword.rawValue)
                                .font(.system(size: 11))
                                .foregroundStyle(Color.red)
                            Spacer()
                        }
                        .padding(.horizontal, Sizes.Padding.normal)
                    }
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
                    Text(TextTitles.LoginScreenView.noAccount.rawValue)
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
            viewModel.endEditing()
        }
	}
}

// MARK: Preview

#Preview {
	LoginScreenView()
}
