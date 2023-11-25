//
//  ProfileSettingsView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 12.11.2023.
//

import SwiftUI

struct ProfileSettingsView: SettingsCoordinatorViewProtocol {
	
	// MARK: Dependecies
	
	var settingsCoordinator: SettingsCoordinator?
	@StateObject private var viewModel = ProfileSettingsViewModel()
	
	// MARK: View
	
    var body: some View {
		ZStack {
			CustomColors.background
				.ignoresSafeArea()
			VStack(spacing: 0) {
				ProfileSettingsNavBar {
					settingsCoordinator?.backAction(type: .backAction)
				}
				.padding(.top, Sizes.Padding.normal.rawValue)
				.padding(.bottom, Sizes.Padding.normal.rawValue)
				ScrollView {
					ProfileSettingsRow(title: "Имя", text: $viewModel.person.firstName)
						.padding(.top, 32)
					ProfileSettingsRow(title: "Фамилия", text: $viewModel.person.secondName)
						.padding(.top, 32)
//					ProfileSettingsRow(title: "Пол", text: $viewModel.person.gender)
//						.padding(.top, 32)
					ProfileSettingsRow(title: "Пароль", text: $viewModel.person.password)
						.padding(.top, 32)
					ProfileSettingsRow(title: "E-mail", text: $viewModel.person.email) {
							settingsCoordinator?.setupMailConfirmationCoordinator()
						}
						.padding(.top, 32)
					Button(action: {
						print("Удалить аккаунт")
					}, label: {
						Text("Удалить аккаунт")
							.frame(maxWidth: .infinity, alignment: .leading)
							.foregroundStyle(Color.red)
							.padding(.horizontal, 16)
					})
					.padding(.top, 32)
				}
				
				Spacer()
			}
		}
        .onTapGesture {
            self.endEditing()
        }
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

struct ProfileSettingsRow: View {
	
	let title: String
	
	@Binding var text: String
	
	@State private var textFieldTitle: String = ""
	
	@State private var isEditing: Bool = false
	
	var allowEditing: Bool = true
	
	var action: (() -> ())?
	
	var body: some View {
		VStack(spacing: 0) {
			Text(title)
				.textStyle(.boldText)
				.frame(maxWidth: .infinity, alignment: .leading)
			if isEditing {
				ZStack(alignment: .trailing) {
					TextField(text: $text) {
						Text("Введите электронную почту")
							.foregroundStyle(CustomColors.brownColor)
							.font(.system(size: 14))
					}
					.foregroundStyle(CustomColors.darkBrownColor)
					.padding(.leading, 12)
					.padding(.trailing, 48)
					.padding(.vertical, 15)
					.background(RoundedRectangle(cornerRadius: 10).foregroundStyle(Color.white))
					Button {
						isEditing = false
						if title == "E-mail" {
							action!()
						}
					} label: {
						Image(systemName: "checkmark")
							.foregroundStyle(CustomColors.darkBrownColor)
					}
					.padding(.horizontal, 16)
					
				}
				.padding(.top, 16)
			} else {
				HStack {
					Text(text)
						.textStyle(.regularText)
					Spacer()
					Button {
						isEditing = true
					} label: {
						Image("Icon edit-2")
					}
					.opacity(allowEditing ? 1 : 0)
				}
				.padding(.top, 24)
				Rectangle()
					.textStyle(.regularText)
					.frame(height: 0.5)
					.padding(.top, 8)
			}
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
