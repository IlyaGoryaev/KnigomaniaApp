//
//  TrackerCoordinator.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 12.10.2023.
//

import SwiftUI
import Combine

final class TrackerCoordinator: Coordinator{
	
	var navigationController: UINavigationController
	
	weak var isUserAuthorise: CurrentValueSubject<Bool, Never>?
	
	init(navigationController: UINavigationController, isUserAuthorise: CurrentValueSubject<Bool, Never>) {
		self.navigationController = navigationController
		self.isUserAuthorise = isUserAuthorise
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
	
	func logIn(){
		isUserAuthorise?.send(true)
	}
	
}
