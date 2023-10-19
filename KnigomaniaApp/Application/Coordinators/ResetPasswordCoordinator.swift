//
//  ResetPasswordCoordinator.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 13.10.2023.
//

import Foundation
import SwiftUI

final class ResetPasswordCoordinator: Coordinator{
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		var view = RestorePasswordStartScreenView()
		view.resetPasswordCoordinator = self
		let viewController = UIHostingController(rootView: view)
		navigationController.pushViewController(viewController, animated: true)
	}
	
	func resetPasswordByEmail(){
		var view = RestorePasswordScreenConfirmationView()
		view.resetPasswordCoordinator = self
		let viewController = UIHostingController(rootView: view)
		navigationController.pushViewController(viewController, animated: true)
	}
	
	func savePassword(){
		var view = RestorePasswordScreenSuccessView()
		view.resetPasswordCoordinator = self
		let viewController = UIHostingController(rootView: view)
		navigationController.pushViewController(viewController, animated: true)
	}
	
	func backToEntryScreen(){
		navigationController.popViewController(animated: false)
		navigationController.popViewController(animated: false)
		navigationController.popViewController(animated: false)
	}
	
}
