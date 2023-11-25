//
//  ActionButtonModifier.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 25.11.2023.
//

import Foundation
import SwiftUI

struct ApproveAction: ViewModifier {
	
	let padding: CGFloat
	
	func body(content: Content) -> some View {
		content
			.font(.system(size: 16, weight: .medium))
			.foregroundStyle(Color.white)
			.padding(.horizontal, padding)
			.frame(height: 36)
			.background(CustomColors.darkBrownColor)
			.clipShape(RoundedRectangle(cornerRadius: 10))
	}
}

struct DistructAction: ViewModifier {
	
	let padding: CGFloat
	
	func body(content: Content) -> some View {
		content
			.font(.system(size: 16, weight: .medium))
			.foregroundStyle(CustomColors.darkBrownColor)
			.padding(.horizontal, padding)
			.frame(height: 36)
			.background(CustomColors.lightBrownColor)
			.clipShape(RoundedRectangle(cornerRadius: 10))
	}
	
}
