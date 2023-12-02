//
//  HelpButton.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 02.12.2023.
//

import SwiftUI

struct HelpButton: View {
	
	enum Titles: String {
		case missPassword = "Забыли пароль?"
		case registration = "Зарегистрироваться"
		case entry = "Войти"
	}
	
	// MARK: Properties
	
	let title: Titles
	let action: () -> ()
	
	// MARK: Dependencies
	
	// MARK: View
	
    var body: some View {
		Button(action: {
			action()
		}, label: {
			Text(title.rawValue)
				.font(.system(size: 14, weight: .bold))
				.foregroundColor(CustomColors.darkBrownColor)
		})
    }
	
	// MARK: Functions
	
}

// MARK: Preview

#Preview {
	HelpButton(title: .entry) {
		print("Entry")
	}
}
