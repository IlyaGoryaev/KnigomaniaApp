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
	
	@Binding var imageFrame: CGSize
	@Binding var opacity: CGFloat
	
    var body: some View {
		VStack(spacing: 0) {
			Image("book1")
				.resizable()
				.frame(width: imageFrame.width, height: imageFrame.height)
				.opacity(opacity)
				.clipShape(RoundedRectangle(cornerRadius: 8))
				.shadow(color: CustomColors.darkBrownColor, radius: 10, y: 10)
				.padding(.top, 20)
				
			
			VStack(spacing: 8){
				Text("**Автор**: \(bookAuthor)")
				Text("**Название**: \(bookTitle)")
				Text("**Год**: \(bookYear)")
			}
			.textStyle(.regularText)
			.padding(.top, 24)
		}
		
    }
}

#Preview {
	BookView(bookAuthor: TestBookPageData.book.author, bookTitle: TestBookPageData.book.title, bookYear: TestBookPageData.book.year, imageFrame: .constant(CGSize(width: 255, height: 360)), opacity: .constant(1))
}
