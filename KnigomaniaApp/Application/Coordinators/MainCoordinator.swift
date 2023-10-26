//
//  MainCoordinator.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 13.10.2023.
//

import Foundation
import SwiftUI

final class MainCoordinator: Coordinator{
	
	var rootController: UINavigationController
	
	var childCoordinators = [any Coordinator]()
	
	init(navigationController: UINavigationController) {
		self.rootController = navigationController
	}
	
	func start() {
		var view = HomeScreenView()
		view.mainScreenCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: false)
	}
	
	func setUpTracker() {
		let trackerCoordinator = TrackerCoordinator(navigationController: rootController)
		trackerCoordinator.start()
		childCoordinators.append(trackerCoordinator)
		// retain cycle
	}
	
	func bookPage(book: BookPageModel){
		let bookPageCoordinator = BookCoordinator(navigationController: rootController, book: book)
		bookPageCoordinator.start()
		childCoordinators.append(bookPageCoordinator)
		// retain cycle
	}
}
