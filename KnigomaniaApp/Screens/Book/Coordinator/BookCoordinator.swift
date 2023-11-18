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

	func route(
		view: Views,
		presentType: PresentActionTypes = .push,
		animated: Bool = true
	) {
		var view = view.view
		view.bookCoordinator = self
		let viewController = UIHostingController(rootView: AnyView(view))
		switch presentType {
		case .present:
			rootController.present(viewController, animated: animated)
		case .push:
			rootController.pushViewController(viewController, animated: animated)
		}
	}
	
	init(
		navigationController: UINavigationController,
		book: BookPageModel
	) {
		self.rootController = navigationController
		self.book = book
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
	
	func share() {
		// Для примера
		guard let image = UIImage(systemName: "bell"), let url = URL(string: "https://www.google.com") else { return }
		
		let shareSheetVC = UIActivityViewController(
			activityItems: [
				image,
				url
			],
			applicationActivities: nil
		)
		rootController.present(shareSheetVC, animated: true)
	}
}
