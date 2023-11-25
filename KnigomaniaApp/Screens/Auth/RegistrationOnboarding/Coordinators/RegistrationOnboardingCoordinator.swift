//
//  ApplicationCoordinator.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 12.10.2023.
//

import SwiftUI
import UIKit
import Combine

final class RegistrationOnboardingCoordinator: Coordinator {
	
	var rootController: UINavigationController
	
	weak var isUserAuthorize: CurrentValueSubject<Bool, Never>?
	
	var childCoordinators = [any Coordinator]()
	
	enum Views {
		case step1
		case step2
		case step3

		var view: any RegistrationOnboardingViewProtocol {
			switch self {
			case .step1:
				return RegistrationOnboardingStep1View()
			case .step2:
				return RegistrationOnBoardingStep2View()
			case .step3:
				return RegistrationOnboardingStep3View()
			}
		}
	}
	
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
		view.applicationCoordinator = self
		let viewController = UIHostingController(rootView: AnyView(view))
		switch presentType {
		case .present:
			rootController.present(viewController, animated: animated)
		case .push:
			rootController.pushViewController(viewController, animated: animated)
		}
	}
	
	func setUpTracker(){
		let trackerCoordinator = TrackerCoordinator(navigationController: rootController, isUserAuthorize: isUserAuthorize!)
		trackerCoordinator.start()
		childCoordinators.append(trackerCoordinator)
	}
	
	func logIn(){
		if let isUserAuthorise = isUserAuthorize {
			isUserAuthorise.send(true)
		} else {
			rootController.popToRootViewController(animated: false)
		}
	}
	
	func backAction(){
		rootController.popViewController(animated: true)
	}
	
}
