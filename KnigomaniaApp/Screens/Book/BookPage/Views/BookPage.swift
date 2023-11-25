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
		
	@State private var imageFrame = CGSize(width: 255, height: 360)
	
	@State private var opacity: CGFloat = 1
	
	@State private var bookTitleOpacity: CGFloat = 0
			
    var body: some View {
		ZStack {
			CustomColors.background
				.ignoresSafeArea()
			VStack(spacing: 0) {
				ZStack {
					NavBar(title: .emptyTitle) {
						bookCoordinator?.backAction(type: .backAction)
					}
					.padding(.vertical, 12)
					Text(viewModel.book.title)
						.textStyle(.boldText)
						.opacity(bookTitleOpacity)
				}
				ScrollViewReader { reader in
					ScrollView {
						VStack(spacing: 0) {
							BookView(bookAuthor: viewModel.book.author, bookTitle: viewModel.book.title, bookYear: viewModel.book.year, imageFrame: $imageFrame, opacity: $opacity)
								.padding(.top, 24)
							GradeView(bookGrade: Int(viewModel.book.grade), selection: $viewModel.selection)
								.padding(.top, 24)
							BookActionsView(bookCoordinator: bookCoordinator) {
//								withAnimation {
//									reader.scrollTo(.)
//								}
								print("Action")
							}
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
						.background(
							GeometryReader { reader in
								Color.clear.preference(key: ViewOffsetKey.self, value: -reader.frame(in: .named("scroll")).origin.y)
							}
						)
						.onPreferenceChange(ViewOffsetKey.self) {
							setupBookOpacity(scrollOffset: $0)
							setupBookTitleOpacity(scrollOffset: $0)
						}
					}
					.coordinateSpace(name: "scroll")
					.ignoresSafeArea()
					.padding(.bottom, 28)
				}
				
			}
		}
	}
	
	private func setupBookOpacity(scrollOffset: CGFloat) {
		if scrollOffset > 150 && scrollOffset < 400 {
			opacity = 1 - ((scrollOffset - 150) * 0.004)
		}
		if scrollOffset < 150 {
			withAnimation {
				opacity = 1
			}
		}
	}
	
	private func setupBookTitleOpacity(scrollOffset: CGFloat) {
		if scrollOffset > 470 {
			withAnimation {
				bookTitleOpacity = 1
			}
		} else {
			withAnimation {
				bookTitleOpacity = 0
			}
		}
	}
}

struct ViewOffsetKey: PreferenceKey {
	typealias Value = CGFloat
	static var defaultValue = CGFloat.zero
	static func reduce(value: inout Value, nextValue: () -> Value) {
		value += nextValue()
	}
}

#Preview {
	BookPage()
}
