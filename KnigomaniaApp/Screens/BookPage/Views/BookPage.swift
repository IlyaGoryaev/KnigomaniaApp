//
//  BookPage.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 21.10.2023.
//

import SwiftUI

struct BookPage: View {
	
	let book: BookPageModel
	
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
						Text("Автор: \(book.author)")
						Text("Год: \(book.year)")
					}
					.padding(.top, 24)
					HStack(spacing: 8){
						HStack(spacing: 4){
							ForEach(0..<5){ _ in
								Image("Star 1")
							}
						}
						Text("\(book.grade.description) (5)")
					}
					.padding(.top, 24)
					BookActionsView()
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
	BookPage(book: BookPageModel(title: "Черное зеркало", author: "Наталья Александрова", year: 2016, grade: 4.1, description: "В конце XIX века особняк купца Клюквина считался одним из самых богатых домов Петербурга. Особую гордость хозяина представляло венецианское зеркало необыкновенной красоты, привезённое из Италии и долгое время украшавшее усыпальницу самого графа Дракулы."))
}
