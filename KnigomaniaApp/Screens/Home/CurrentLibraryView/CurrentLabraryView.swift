//
//  CurrentLabraryView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 17.10.2023.
//

import SwiftUI

struct CurrentLabraryView: View {
	
	var books: [BookModel] = []
	
	var body: some View {
		ZStack{
			CustomColors.background.ignoresSafeArea()
			VStack(spacing: 0){
				if books.isEmpty{
					Text("У тебя ещё нет отмеченных книг. Чтобы добавить книги, воспользуйся поиском.")
						.font(.system(size: 16))
						.foregroundStyle(CustomColors.darkBrownColor)
						.padding(.horizontal, 16)
						.padding(.top, 26)
					Spacer()
				} else {
					BooksCollectionView(books: books)
						.padding(.top, 26)
				}
			}
			
		}
	}
}

#Preview {
	//	CurrentLabraryView(books: [BookModel(bookName: "Book1", imageName: "Book1"), BookModel(bookName: "Book2", imageName: "Book2"), BookModel(bookName: "Book3", imageName: "Book3"), BookModel(bookName: "Book4", imageName: "Book4"), BookModel(bookName: "Book5", imageName: "Book5")])
	CurrentLabraryView(books: [])
}
