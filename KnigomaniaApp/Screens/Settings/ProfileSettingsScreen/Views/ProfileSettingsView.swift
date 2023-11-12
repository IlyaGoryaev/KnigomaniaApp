//
//  ProfileSettingsView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 12.11.2023.
//

import SwiftUI

struct ProfileSettingsView: SettingsCoordinatorViewProtocol {
	
	var settingsCoordinator: SettingsCoordinator?
	
    var body: some View {
		ZStack {
			CustomColors.background
				.ignoresSafeArea()
			VStack(spacing: 0) {
				ProfileSettingsNavBar {
					settingsCoordinator?.backAction(type: .backAction)
				}
					.padding(.top, 20)
				ProfileSettingsRow(title: "Имя")
					.padding(.top, 32)
				ProfileSettingsRow(title: "Фамилия")
					.padding(.top, 32)
				ProfileSettingsRow(title: "Пароль")
					.padding(.top, 32)
				ProfileSettingsRow(title: "E-mail")
					.padding(.top, 32)
				Spacer()
			}
		}
    }
}

struct ProfileSettingsRow: View {
	
	let title: String
	
	var body: some View {
		VStack(spacing: 0) {
			Text(title)
				.textStyle(.boldText)
				.frame(maxWidth: .infinity, alignment: .leading)
			HStack {
				Text(title)
					.textStyle(.regularText)
				Spacer()
				Button {
					print("Edit")
				} label: {
					Image("Icon edit-2")
				}
			}
			.padding(.top, 16)
			Rectangle()
				.textStyle(.regularText)
				.frame(height: 0.5)
				.padding(.top, 8)
		}
		.padding(.horizontal, 16)
	}
}

struct ProfileSettingsNavBar: View {
	
	let action: () -> ()
	
	var body: some View {
		HStack {
			Button {
				action()
			} label: {
				Image(systemName: "chevron.left")
					.textStyle(.regularText)
			}
			Spacer()
			Button {
				print("changeImage")
			} label: {
				ZStack {
					Circle()
						.frame(width: 68, height: 68)
					Image("pencil")
						.offset(x: 68 / 3, y: 68 / 3)
				}
				.textStyle(.regularText)
			}
		}
		.padding(.horizontal, 16)
	}
}

#Preview {
    ProfileSettingsView()
}
