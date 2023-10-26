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
	
	weak var isUserAuthorise: CurrentValueSubject<Bool, Never>?
	
	init(navigationController: UINavigationController, isUserAuthorise: CurrentValueSubject<Bool, Never>? = nil) {
		self.rootController = navigationController
		self.isUserAuthorise = isUserAuthorise
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
		isUserAuthorise?.send(true)
	}
	
}
