//
//  SetUpReminderTrackerCoordinator.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 22.10.2023.
//

import Foundation
import SwiftUI
import Combine


final class SetUpReminderTrackerCoordinator: Coordinator {
	
	var rootController: UINavigationController
	
	weak var isUserAuthorize: CurrentValueSubject<Bool, Never>?
	
	init(navigationController: UINavigationController, isUserAuthorize: CurrentValueSubject<Bool, Never>? = nil) {
		self.rootController = navigationController
		self.isUserAuthorize = isUserAuthorize
	}
	
	func start() {
		var view = TrackerSetupRemindersScreenView()
		view.setupReminderCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: true)
	}
	
	func finishSetupReminder(){
		var view = TrackerSetupConfirmationScreenView()
		view.setupReminderCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: true)
	}
	
	func logIn(){
		isUserAuthorize?.send(true)
	}
	
}
