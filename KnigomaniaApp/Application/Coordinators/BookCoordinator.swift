//
//  BookCoordinator.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 21.10.2023.
//

import Foundation
import SwiftUI

final class BookCoordinator: Coordinator{	
	
	var rootController: UINavigationController
	
	var book: BookPageModel
	
	init(navigationController: UINavigationController, book: BookPageModel) {
		self.rootController = navigationController
		self.book = book
	}
	
	func start() {
		var view = BookPage(book: book)
		view.bookCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: true)
	}
	
	func makeReview() {
		var view = MakeReviewPage()
		view.bookCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: true)
	}
	
	func addBookToList() {
		var view = AddBookToListPage()
		view.bookCoordinator = self
		let viewController = UIHostingController(rootView: view)
		rootController.pushViewController(viewController, animated: true)
	}
	
	func backAction() {
		rootController.popViewController(animated: true)
	}
	
}
