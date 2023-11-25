//
//  NotificationScreenView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 18.11.2023.
//

import SwiftUI

struct NotificationScreenView: SettingsCoordinatorViewProtocol {
	
	// MARK: Dependencies
	
	var settingsCoordinator: SettingsCoordinator?
	
	// MARK: View
	
    var body: some View {
		ZStack {
			CustomColors
				.background
				.ignoresSafeArea()
			VStack {
				NavBar(title: .notification) {
					settingsCoordinator?.backAction(type: .backAction)
				}
				.padding(.top, 32)
				NotificationToggle()
					.padding(.top, 52)
				Spacer()
			}
		}
    }
}

struct NotificationToggle: View {
	
	@State var notificationOn: Bool = true
	
	var body: some View {
		Toggle(isOn: $notificationOn, label: {
			Text("Уведомления")
				.textStyle(.regularText)
		})
		.foregroundStyle(CustomColors.darkBrownColor)
		.padding(.horizontal, 16)
	}
}

#Preview {
    NotificationScreenView()
}
