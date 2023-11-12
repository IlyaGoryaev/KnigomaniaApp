//
//  ApplicationCoordinator.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 12.10.2023.
//

import SwiftUI
import UIKit
import Combine

final class RegistrationOnboardingCoordinator: Coordinator{
	
	var rootController: UINavigationController
	
	weak var isUserAuthorise: CurrentValueSubject<Bool, Never>?
	
	var childCoordinators = [any Coordinator]()
	
	init(navigationController: UINavigationController, isUserAuthorise: CurrentValueSubject<Bool, Never>? = nil) {
		self.rootController = navigationController
		self.isUserAuthorise = isUserAuthorise
	}
	
	func start() {
		
		var view = RegistrationOnBoardingStep2View()
		view.applicationCoordinator = self
		let viewController = UIHostingController(rootView: view)
		self.rootController.pushViewController(viewController, animated: false)
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 3){
			var view = RegistrationOnboardingStep3View()
			view.applicationCoordinator = self
			let viewController = UIHostingController(rootView: view)
			self.rootController.pushViewController(viewController, animated: false)
		}
		
	}
	
	func openStep3(){
		
		var view = RegistrationOnboardingStep3View()
		view.applicationCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: true)
		
	}
	
	func openStep4(){
		
		var view = RegistrationOnboardingStep4View()
		view.applicationCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: true)
	}
	
	func openStep5(){
		
		var view = RegistrationStep5View()
		view.applicationCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: true)
		
	}
	
	func openStep6(){
		var view = RegistrationOnboardingStep6View()
		view.applicationCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: true)
	}
	
	func setUpTracker(){
		let trackerCoordinator = TrackerCoordinator(navigationController: rootController, isUserAuthorise: isUserAuthorise!)
		trackerCoordinator.start()
		childCoordinators.append(trackerCoordinator)
	}
	
	func logIn(){
		if let isUserAuthorise = isUserAuthorise {
			isUserAuthorise.send(true)
		} else {
			rootController.popToRootViewController(animated: false)
		}
		
	}
	
	func backAction(){
		rootController.popViewController(animated: true)
	}
	
}
