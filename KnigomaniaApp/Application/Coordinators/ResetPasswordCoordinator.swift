//
//  ResetPasswordCoordinator.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 13.10.2023.
//

import Foundation
import SwiftUI

final class ResetPasswordCoordinator: Coordinator{
	var rootController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.rootController = navigationController
	}
	
	func start() {
		var view = RestorePasswordStartScreenView()
		view.resetPasswordCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: true)
	}
	
	func resetPasswordByEmail(){
		var view = RestorePasswordScreenConfirmationView()
		view.resetPasswordCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: true)
	}
	
	func savePassword(){
		var view = RestorePasswordScreenSuccessView()
		view.resetPasswordCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: true)
	}
	
	func backToEntryScreen(){
		rootController.popViewController(animated: false)
		rootController.popViewController(animated: false)
		rootController.popViewController(animated: false)
	}
	
	func backAction(){
		rootController.popViewController(animated: true)
	}
	
}
