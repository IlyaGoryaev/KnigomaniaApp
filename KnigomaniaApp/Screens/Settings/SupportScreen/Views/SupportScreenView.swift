//
//  SupportScreenView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 18.11.2023.
//

import SwiftUI

struct SupportScreenView: View {
	
	@State private var troubleText: String = ""
	
    var body: some View {
		ZStack {
			CustomColors
				.background
				.ignoresSafeArea()
			VStack {
				NavBar(title: .support) {
					
				}
				.padding(.top, 32)
				ProfileSettingsRow(title: "E-mail", allowEditing: false)
					.padding(.top, 44)
				ReviewText(text: $troubleText)
					.padding(.top, 32)
				ButtonView(title: .support, isButtonEnable: true) {
					print("Support")
				}
				.padding(.top, 24)
				Spacer()
			}
		}
    }
}

#Preview {
    SupportScreenView()
}
