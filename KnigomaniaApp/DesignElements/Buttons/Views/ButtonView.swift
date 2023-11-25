//
//  ButtonView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 26.09.2023.
//

import SwiftUI

struct ButtonView: View {
	
	enum Titles: String {
		case send = "Отправить"
		case setup = "Настроить"
		case continuation = "Продолжить"
		case save = "Сохранить"
		case entry = "Войти"
		case resetPassword = "Восстановить пароль"
		case setupNotification = "Настроить напоминания"
		case addBook = "Добавить книгу"
		case complete = "Завершить"
		case support = "Сообщить о проблеме"
	}
	
	private(set) var title: Titles
	private(set) var isButtonEnable: Bool
	private(set) var action: () -> ()
	
	
	var body: some View {
		Button(action: {
			action()
			
		}, label: {
			Text(title.rawValue)
				.font(.system(size: 16, weight: .semibold))
				.foregroundStyle(!isButtonEnable ? CustomColors.darkBrownColor : Color.white)
				.frame(maxWidth: .infinity)
				.frame(height: 48)
				.background(!isButtonEnable ? CustomColors.orangeActiveButtonColor : CustomColors.orangeButtonColor)
				.clipShape(RoundedRectangle(cornerRadius: 10))
				.padding(.horizontal, 16)
			
		})
		.disabled(!isButtonEnable)
	}
}

#Preview {
	ButtonView(title: .continuation, isButtonEnable: true) {
		
	}
}
