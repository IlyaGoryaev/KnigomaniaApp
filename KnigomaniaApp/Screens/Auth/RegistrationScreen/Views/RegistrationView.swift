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
	
	// MARK: State properties
	
	@State private var email: String = ""
	@State private var passwordText: String = ""
	@State private var confirmPasswordText: String = ""
	
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
					.foregroundStyle(CustomColors.darkBrownColor)
					.padding(.horizontal, 12)
					.padding(.vertical, Sizes.Padding.normal.rawValue)
					.background(RoundedRectangle(cornerRadius: 10).foregroundStyle(Color.white))
					.padding(.horizontal, Sizes.Padding.normal.rawValue)
				}
				.padding(.top, Sizes.Padding.large.rawValue)
				
				VStack{
					Text(TextTitles.RegistrationView.password.rawValue)
						.font(.system(size: 14))
						.foregroundStyle(CustomColors.darkBrownColor)
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(.horizontal, Sizes.Padding.normal.rawValue)
					PasswordTextField(text: $passwordText, title: TextTitles.RegistrationView.enterPassword.rawValue)
				}
				.padding(.top, Sizes.Padding.normal.rawValue)
				
				VStack{
					Text(TextTitles.RegistrationView.enterPassword.rawValue)
						.font(.system(size: 14))
						.foregroundStyle(CustomColors.darkBrownColor)
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(.horizontal, Sizes.Padding.normal.rawValue)
					PasswordTextField(text: $confirmPasswordText, title: TextTitles.RegistrationView.enterPassword.rawValue)
				}
				.padding(.top, Sizes.Padding.normal.rawValue)
				ButtonView(title: .continuation, isButtonEnable: true) {
					entryCoordinator?.startMailConfirmationCoordinator()
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
            self.endEditing()
        }
	}
	
	// MARK: Actions
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

// MARK: Preview

#Preview {
	RegistrationView()
}
