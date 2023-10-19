//
//  BooksCollectionView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 17.10.2023.
//

import SwiftUI

struct BooksCollectionView: View {
	
	var books: [BookModel]
	
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
				}
			}
			.padding(.horizontal, 16)
		}
	}
}
