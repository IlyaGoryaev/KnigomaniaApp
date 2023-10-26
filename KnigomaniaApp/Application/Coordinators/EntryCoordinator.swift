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
	
	var rootController: UINavigationController
	
	weak var isUserAutorise: CurrentValueSubject<Bool, Never>?
	
	var childCoordinators = [any Coordinator]()
	
	init(navigationController: UINavigationController, isUserAutorise: CurrentValueSubject<Bool, Never>){
		self.rootController = navigationController
		self.isUserAutorise = isUserAutorise
	}
	
	func start() {
		var view = StartScreenView()
		view.entryCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: false)
	}
	
	func openEntryScreen(){
		var view = LoginScreenView()
		view.entryCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: false)
	}
	
	func resetPassword(){
		let resetPasswordCoordinator = ResetPasswordCoordinator(navigationController: rootController)
		childCoordinators.append(resetPasswordCoordinator)
		resetPasswordCoordinator.start()
	}
	
	func fromRegToEntry(){
		rootController.popViewController(animated: false)
		var view = LoginScreenView()
		view.entryCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: false)
		
	}
	
	func fromEntryToReg(){
		rootController.popViewController(animated: false)
		var view = RegistrationView()
		view.entryCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: false)
	}
	
	func logIn(){
		isUserAutorise?.send(true)
	}
	
	func openRegistrationScreen(){
		var view = RegistrationView()
		view.entryCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: true)
	}
	
	func startRegistrationOnboarding(){
		let registrationOnboardingCoordinator = RegistrationOnboardingCoordinator(navigationController: rootController, isUserAuthorise: isUserAutorise!)
		childCoordinators.append(registrationOnboardingCoordinator)
		registrationOnboardingCoordinator.start()
	}
	
	func backAction(){
		rootController.popViewController(animated: true)
	}
	
}
