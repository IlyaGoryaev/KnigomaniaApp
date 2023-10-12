//
//  TrackerCoordinator.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 12.10.2023.
//

import SwiftUI

final class TrackerCoordinator: Coordinator{
	
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		var view = SetupTrackerStep1View()
		view.trackerCoordinator = self
		let viewController = UIHostingController(rootView: view)
		navigationController.pushViewController(viewController, animated: false)
	}
	
	func openStep2(){
		var view = SetupTrackerStep2View()
		view.trackerCoordinator = self
		let viewController = UIHostingController(rootView: view)
		navigationController.pushViewController(viewController, animated: true)
	}
	
	func openStep3(){
		var view = SetupTrackerStep3View()
		view.trackerCoordinator = self
		let viewController = UIHostingController(rootView: view)
		navigationController.pushViewController(viewController, animated: true)
	}
	
	func openStep4(){
		var view = SetupTrackerStep4View()
		view.trackerCoordinator = self
		let viewController = UIHostingController(rootView: view)
		navigationController.pushViewController(viewController, animated: true)
	}
	
	func backAction(){
		navigationController.popViewController(animated: true)
	}
	
}
