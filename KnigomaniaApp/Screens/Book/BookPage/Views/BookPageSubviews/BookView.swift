//
//  BookView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 09.11.2023.
//

import SwiftUI

struct BookView: View {
	
	let bookAuthor: String
	let bookTitle: String
	let bookYear: String
	
    var body: some View {
		Image("book1")
			.resizable()
			.frame(width: 255, height: 360)
			.padding(.top, 20)
		VStack(spacing: 8){
			Text("**Автор**: \(bookAuthor)")
			Text("**Название**: \(bookTitle)")
			Text("**Год**: \(bookYear)")
		}
		.textStyle(.regularText)
    }
}

#Preview {
	BookView(bookAuthor: TestBookPageData.book.author, bookTitle: TestBookPageData.book.title, bookYear: TestBookPageData.book.year)
}
