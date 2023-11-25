//
//  TrackerCoordinator.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 12.10.2023.
//

import SwiftUI
import Combine

final class TrackerCoordinator: Coordinator{
	
	var rootController: UINavigationController
	
	weak var isUserAuthorize: CurrentValueSubject<Bool, Never>?
	
	var childCoordinators = [any Coordinator]()
	
	init(navigationController: UINavigationController, isUserAuthorize: CurrentValueSubject<Bool, Never>? = nil) {
		self.rootController = navigationController
		self.isUserAuthorize = isUserAuthorize
	}
	
	func start() {
		var view = SetupTrackerStep1View()
		view.trackerCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: false)
	}
	
	func openStep2(){
		var view = SetupTrackerStep2View()
		view.trackerCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: true)
	}
	
	func openStep3(){
		var view = SetupTrackerStep3View()
		view.trackerCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: true)
	}
	
	func openStep4(){
		var view = SetupTrackerStep4View()
		view.trackerCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: true)
	}
	
	func backAction(){
		rootController.popViewController(animated: true)
	}
	
	func logIn(){
		if let isUserAuthorize = isUserAuthorize {
			isUserAuthorize.send(true)
		} else {
			for _ in 0...3{
				rootController.popViewController(animated: false)
			}
		}
	}
	
	func setUpReminder(){
		let reminderCoordinator = SetUpReminderTrackerCoordinator(navigationController: rootController, isUserAuthorize: isUserAuthorize)
		reminderCoordinator.start()
		childCoordinators.append(reminderCoordinator)
	}
	
}
