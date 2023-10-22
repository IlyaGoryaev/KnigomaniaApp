//
//  ReviewsView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 21.10.2023.
//

import SwiftUI

struct ReviewsView: View {
	
	let reviews: [Review]
	
    var body: some View {
		VStack{
			HStack{
				Text("Рецензии")
					.font(.system(size: 20, weight: .medium))
					.foregroundStyle(CustomColors.darkBrownColor)
				Spacer()
				if !reviews.isEmpty{
					HStack{
						Text("Весь раздел")
						Image(systemName: "chevron.right")
					}
					.font(.system(size: 14))
					.foregroundStyle(CustomColors.darkBrownColor)
				}
			}
			.padding(.horizontal, 16)
			if !reviews.isEmpty{
				VStack{
					ForEach(reviews.indices, id: \.self){ index in
						ReviewItemView(review: reviews[index])
					}
				}
				.padding(.top, 32)
			} else {
				Text("Ещё никто не оставил рецензию. Будь первым!")
					.font(.system(size: 16))
					.padding(.horizontal, 16)
					.padding(.top, 32)
			}
		}
		
		
    }
}

struct ReviewItemView: View {
	
	let review: Review
	
	var body: some View {
		VStack{
			HStack{
				Text("Книга захватывает")
				Image("like")
			}
			HStack{
				VStack{
					Text("\(review.grade) (5)")
					Image("star.fill")
				}
				Text(review.text)
			}
		}
	}
}

#Preview {
	ReviewsView(reviews: [])
}
