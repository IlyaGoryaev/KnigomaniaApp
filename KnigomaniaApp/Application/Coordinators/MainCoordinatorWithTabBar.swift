//
//  MainCoordinatorWithTabBar.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 26.10.2023.
//

import Foundation
import UIKit
import Combine

final class MainCoordinatorWithTabBar: Coordinator {
	
	var rootController: UITabBarController
	
	var childCoordinators: [any Coordinator] = []
	
	weak var isUserAuthorize: CurrentValueSubject<Bool, Never>?
	
	var navcontrollers = [UINavigationController]()
	
	init(
		tabBarController: UITabBarController,
		isUserAuthorize: CurrentValueSubject<Bool, Never>? = nil
	) {
		self.rootController = tabBarController
		self.isUserAuthorize = isUserAuthorize
	}
		
	func start() {
		rootController.viewControllers = [
			setupMainCoordinator(),
			setupLibraryCoordinator(),
			setupScanCoordinator(),
			setupSettingsCoordinator()
		]
		for vc in rootController.viewControllers! {
			vc.tabBarItem.title = nil
			vc.tabBarItem.imageInsets = UIEdgeInsets(top: 20, left: 0, bottom: -20, right: 0)
		}
	}

}
private extension MainCoordinatorWithTabBar {
	
	func setupMainCoordinator() -> UINavigationController {
		let navController = UINavigationController()
		navController.navigationBar.isHidden = true
		let mainCoordinator = MainCoordinator(navigationController: navController)
		childCoordinators.append(mainCoordinator)
		mainCoordinator.start()
		mainCoordinator.rootController.tabBarItem.image = UIImage(named: "homeicon")
		return mainCoordinator.rootController
	}
	
	func setupLibraryCoordinator() -> UINavigationController {
		let navController = UINavigationController()
		navController.navigationBar.isHidden = true
		let recommendationsCoordinator = RecommendationsCoordinator(navigationController: navController)
		childCoordinators.append(recommendationsCoordinator)
        recommendationsCoordinator.start()
        recommendationsCoordinator.rootController.tabBarItem.image = UIImage(named: "libraryicon")
		return recommendationsCoordinator.rootController
	}
	
	func setupScanCoordinator() -> UINavigationController {
		let navController = UINavigationController()
		navController.navigationBar.isHidden = true
		let scanCoordinator = ScanCoordinator(navigationController: navController)
		childCoordinators.append(scanCoordinator)
		scanCoordinator.start()
		scanCoordinator.rootController.tabBarItem.image = UIImage(named: "scanicon")
		return scanCoordinator.rootController
	}
	
	func setupSettingsCoordinator() -> UINavigationController {
		let navController = UINavigationController()
		navController.navigationBar.isHidden = true
		let settingsCoordinator = SettingsCoordinator(rootController: navController, isUserAuthorize: isUserAuthorize)
		childCoordinators.append(settingsCoordinator)
		settingsCoordinator.start()
		settingsCoordinator.rootController.tabBarItem.image = UIImage(named: "settingsicon")
		return settingsCoordinator.rootController
	}
	
}
