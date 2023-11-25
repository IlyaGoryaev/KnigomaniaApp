//
//  SupportScreenView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 18.11.2023.
//

import SwiftUI

struct SupportScreenView: SettingsCoordinatorViewProtocol {
	
	// MARK: Dependencies
	
	var settingsCoordinator: SettingsCoordinator?
	
	// MARK: Properties
	
	@State private var troubleText: String = ""
	@State var text: String = ""
	
	// MARK: View
	
    var body: some View {
		ZStack {
			CustomColors
				.background
				.ignoresSafeArea()
			VStack {
				NavBar(title: .support) {
					settingsCoordinator?.backAction(type: .backAction)
				}
				.padding(.top, 32)
				ProfileSettingsRow(title: "E-mail", text: $text, allowEditing: false)
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
        .onTapGesture {
            self.endEditing()
        }
    }
    
	// MARK: Actions
	
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

#Preview {
	SupportScreenView()
}
