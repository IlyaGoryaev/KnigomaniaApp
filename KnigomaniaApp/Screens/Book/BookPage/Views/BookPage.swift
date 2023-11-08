//
//  BookPage.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 21.10.2023.
//

import SwiftUI

struct BookPage: View {
	
	@StateObject private var viewModel = BookPageViewModel()
	
	weak var bookCoordinator: BookCoordinator?
	
    var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			VStack{
				NavBar(title: .emptyTitle) {
					bookCoordinator?.backAction()
				}
				.padding(.vertical, 8)
				ScrollView{
					Image("book1")
						.resizable()
						.frame(width: 255, height: 360)
						.padding(.top, 20)
					VStack(spacing: 8){
						Text("**Автор**: \(viewModel.book.author)")
						Text("**Название**: \(viewModel.book.title)")
						Text("**Год**: \(viewModel.book.year)")
					}
					.textStyle(.regularText)
					.padding(.top, 24)
					HStack(spacing: 8){
						Text("Оценить:")
							.textStyle(.boldText)
						HStack(spacing: 4){
							ForEach(1..<6){ index in
								Image(index > viewModel.selection ? "Star 1" : "Star 5")
									.onTapGesture {
										withAnimation {
											viewModel.selection = index
										}
										
									}
							}
						}
						HStack(spacing: 5){
							Text(viewModel.book.grade.description)
								.textStyle(.boldText)
							Text("(5)")
								.font(.system(size: 16))
								.foregroundStyle(CustomColors.brownColor)
						}
					}
					.padding(.top, 24)
					BookActionsView(bookCoordinator: bookCoordinator)
						.padding(.top, 40)
					DescriptionView(description: viewModel.book.description)
						.padding(.top, 56)
					ReviewsView{
						bookCoordinator?.reviewsPage()
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
