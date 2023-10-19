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
	
	var navigationController: UINavigationController
	
	weak var isUserAuthorise: CurrentValueSubject<Bool, Never>?
	
	var childCoordinators = [Coordinator]()
	
	init(navigationController: UINavigationController, isUserAuthorise: CurrentValueSubject<Bool, Never>) {
		self.navigationController = navigationController
		self.isUserAuthorise = isUserAuthorise
	}
	
	func start() {
		
		var view = RegistrationOnBoardingStep2View()
		view.applicationCoordinator = self
		let viewController = UIHostingController(rootView: view)
		self.navigationController.pushViewController(viewController, animated: false)
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 3){
			var view = RegistrationOnboardingStep3View()
			view.applicationCoordinator = self
			let viewController = UIHostingController(rootView: view)
			self.navigationController.pushViewController(viewController, animated: false)
		}
		
	}
	
	func openStep3(){
		
		var view = RegistrationOnboardingStep3View()
		view.applicationCoordinator = self
		let viewController = UIHostingController(rootView: view)
		navigationController.pushViewController(viewController, animated: true)
		
	}
	
	func openStep4(){
		
		var view = RegistrationOnboardingStep4View()
		view.applicationCoordinator = self
		let viewController = UIHostingController(rootView: view)
		navigationController.pushViewController(viewController, animated: true)
	}
	
	func openStep5(){
		
		var view = RegistrationStep5View()
		view.applicationCoordinator = self
		let viewController = UIHostingController(rootView: view)
		navigationController.pushViewController(viewController, animated: true)
		
	}
	
	func openStep6(){
		var view = RegistrationOnboardingStep6View()
		view.applicationCoordinator = self
		let viewController = UIHostingController(rootView: view)
		navigationController.pushViewController(viewController, animated: true)
	}
	
	func setUpTracker(){
		let trackerCoordinator = TrackerCoordinator(navigationController: navigationController, isUserAuthorise: isUserAuthorise!)
		trackerCoordinator.start()
		childCoordinators.append(trackerCoordinator)
	}
	
	func logIn(){
		isUserAuthorise?.send(true)
	}
	
	func backAction(){
		navigationController.popViewController(animated: true)
	}
	
}
