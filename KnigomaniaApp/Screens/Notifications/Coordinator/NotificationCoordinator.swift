//
//  NotificationCoordinator.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 13.11.2023.
//

import Foundation
import SwiftUI

final class NotificationCoordinator: Coordinator {
	
	enum Views {
		case notificationList
		case descriptionNotification(notification: NotificationModel)
		
		var view: any NotificationCoordinatorViewProtocol {
			switch self {
			case .notificationList:
				NotificationList()
			case .descriptionNotification(let notification):
				NotificationDescription(notification: notification)
			}
		}
	}
	
	var rootController: UINavigationController
	
	init(
		rootController: UINavigationController)
	{
		self.rootController = rootController
	}
	
	func route(
		view: Views,
		presentType: PresentActionTypes = .push,
		animated: Bool = true
	) {
		var view = view.view
		view.notificationCoordinator = self
		let viewController = UIHostingController(rootView: AnyView(view))
		switch presentType {
		case .present:
			rootController.present(viewController, animated: animated)
		case .push:
			rootController.pushViewController(viewController, animated: animated)
		}
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
