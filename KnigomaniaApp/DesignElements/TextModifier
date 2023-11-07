//
//  TextModifier.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 01.11.2023.
//

import Foundation
import SwiftUI



struct RegularText: ViewModifier {
	
	func body(content: Content) -> some View {
		content
			.font(.system(size: 16))
			.foregroundStyle(CustomColors.darkBrownColor)
	}
	
}

struct SemiboldText: ViewModifier {
	
	func body(content: Content) -> some View {
		content
			.font(.system(size: 18, weight: .semibold))
			.foregroundStyle(CustomColors.darkBrownColor)
	}
	
}

struct BoldText: ViewModifier {
	
	func body(content: Content) -> some View {
		content
			.font(.system(size: 16, weight: .bold))
			.foregroundStyle(CustomColors.darkBrownColor)
	}
}

extension ViewModifier where Self == RegularText {
	static var regularText: RegularText { RegularText() }
}

extension ViewModifier where Self == SemiboldText {
	static var semiboldText: SemiboldText { SemiboldText() }
}

extension ViewModifier where Self == BoldText {
	static var boldText: BoldText { BoldText() }
}

extension View {
	func textStyle<Style: ViewModifier>(_ style: Style) -> some View{
		ModifiedContent(content: self, modifier: style)
	}
}
