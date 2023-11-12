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
	
	enum Views {
		
		case makeReview
		case addBookToList
		case bookPage
		//case similarBooksPage
		case reviewsPage
		
		var view: any BookCoordinatorViewProtocol {
			switch self {
			case .makeReview:
				return MakeReviewPage()
			case .addBookToList:
				return AddBookToListPage()
			case .bookPage:
				return BookPage()
			case .reviewsPage:
				return ReviewPage()
			}
		}
	}

	func route(view: Views, animated: Bool = true) {
		var view = view.view
		view.bookCoordinator = self
		let viewController = UIHostingController(rootView: AnyView(view))
		rootController.pushViewController(viewController, animated: animated)
	}
	
	init(navigationController: UINavigationController, book: BookPageModel) {
		self.rootController = navigationController
		self.book = book
	}
	
	func backAction() {
		rootController.popViewController(animated: true)
	}
	
	func dismiss() {
		rootController.dismiss(animated: true)
	}
}
