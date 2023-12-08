//
//  RegistrationView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 14.10.2023.
//

import SwiftUI

enum DataState {
	case initState
	case errorState
	case successState
}

struct RegistrationView: EntryViewProtocol {
    
    // MARK: Dependencies
    
    weak var entryCoordinator: EntryCoordinator?
    
    @StateObject private var viewModel = RegistrationViewModel()
    
    // MARK: State properties
    
	@State private var isEmailValid: DataState = .initState
    @State private var email: String = ""
    @State private var passwordText: String = ""
    @State private var confirmPasswordText: String = ""
    
    @FocusState private var isEmailTextFieldFocused: Bool
    @FocusState private var isPasswordTextFieldFocused: Bool
    @FocusState private var isSecondPasswordTextFieldFocused: Bool
    
    // MARK: View
    
    var body: some View {
        ZStack{
            CustomColors.background
                .ignoresSafeArea()
            VStack(spacing: Sizes.Padding.zero){
                NavBar(title: .registrationTitle) {
                    entryCoordinator?.backAction(type: .backAction)
                }
                .padding(.top, Sizes.Padding.large)
                VStack{
                    Text(TextTitles.RegistrationView.email.rawValue)
                        .font(.system(size: 14))
                        .foregroundStyle(CustomColors.darkBrownColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, Sizes.Padding.normal)
                    TextField(text: $email) {
                        Text(TextTitles.RegistrationView.enterEmail.rawValue)
                            .foregroundStyle(CustomColors.brownColor)
                            .font(.system(size: 14))
                    }
                    .focused($isEmailTextFieldFocused)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .foregroundStyle(CustomColors.darkBrownColor)
                    .padding(.horizontal, 12)
                    .padding(.vertical, Sizes.Padding.normal)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
									.stroke(isEmailTextFieldFocused ? (isEmailValid != DataState.errorState ? CustomColors.darkBrownColor : Color.red) : Color.clear, lineWidth: 1)
                            )
                    )
                    .padding(.horizontal, Sizes.Padding.normal)
                    .onChange(of: email) { newEmail in
                        isEmailValid = viewModel.validateEmail(newEmail)
                    }
					if isEmailValid == DataState.errorState {
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
                
                VStack{
                    Text(TextTitles.RegistrationView.password.rawValue)
                        .font(.system(size: 14))
                        .foregroundStyle(CustomColors.darkBrownColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, Sizes.Padding.normal)
                    PasswordTextField(text: $passwordText, title: TextTitles.RegistrationView.enterPassword.rawValue)
                        .focused($isPasswordTextFieldFocused)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(isPasswordTextFieldFocused ? CustomColors.darkBrownColor : Color.clear, lineWidth: 1)
                                .padding(.horizontal, 16)
                        )
                }
                .padding(.top, Sizes.Padding.normal)
                
                VStack{
                    Text(TextTitles.RegistrationView.repeatPassword.rawValue)
                        .font(.system(size: 14))
                        .foregroundStyle(CustomColors.darkBrownColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, Sizes.Padding.normal)
                    PasswordTextField(text: $confirmPasswordText, title: TextTitles.RegistrationView.repeatPassword.rawValue)
                        .focused($isSecondPasswordTextFieldFocused)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(isSecondPasswordTextFieldFocused ? CustomColors.darkBrownColor : Color.clear, lineWidth: 1)
                                .padding(.horizontal, 16)
                        )
					if matchPasswords() == .errorState {
                        HStack {
                            Text(TextTitles.RegistrationView.differentPasswords.rawValue)
                                .font(.system(size: 11))
                                .foregroundStyle(Color.red)
                            Spacer()
                        }
                        .padding(.horizontal, Sizes.Padding.normal)
                    }
                }
                .padding(.top, Sizes.Padding.normal)
                
                ButtonView(title: .continuation, isButtonEnable: true) {
					if matchPasswords() == .successState && isEmailValid == .successState {
						Task {
							
							do {
								try await viewModel.signUp(user: User(email: email, password: passwordText))
								entryCoordinator?.startMailConfirmationCoordinator()
							} catch(let error) {
								entryCoordinator?.showError(errorDescription: error.localizedDescription)
								print(error.localizedDescription)
							}
							
							
						}
						//entryCoordinator?.startMailConfirmationCoordinator()
					} else {
						entryCoordinator?.showError(errorDescription: "")
					}
                }
                .padding(.top, Sizes.Padding.large)
                HStack(spacing: 4){
                    Text(TextTitles.RegistrationView.account.rawValue)
                        .font(.system(size: 14))
                    HelpButton(title: .entry) {
                        entryCoordinator?.backAction(type: .backAction, animated: false)
                        entryCoordinator?.route(view: .loginScreen, animated: false)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, Sizes.Padding.normal)
                Spacer()
            }
        }
        .onTapGesture {
            viewModel.endEditing()
        }
    }
    
    // MARK: Actions
    
    private func matchPasswords() -> DataState {
        let password = passwordText
        let confirmPassword = confirmPasswordText
		if password == confirmPassword && password == "" {
			return .initState
		}
        if isSecondPasswordTextFieldFocused {
            guard password == confirmPassword else {
				return .errorState
            }
        }
		return .successState
    }
    
    private func showConfirmationAlert() {
        let alertController = UIAlertController(
            title: "",
            message: "Сохранить пароль на устройстве?",
            preferredStyle: .alert
        )
        
        alertController.addAction(UIAlertAction(title: "Сохранить", style: .cancel, handler: { _ in
            viewModel.savePasswordToKeychain()
        }))
        alertController.addAction(UIAlertAction(title: "Пропустить", style: .destructive, handler: { _ in
            
        }))
        
        if let topViewController = entryCoordinator?.rootController.topViewController {
            topViewController.present(alertController, animated: true, completion: nil)
        }
    }
}

// MARK: Preview

#Preview {
    RegistrationView()
}
