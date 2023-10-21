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
							mainScreenCoordinator?.bookPage(book: BookPageModel(title: books[index].bookName, author: "fioehioswf", year: 2016, grade: 5, description: "В конце XIX века особняк купца Клюквина считался одним из самых богатых домов Петербурга. Особую гордость хозяина представляло венецианское зеркало необыкновенной красоты, привезённое из Италии и долгое время украшавшее усыпальницу самого графа Дракулы."))
						}
				}
			}
			.padding(.horizontal, 16)
		}
	}
}
