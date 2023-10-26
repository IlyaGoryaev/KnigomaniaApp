//
//  SettingsCoordinator.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 26.10.2023.
//

import Foundation
import SwiftUI

final class SettingsCoordinator: Coordinator {
	
	var rootController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.rootController = navigationController
	}
	
	func start() {
		var view = SettingsScreenView()
		view.settingsCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: false)
	}
	
}
