//
//  MainSettingsScreen.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 12.11.2023.
//

import SwiftUI

struct MainSettingsScreen: SettingsCoordinatorViewProtocol {
	
	var settingsCoordinator: SettingsCoordinator?
	
    var body: some View {
		
		ZStack {
			CustomColors.background
				.ignoresSafeArea()
			VStack(spacing: 0) {
				VStack(spacing: 32) {
					ForEach(SettingsSectionItems.allValues, id: \.self) { item in
						SettingsSectionView(title: item.rawValue)
							.onTapGesture {
								settingsCoordinator?.route(view: item)
							}
					}
				}
				.padding(.top, 32)
				SettingsAccountExit()
				.padding(.top, 32)
				Spacer()
			}
		}
    }
}

struct SettingsSectionView: View {
	
	let title: String
	
	var body: some View {
		HStack{
			Text(title)
			Spacer()
			Image(systemName: "chevron.right")
		}
		.textStyle(.regularText)
		.padding(.horizontal, 16)
	}
}

struct SettingsAccountExit: View {
	
	private let userDefaultManager = UserDefaultManager.shared
	
	var body: some View {
		Button(action: {
			userDefaultManager.logout()
			print("Выйти из аккаунта")
		}, label: {
			Text("Выйти из аккаунта")
				.frame(maxWidth: .infinity, alignment: .leading)
				.foregroundStyle(Color.red)
				.padding(.horizontal, 16)
		})
	}
}

#Preview {
    MainSettingsScreen()
}
