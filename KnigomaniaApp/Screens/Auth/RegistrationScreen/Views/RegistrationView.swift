//
//  RegistrationView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 14.10.2023.
//

import SwiftUI

struct RegistrationView: View {
	
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
					entryCoordinator?.backAction()
				}
				.padding(.top, Sizes.Padding.large.rawValue)
				VStack{
					Text(TextTitles.RegistrationView.email.rawValue)
						.font(.system(size: 14))
						.foregroundStyle(CustomColors.darkBrownColor)
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(.horizontal, 16)
					TextField(text: $email) {
						Text(TextTitles.RegistrationView.enterEmail.rawValue)
							.foregroundStyle(CustomColors.brownColor)
							.font(.system(size: 14))
					}
					.foregroundStyle(CustomColors.darkBrownColor)
					.padding(.horizontal, 12)
					.padding(.vertical, 15)
					.background(RoundedRectangle(cornerRadius: 10).foregroundStyle(Color.white))
					.padding(.horizontal, 16)
				}
				.padding(.top, Sizes.Padding.large.rawValue)
				
				VStack{
					Text(TextTitles.RegistrationView.password.rawValue)
						.font(.system(size: 14))
						.foregroundStyle(CustomColors.darkBrownColor)
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(.horizontal, 16)
					PasswordTextField(text: $passwordText, title: TextTitles.RegistrationView.enterPassword.rawValue)
				}
				.padding(.top, Sizes.Padding.normal.rawValue)
				
				VStack{
					Text(TextTitles.RegistrationView.enterPassword.rawValue)
						.font(.system(size: 14))
						.foregroundStyle(CustomColors.darkBrownColor)
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(.horizontal, 16)
					PasswordTextField(text: $confirmPasswordText, title: TextTitles.RegistrationView.enterPassword.rawValue)
				}
				.padding(.top, Sizes.Padding.normal.rawValue)
				ButtonView(title: .continuation, isButtonEnable: true) {
					entryCoordinator?.startRegistrationOnboarding()
				}
				.padding(.top, Sizes.Padding.large.rawValue)
				HStack(spacing: 4){
					Text(TextTitles.RegistrationView.account.rawValue)
						.font(.system(size: 14))
					Button(action: {
						entryCoordinator?.fromRegToEntry()
					}, label: {
						Text(TextTitles.RegistrationView.entry.rawValue)
							.foregroundStyle(CustomColors.darkBrownColor)
							.font(.system(size: 14, weight: .bold))
					})
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
