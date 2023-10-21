//
//  RestorePasswordStartScreenView.swift
//  KnigomaniaApp
//
//  Created by Arina Postnikova on 30/9/23.
//

import SwiftUI

struct RestorePasswordStartScreenView: View {
	
	weak var resetPasswordCoordinator: ResetPasswordCoordinator?
	
	@State private var email: String = ""
	
	var body: some View {
		ZStack {
			CustomColors.background
				.edgesIgnoringSafeArea(.all)
			VStack {
				NavBar(title: "Войти", action: {
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
					.foregroundStyle(CustomColors.darkBrownColor)
					.padding(.horizontal, 12)
					.padding(.vertical, 15)
					.background(RoundedRectangle(cornerRadius: 10).foregroundStyle(Color.white))
					.padding(.horizontal, 16)
				}
				.padding(.top, 40)
				ButtonView(title: "Восстановить пароль", isButtonEnable: true) {
					resetPasswordCoordinator?.resetPasswordByEmail()
				}
				.padding(.top, 32)
				Spacer()
			}
		}
	}
}

#Preview {
	RestorePasswordStartScreenView()
}
