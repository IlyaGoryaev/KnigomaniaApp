//
//  TextFieldModifier.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 09.11.2023.
//

import Foundation
import SwiftUI

struct TextFieldModifier: ViewModifier {
	
	@Binding var isActive: Bool
	
	func body(content: Content) -> some View {
		content
			.background(RoundedRectangle(cornerRadius: 10)
				.foregroundStyle(.white))
			.overlay {
				RoundedRectangle(cornerRadius: 10)
					.stroke(lineWidth: 1)
					.foregroundStyle(isActive ? CustomColors.darkBrownColor : Color.clear)
			}
			.onTapGesture {
				withAnimation {
					isActive = true
				}
			}
			.onSubmit {
				withAnimation {
					isActive = false
				}
			}
	}
	
}
