//
//  BookPage.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 21.10.2023.
//

import SwiftUI

struct BookPage: BookCoordinatorViewProtocol {
	
	@StateObject private var viewModel = BookPageViewModel()
	
	weak var bookCoordinator: BookCoordinator?
	
    var body: some View {
		ZStack {
			CustomColors.background
				.ignoresSafeArea()
			VStack {
				NavBar(title: .emptyTitle) {
					bookCoordinator?.backAction(type: .backAction)
				}
				.padding(.vertical, 8)
				ScrollView {
					BookView(bookAuthor: viewModel.book.author, bookTitle: viewModel.book.title, bookYear: viewModel.book.year)
						.padding(.top, 24)
					GradeView(bookGrade: Int(viewModel.book.grade), selection: $viewModel.selection)
						.padding(.top, 24)
					BookActionsView(bookCoordinator: bookCoordinator)
						.padding(.top, 40)
					DescriptionView(description: viewModel.book.description)
						.padding(.top, 56)
					ReviewsView {
						bookCoordinator?.route(view: .reviewsPage)
						}
						.padding(.top, 56)
					SimilarBooksView()
						.padding(.top, 56)
				}
				.ignoresSafeArea()
				.padding(.bottom, 28)
			}
		}
	}
}

#Preview {
	BookPage()
}
