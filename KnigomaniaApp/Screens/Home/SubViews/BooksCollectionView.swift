//
//  BooksCollectionView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 17.10.2023.
//

import SwiftUI

struct BooksCollectionView: View {
	
	var books: [BookModel]
	
	weak var mainScreenCoordinator: MainCoordinator?
	
	let columns = [
		GridItem(.flexible()),
		GridItem(.flexible()),
		GridItem(.flexible())
	]
	
	var body: some View {
		ScrollView {
			LazyVGrid(columns: columns){
				ForEach(books.indices, id: \.self) { index in
					Image(books[index].imageName)
						.resizable()
						.frame(width: 103, height: 146)
						.clipShape(RoundedRectangle(cornerRadius: 4))
						.onTapGesture {
							print("Open book coordinator")
							mainScreenCoordinator?.bookPage(book: BookPageModel(title: books[index].bookName, author: "fioehioswf", year: "2016", grade: 5, description: "В конце XIX века особняк купца Клюквина считался одним из самых богатых домов Петербурга. Особую гордость хозяина представляло венецианское зеркало необыкновенной красоты, привезённое из Италии и долгое время украшавшее усыпальницу самого графа Дракулы.", reviews: [], similar: []))
						}
				}
			}
			.padding(Sizes.Padding.normal)
		}
	}
}

#Preview {
	BooksCollectionView(books: [BookModel(bookName: "Book1", imageName: "book1"), BookModel(bookName: "Book2", imageName: "book2"), BookModel(bookName: "Book3", imageName: "book3"), BookModel(bookName: "Book4", imageName: "book4"), BookModel(bookName: "Book5", imageName: "book5")])
}
