//
//  SimilarBooksView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 21.10.2023.
//

import SwiftUI

struct SimilarBooksView: View {
    var body: some View {
		VStack(spacing: 0){
			HStack{
				Text("Похожие книги")
					.font(.system(size: 20, weight: .medium))
					.foregroundStyle(CustomColors.darkBrownColor)
				Spacer()
				Button {
					print("Весь раздел")
				} label: {
					HStack{
						Text("Весь раздел")
						Image(systemName: "chevron.right")
					}
				}
				.font(.system(size: 14))
				.foregroundStyle(CustomColors.darkBrownColor)
			}
			.padding(.horizontal, 16)
			HStack(spacing: 16){
				Image("book1")
					.resizable()
					.frame(width: 105, height: 146)
				Image("book2")
					.resizable()
					.frame(width: 105, height: 146)
				Image("book3")
					.resizable()
					.frame(width: 105, height: 146)
			}
			.padding(.top, 24)
		}
    }
}

#Preview {
    SimilarBooksView()
}
