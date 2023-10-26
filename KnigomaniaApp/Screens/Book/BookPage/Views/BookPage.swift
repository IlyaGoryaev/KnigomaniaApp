//
//  BookPage.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 21.10.2023.
//

import SwiftUI

struct BookPage: View {
	
	let book: BookPageModel
	
	@State var selection: Int = 0
	
	@State var rating: Int = 4
	
	weak var bookCoordinator: BookCoordinator?
	
    var body: some View {
		ZStack{
			CustomColors.background
				.ignoresSafeArea()
			VStack{
				NavBar(title: "") {
					bookCoordinator?.backAction()
				}
				ScrollView{
					Image("book1")
						.resizable()
						.frame(width: 255, height: 360)
						.padding(.top, 20)
					VStack{
						Text("**Автор**: \(book.author)")
						Text("**Год**: \(book.year)")
					}
					.font(.system(size: 16))
					.foregroundStyle(CustomColors.darkBrownColor)
					.padding(.top, 24)
					HStack(spacing: 8){
						Text("Оценить:")
							.font(.system(size: 16, weight: .bold))
							.foregroundStyle(CustomColors.darkBrownColor)
						HStack(spacing: 4){
							ForEach(1..<6){ index in
								Image(index > rating ? "Star 1" : "Star 5")
									.onTapGesture {
										withAnimation {
											rating = index
										}
										
									}
							}
						}
						HStack(spacing: 5){
							Text(book.grade.description)
								.font(.system(size: 16, weight: .bold))
								.foregroundStyle(CustomColors.darkBrownColor)
							Text("(5)")
								.font(.system(size: 16))
								.foregroundStyle(CustomColors.brownColor)
						}
					}
					.padding(.top, 24)
					BookActionsView(bookCoordinator: bookCoordinator)
						.padding(.top, 40)
					DescriptionView(description: book.description)
						.padding(.top, 56)
					ReviewsView(reviews: [])
						.padding(.top, 56)
					SimilarBooksView()
						.padding(.top, 56)
				}
			}
		}
	}
}


#Preview {
	BookPage(book: BookPageModel(title: "Черное зеркало", author: "Наталья Александрова", year: "2016", grade: 4.1, description: "В конце XIX века особняк купца Клюквина считался одним из самых богатых домов Петербурга. Особую гордость хозяина представляло венецианское зеркало необыкновенной красоты, привезённое из Италии и долгое время украшавшее усыпальницу самого графа Дракулы."))
}
