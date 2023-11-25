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
	
	enum Views {
		case startScreen
		case loginScreen
		case regScreen
		
		var view: any EntryViewProtocol {
			switch self {
			case .startScreen:
				return StartScreenView()
			case .loginScreen:
				return LoginScreenView()
			case .regScreen:
				return RegistrationView()
			}
		}
	}
	
	var rootController: UINavigationController
	
	weak var isUserAuthorize: CurrentValueSubject<Bool, Never>?
	
	var childCoordinators = [any Coordinator]()
	
	init(navigationController: UINavigationController, isUserAuthorize: CurrentValueSubject<Bool, Never>){
		self.rootController = navigationController
		self.isUserAuthorize = isUserAuthorize
	}
	
	func route(
		view: Views,
		presentType: PresentActionTypes = .push,
		animated: Bool = true
	) {
		var view = view.view
		view.entryCoordinator = self
		let viewController = UIHostingController(rootView: AnyView(view))
		switch presentType {
		case .present:
			rootController.present(viewController, animated: animated)
		case .push:
			rootController.pushViewController(viewController, animated: animated)
		}
	}
	
	func resetPassword(){
		let resetPasswordCoordinator = ResetPasswordCoordinator(navigationController: rootController)
		childCoordinators.append(resetPasswordCoordinator)
		resetPasswordCoordinator.start()
	}
	
	func logIn(){
		isUserAuthorize?.send(true)
	}
	
	func startMailConfirmationCoordinator() {
		let mailConfiramtionCoordinator = MailConfirmationCoordinator(navigationController: rootController, isUserAuthorize: isUserAuthorize!)
		childCoordinators.append(mailConfiramtionCoordinator)
		mailConfiramtionCoordinator.start()
	}
	
	func backAction(
		type: BackActionTypes,
		animated: Bool = true
	) {
		switch type {
		case .dismiss:
			rootController.dismiss(animated: animated)
		case .backAction:
			rootController.popViewController(animated: animated)
		}
	}
	
}
