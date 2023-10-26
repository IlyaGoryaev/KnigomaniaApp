//
//  MainCoordinatorWithTabBar.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 26.10.2023.
//

import Foundation
import UIKit

final class MainCoordinatorWithTabBar: Coordinator {
	
	var rootController: UITabBarController
	
	var childCoordinators: [any Coordinator] = []
	
	var navcontrollers = [UINavigationController]()
	
	init(tabBarController: UITabBarController) {
		self.rootController = tabBarController
	}
		
	func start() {
		rootController.viewControllers = [
			setupMainCoordinator(),
			setupLibraryCoordinator(),
			setupScanCoordinator(),
			setupSettingsCoordinator()
		]
	}

}
private extension MainCoordinatorWithTabBar {
	
	func setupMainCoordinator() -> UINavigationController {
		let navController = UINavigationController()
		navController.navigationBar.isHidden = true
		let mainCoordinator = MainCoordinator(navigationController: navController)
		childCoordinators.append(mainCoordinator)
		mainCoordinator.start()
		mainCoordinator.rootController.tabBarItem.image = UIImage(named: "homeIcon")
		return mainCoordinator.rootController
	}
	
	func setupLibraryCoordinator() -> UINavigationController {
		let navController = UINavigationController()
		navController.navigationBar.isHidden = true
		let libraryCoordinator = LibraryCoordinator(navigationController: navController)
		childCoordinators.append(libraryCoordinator)
		libraryCoordinator.start()
		libraryCoordinator.rootController.tabBarItem.image = UIImage(named: "libraryIcon")
		return libraryCoordinator.rootController
	}
	
	func setupScanCoordinator() -> UINavigationController {
		let navController = UINavigationController()
		navController.navigationBar.isHidden = true
		let scanCoordinator = ScanCoordinator(navigationController: navController)
		childCoordinators.append(scanCoordinator)
		scanCoordinator.start()
		scanCoordinator.rootController.tabBarItem.image = UIImage(named: "scanIcon")
		return scanCoordinator.rootController
	}
	
	func setupSettingsCoordinator() -> UINavigationController {
		let navController = UINavigationController()
		navController.navigationBar.isHidden = true
		let settingsCoordinator = SettingsCoordinator(navigationController: navController)
		childCoordinators.append(settingsCoordinator)
		settingsCoordinator.start()
		settingsCoordinator.rootController.tabBarItem.image = UIImage(named: "settingsIcon")
		return settingsCoordinator.rootController
	}
	
}
