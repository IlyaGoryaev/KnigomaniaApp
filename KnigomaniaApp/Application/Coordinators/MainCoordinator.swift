//
//  MainCoordinator.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 13.10.2023.
//

import Foundation
import SwiftUI

final class MainCoordinator: Coordinator{
	
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		var view = MainScreen()
		view.mainScreenCoordinator = self
		let viewController = UIHostingController(rootView: view)
		navigationController.pushViewController(viewController, animated: false)
	}
}
