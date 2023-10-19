//
//  PasswordTextField.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 14.10.2023.
//

import SwiftUI

struct PasswordTextField: View {
	
	@State private var isPasswordShown: Bool = false
	
	@Binding var text: String
	
	var title: String
	
	var body: some View {
		HStack{
			if !isPasswordShown{
				SecureField(text: $text){
					Text(title)
						.font(.system(size: 14))
						.foregroundStyle(CustomColors.brownColor)
				}
				.foregroundStyle(CustomColors.darkBrownColor)
			} else {
				TextField(text: $text){
					Text(title)
						.font(.system(size: 14))
						.foregroundStyle(CustomColors.brownColor)
				}
				.foregroundStyle(CustomColors.darkBrownColor)
			}
			Image(!isPasswordShown ? "Icon show password" : "Icon not show password")
				.onTapGesture {
					isPasswordShown.toggle()
				}
		}
		.padding(.horizontal, 12)
		.padding(.vertical, 15)
		.background(RoundedRectangle(cornerRadius: 10)
			.foregroundStyle(Color.white))
		.padding(.horizontal, 15)
	}
}
