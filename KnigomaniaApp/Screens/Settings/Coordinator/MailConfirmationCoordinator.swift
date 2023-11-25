//
//  MailConfirmationCoordinator.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 25.11.2023.
//

import Foundation
import SwiftUI
import Combine

final class MailConfirmationCoordinator: Coordinator {
	
	enum Views {
		case step1
		case step2
		
		var view: any MailConfirmationViewProtocol {
			switch self {
			case .step1:
				return MailConfirmationStep1View()
			case .step2:
				return MailConfirmationStep2View()
			}
		}
	}
	
	var rootController: UINavigationController
	
	weak var isUserAuthorize: CurrentValueSubject<Bool, Never>?
	
	var childCoordinators = [any Coordinator]()
	
	init(
		navigationController: UINavigationController,
		isUserAuthorize: CurrentValueSubject<Bool, Never>? = nil
	) {
		self.rootController = navigationController
		self.isUserAuthorize = isUserAuthorize
	}
	
	func route(
		view: Views,
		presentType: PresentActionTypes = .push,
		animated: Bool = true
	) {
		var view = view.view
		view.mailConfirmationCoordinator = self
		let viewController = UIHostingController(rootView: AnyView(view))
		switch presentType {
		case .present:
			rootController.present(viewController, animated: animated)
		case .push:
			rootController.pushViewController(viewController, animated: animated)
		}
	}
	
	func start() {
		self.rootController.tabBarController?.tabBar.isHidden = true
		route(view: .step1, animated: true)
		// Mail Confirmation Logic instead
		DispatchQueue.main.asyncAfter(deadline: .now() + 3){
			self.route(view: .step2, animated: false)
		}
	}
	
	func finishConfirmation() {
		rootController.popViewController(animated: false)
		rootController.popViewController(animated: false)
		self.rootController.tabBarController?.tabBar.isHidden = false
	}
	
	func startRegistrationOnBoardingCoordinator() {
		let registrationOnBoardingCoordinator = RegistrationOnboardingCoordinator(navigationController: rootController, isUserAuthorize: isUserAuthorize!)
		childCoordinators.append(registrationOnBoardingCoordinator)
		registrationOnBoardingCoordinator.route(view: .step1)
	}
}
