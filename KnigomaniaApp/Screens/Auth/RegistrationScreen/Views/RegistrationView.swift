//
//  RegistrationView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 14.10.2023.
//

import SwiftUI

struct RegistrationView: EntryViewProtocol {
    
    // MARK: Dependencies
    
    weak var entryCoordinator: EntryCoordinator?
    
    @ObservedObject private var viewModel = RegistrationViewModel()
    
    // MARK: State properties
    
    @State private var isEmailValid: Bool = true
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
            VStack(spacing: Sizes.Padding.zero.rawValue){
                NavBar(title: .registrationTitle) {
                    entryCoordinator?.backAction(type: .backAction)
                }
                .padding(.top, Sizes.Padding.large.rawValue)
                VStack{
                    Text(TextTitles.RegistrationView.email.rawValue)
                        .font(.system(size: 14))
                        .foregroundStyle(CustomColors.darkBrownColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, Sizes.Padding.normal.rawValue)
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
                    .padding(.vertical, Sizes.Padding.normal.rawValue)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(isEmailTextFieldFocused ? (isEmailValid ? CustomColors.darkBrownColor : Color.red) : Color.clear, lineWidth: 1)
                            )
                    )
                    .padding(.horizontal, Sizes.Padding.normal.rawValue)
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
                        .padding(.horizontal, Sizes.Padding.normal.rawValue)
                    }
                }
                .padding(.top, Sizes.Padding.large.rawValue)
                
                VStack{
                    Text(TextTitles.RegistrationView.password.rawValue)
                        .font(.system(size: 14))
                        .foregroundStyle(CustomColors.darkBrownColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, Sizes.Padding.normal.rawValue)
                    PasswordTextField(text: $passwordText, title: TextTitles.RegistrationView.enterPassword.rawValue)
                        .focused($isPasswordTextFieldFocused)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(isPasswordTextFieldFocused ? CustomColors.darkBrownColor : Color.clear, lineWidth: 1)
                                .padding(.horizontal, 16)
                        )
                }
                .padding(.top, Sizes.Padding.normal.rawValue)
                
                VStack{
                    Text(TextTitles.RegistrationView.repeatPassword.rawValue)
                        .font(.system(size: 14))
                        .foregroundStyle(CustomColors.darkBrownColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, Sizes.Padding.normal.rawValue)
                    PasswordTextField(text: $confirmPasswordText, title: TextTitles.RegistrationView.repeatPassword.rawValue)
                        .focused($isSecondPasswordTextFieldFocused)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(isSecondPasswordTextFieldFocused ? CustomColors.darkBrownColor : Color.clear, lineWidth: 1)
                                .padding(.horizontal, 16)
                        )
                    if !matchPasswords() {
                        HStack {
                            Text(TextTitles.RegistrationView.differentPasswords.rawValue)
                                .font(.system(size: 11))
                                .foregroundStyle(Color.red)
                            Spacer()
                        }
                        .padding(.horizontal, Sizes.Padding.normal.rawValue)
                    }
                }
                .padding(.top, Sizes.Padding.normal.rawValue)
                
                ButtonView(title: .continuation, isButtonEnable: true) {
                    //					entryCoordinator?.startMailConfirmationCoordinator()
                    entryCoordinator?.showError()
                }
                .padding(.top, Sizes.Padding.large.rawValue)
                HStack(spacing: 4){
                    Text(TextTitles.RegistrationView.account.rawValue)
                        .font(.system(size: 14))
                    HelpButton(title: .entry) {
                        entryCoordinator?.backAction(type: .backAction, animated: false)
                        entryCoordinator?.route(view: .loginScreen, animated: false)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, Sizes.Padding.normal.rawValue)
                Spacer()
            }
        }
        .onTapGesture {
            viewModel.endEditing()
        }
    }
    
    // MARK: Actions
    
    private func matchPasswords() -> Bool {
        let password = passwordText
        let confirmPassword = confirmPasswordText
        
        if isSecondPasswordTextFieldFocused {
            guard password == confirmPassword else {
                return false
            }
        }
        return true
    }
}

// MARK: Preview

#Preview {
    RegistrationView()
}
