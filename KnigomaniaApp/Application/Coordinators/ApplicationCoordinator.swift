//
//  ApplicationCoordinator.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 12.10.2023.
//

import SwiftUI
import UIKit


final class ApplicationCoordinator: Coordinator{
	
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		
		var view = RegistrationOnboardingStep3View()
		view.applicationCoordinator = self
		let viewController = UIHostingController(rootView: view)
		navigationController.pushViewController(viewController, animated: false)
		
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
	
	func backAction(){
		navigationController.popViewController(animated: true)
	}
	
}
