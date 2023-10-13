//
//  HeadlineTextModifier.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 03.10.2023.
//

import SwiftUI

struct HeadlineTextModifier: ViewModifier {
	
	func body(content: Content) -> some View {
		content
			.font(.system(size: 24, weight: .bold))
			.foregroundStyle(CustomColors.brownColor)
			.multilineTextAlignment(.center)
			.frame(maxWidth: .infinity)
	}
}

struct RegularTextModifier: ViewModifier{
	
	func body(content: Content) -> some View {
		content
			.font(.system(size: 16))
			.foregroundStyle(CustomColors.brownColor)
			.multilineTextAlignment(.center)
			.frame(maxWidth: .infinity)
	}
	
}
