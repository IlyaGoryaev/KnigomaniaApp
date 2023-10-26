//
//  ScanCoordinator.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 26.10.2023.
//

import Foundation
import SwiftUI

final class ScanCoordinator: Coordinator {
	
	var rootController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.rootController = navigationController
	}
	
	
	func start() {
		var view = ScanScreenView()
		view.scanCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: false)
	}
	
	func openNewScreen(){
		var view = NextView()
		view.scanCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: true)
		print(rootController)
	}
	
	func backAction() {
		rootController.popViewController(animated: true)
	}
	
}
