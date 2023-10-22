//
//  BookCoordinator.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 21.10.2023.
//

import Foundation
import SwiftUI

final class BookCoordinator: Coordinator{
	
	var navigationController: UINavigationController
	
	var book: BookPageModel
	
	init(navigationController: UINavigationController, book: BookPageModel) {
		self.navigationController = navigationController
		self.book = book
	}
	
	func start() {
		var view = BookPage(book: book)
		view.bookCoordinator = self
		let viewController = UIHostingController(rootView: view)
		navigationController.pushViewController(viewController, animated: true)
	}
	
	func backAction(){
		navigationController.popViewController(animated: true)
	}
	
}
