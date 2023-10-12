//
//  ButtonView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 26.09.2023.
//

import SwiftUI

struct ButtonView: View {
	
	private(set) var title: String
	private(set) var isButtonEnable: Bool
	private(set) var action: () -> ()
	
	
	var body: some View {
		Button(action: {
			action()
			
		}, label: {
			Text(title)
				.font(.system(size: 16, weight: .semibold))
				.foregroundStyle(!isButtonEnable ? CustomColors.darkBrownColor : Color.white)
				.frame(maxWidth: .infinity)
				.frame(height: 48)
				.background(!isButtonEnable ? CustomColors.orangeButtonColor : CustomColors.orangeActiveButtonColor)
				.clipShape(RoundedRectangle(cornerRadius: 10))
				.padding(.horizontal, 16)
			
		})
		.disabled(!isButtonEnable)
	}
}

#Preview {
	ButtonView(title: "Продолжить", isButtonEnable: true) {
		
	}
}
