//
//  EntryCoordinator.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 13.10.2023.
//

import Foundation
import SwiftUI
import Combine

final class EntryCoordinator: Coordinator{
	
	var navigationController: UINavigationController
	
	weak var isUserAutorise: CurrentValueSubject<Bool, Never>?
	
	var childCoordinators = [Coordinator]()
	
	init(navigationController: UINavigationController, isUserAutorise: CurrentValueSubject<Bool, Never>){
		self.navigationController = navigationController
		self.isUserAutorise = isUserAutorise
	}
	
	func start() {
		var view = StartScreenView()
		view.entryCoordinator = self
		let viewController = UIHostingController(rootView: view)
		navigationController.pushViewController(viewController, animated: false)
	}
	
	func openEntryScreen(){
		var view = LoginScreenView()
		view.entryCoordinator = self
		let viewController = UIHostingController(rootView: view)
		navigationController.pushViewController(viewController, animated: false)
	}
	
	func resetPassword(){
		let resetPasswordCoordinator = ResetPasswordCoordinator(navigationController: navigationController)
		childCoordinators.append(resetPasswordCoordinator)
		resetPasswordCoordinator.start()
	}
	
	func fromRegToEntry(){
		navigationController.popViewController(animated: false)
		var view = LoginScreenView()
		view.entryCoordinator = self
		let viewController = UIHostingController(rootView: view)
		navigationController.pushViewController(viewController, animated: false)
		
	}
	
	func fromEntryToReg(){
		navigationController.popViewController(animated: false)
		var view = RegistrationView()
		view.entryCoordinator = self
		let viewController = UIHostingController(rootView: view)
		navigationController.pushViewController(viewController, animated: false)
	}
	
	func logIn(){
		isUserAutorise?.send(true)
	}
	
	func openRegistrationScreen(){
		var view = RegistrationView()
		view.entryCoordinator = self
		let viewController = UIHostingController(rootView: view)
		navigationController.pushViewController(viewController, animated: true)
	}
	
	func startRegistrationOnboarding(){
		let registrationOnboardingCoordinator = RegistrationOnboardingCoordinator(navigationController: navigationController, isUserAuthorise: isUserAutorise!)
		childCoordinators.append(registrationOnboardingCoordinator)
		registrationOnboardingCoordinator.start()
	}
	
	func backAction(){
		navigationController.popViewController(animated: true)
	}
	
}
