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
	
	weak var isUserAuthorise: CurrentValueSubject<Bool, Never>?
	
	var childCoordinators = [any Coordinator]()
	
	enum Views {
		case step2
		case step3
		case step4
		case step5
		case step6

		var view: any RegistrationOnboardingViewProtocol {
			switch self {
			case .step2:
				return RegistrationOnBoardingStep2View()
			case .step3:
				return RegistrationOnboardingStep3View()
			case .step4:
				return RegistrationOnboardingStep4View()
			case .step5:
				return RegistrationStep5View()
			case .step6:
				return RegistrationOnboardingStep6View()
			}
		}
	}
	
	init(
		navigationController: UINavigationController,
		isUserAuthorise: CurrentValueSubject<Bool, Never>? = nil
	) {
		self.rootController = navigationController
		self.isUserAuthorise = isUserAuthorise
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
	
	func start() {
		route(view: .step2, animated: false)
		DispatchQueue.main.asyncAfter(deadline: .now() + 3){
			self.route(view: .step3, animated: false)
		}
	}
	
	func setUpTracker(){
		let trackerCoordinator = TrackerCoordinator(navigationController: rootController, isUserAuthorise: isUserAuthorise!)
		trackerCoordinator.start()
		childCoordinators.append(trackerCoordinator)
	}
	
	func logIn(){
		if let isUserAuthorise = isUserAuthorise {
			isUserAuthorise.send(true)
		} else {
			rootController.popToRootViewController(animated: false)
		}
	}
	
	func backAction(){
		rootController.popViewController(animated: true)
	}
	
}
