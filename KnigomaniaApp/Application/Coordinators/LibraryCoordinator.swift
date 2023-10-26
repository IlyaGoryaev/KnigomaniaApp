//
//  LibraryCoordinator.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 26.10.2023.
//

import Foundation
import SwiftUI

final class LibraryCoordinator: Coordinator {
	
	var rootController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.rootController = navigationController
	}
	
	func start() {
		var view = LibraryScreenView()
		view.libraryCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.navigationController?.pushViewController(viewController, animated: false)
	}
	
}
