//
//  RestorePasswordStartScreenView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 30/9/23.
//

import SwiftUI

struct RestorePasswordStartScreenView: View {
	
	// MARK: Dependencies
	weak var resetPasswordCoordinator: ResetPasswordCoordinator?
	@StateObject private var viewModel = RestoreSrceenEnterEmailViewModel()
	
	// MARK: Properties
	@State private var email: String = ""
	@State private var isEmailValid: DataState = .initState
	@FocusState private var emailTextField: Bool
	
	// MARK: View
	var body: some View {
		ZStack {
			CustomColors.background
				.edgesIgnoringSafeArea(.all)
			VStack {
                NavBar(title: .entryTitle, action: {
					resetPasswordCoordinator?.backAction()
				})
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
					.focused($emailTextField)
					.autocorrectionDisabled()
					.textInputAutocapitalization(.never)
					.foregroundStyle(CustomColors.darkBrownColor)
					.padding(.horizontal, 12)
					.padding(.vertical, 15)
					.background(RoundedRectangle(cornerRadius: 10)
						.foregroundStyle(Color.white)
						.overlay(
							RoundedRectangle(cornerRadius: 10)
								.stroke(emailTextField ? (isEmailValid != DataState.errorState ? CustomColors.darkBrownColor : Color.red) : Color.clear, lineWidth: 1)
						))
					.padding(.horizontal, 16)
					.onChange(of: email) { newValue in
						isEmailValid = viewModel.validateEmail(newValue)
					}
				}
				.padding(.top, 40)
				ButtonView(title: .resetPassword, isButtonEnable: true) {
					resetPasswordCoordinator?.resetPasswordByEmail()
				}
				.padding(.top, 32)
				Spacer()
			}
		}
        .onTapGesture {
            self.endEditing()
        }
	}
    
	// MARK: Functions
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

// MARK: Preview
#Preview {
	RestorePasswordStartScreenView()
}
