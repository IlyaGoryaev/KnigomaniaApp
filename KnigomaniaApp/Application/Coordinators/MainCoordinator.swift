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
	
	var childCoordinators = [Coordinator]()
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		var view = HomeScreenView()
		view.mainScreenCoordinator = self
		let viewController = UIHostingController(rootView: view)
		navigationController.pushViewController(viewController, animated: false)
	}
	
	func setUpTracker() {
		let trackerCoordinator = TrackerCoordinator(navigationController: navigationController)
		trackerCoordinator.start()
		childCoordinators.append(trackerCoordinator)
		// retain cycle
	}
	
	func bookPage(book: BookPageModel){
		let bookPageCoordinator = BookCoordinator(navigationController: navigationController, book: book)
		bookPageCoordinator.start()
		childCoordinators.append(bookPageCoordinator)
		// retain cycle
	}
}
