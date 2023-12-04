//
//  CurrentLibraryView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 17.10.2023.
//

import SwiftUI

struct CurrentLibraryView: View {
	
	var books: [BookModel] = []
	
	weak var mainScreenCoordinator: MainCoordinator?
	
	var body: some View {
		ZStack {
			CustomColors.background.ignoresSafeArea()
			VStack(spacing: Sizes.Padding.zero) {
				if books.isEmpty{
					Text("У тебя ещё нет отмеченных книг. Чтобы добавить книги, воспользуйся поиском.")
						.font(.system(size: 16))
						.foregroundStyle(CustomColors.darkBrownColor)
						.padding(.horizontal, 16)
						.padding(.top, 26)
					Spacer()
				} else {
					BooksCollectionView(books: books, mainScreenCoordinator: mainScreenCoordinator)
						.padding([.top, .bottom], 16)
				}
			}
		}
	}
}

#Preview {
		CurrentLibraryView(books: [BookModel(bookName: "Book1", imageName: "book1"), BookModel(bookName: "Book2", imageName: "book2"), BookModel(bookName: "Book3", imageName: "book3"), BookModel(bookName: "Book4", imageName: "book4"), BookModel(bookName: "Book5", imageName: "book5")])
}
