//
//  SettingsCoordinator.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 12.11.2023.
//

import Foundation
import SwiftUI

enum SettingsSectionItems: String {
	
	case profileSettings = "Настройки профиля"
	case notifications = "Уведомления"
	case privacyPolicy = "Политика конфидециальности"
	case support = "Служба поддержки"
	case aboutApp = "О приложении"
	
	static let allValues: [SettingsSectionItems] = [.profileSettings, .notifications, .privacyPolicy, .support, .aboutApp]
	
	var view: any SettingsCoordinatorViewProtocol {
		switch self {
		case .profileSettings:
			ProfileSettingsView()
		case .notifications:
			NotificationScreenView()
		case .privacyPolicy:
			ProfileSettingsView()
		case .support:
			SupportScreenView()
		case .aboutApp:
			ProfileSettingsView()
		}
	}
}


final class SettingsCoordinator: Coordinator {
	
	var rootController: UINavigationController
		
	init(
		rootController: UINavigationController
	) {
		self.rootController = rootController
	}
	
	func start() {
		var view = MainSettingsScreen()
		view.settingsCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: false)
	}
	
	func route(
		view: SettingsSectionItems,
		presentType: PresentActionTypes = .push,
		animated: Bool = true
	) {
		var view = view.view
		view.settingsCoordinator = self
		let viewController = UIHostingController(rootView: AnyView(view))
		switch presentType {
		case .present:
			rootController.present(viewController, animated: animated)
		case .push:
			rootController.pushViewController(viewController, animated: animated)
		}
	}
	
	func backAction(
		type: BackActionTypes,
		animated: Bool = true
	) {
		switch type {
		case .dismiss:
			rootController.dismiss(animated: animated)
		case .backAction:
			rootController.popViewController(animated: animated)
		}
	}
	
	func setupMailConfirmationCoordinator() {
		let mailConfirmationCoordinator = MailConfirmationCoordinator(navigationController: rootController)
		mailConfirmationCoordinator.start()
	}
}
