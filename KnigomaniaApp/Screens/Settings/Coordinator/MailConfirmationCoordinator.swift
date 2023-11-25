//
//  MailConfirmationCoordinator.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 25.11.2023.
//

import Foundation
import SwiftUI

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
	
	init(
		navigationController: UINavigationController
	) {
		self.rootController = navigationController
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
}
