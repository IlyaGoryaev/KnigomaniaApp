//
//  RecommendationsCoordinator.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 26.10.2023.
//

import Foundation
import SwiftUI

final class RecommendationsCoordinator: Coordinator {
	
	var rootController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.rootController = navigationController
	}
	
	func start() {
		var view = RecommendationsScreenView()
		view.recommendationsCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: false)
	}
    
    func openAddingBookScreen() {
        var view = BookAddingScreenView()
        view.recommendationsCoordinator = self
        let viewController = UIHostingController(rootView: view)
        rootController.pushViewController(viewController, animated: true)
        print(rootController)
    }
    
    func backAction() {
        rootController.popViewController(animated: true)
    }
}
