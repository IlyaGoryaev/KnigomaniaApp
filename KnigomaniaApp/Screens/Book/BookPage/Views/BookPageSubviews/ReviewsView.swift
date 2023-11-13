//
//  ReviewsView.swift
//  KnigomaniaApp
//
//  Created by Илья Горяев on 21.10.2023.
//

import SwiftUI

struct ReviewsView: View {
	
	let reviews: [Review] = TestBookPageData.reviews
	
	var action: () -> ()
	
    var body: some View {
		VStack{
			HStack{
				Text("Рецензии")
					.font(.system(size: 20, weight: .medium))
					.foregroundStyle(CustomColors.darkBrownColor)
				Spacer()
				if !reviews.isEmpty{
					Button(action: {
						action()
					}, label: {
						HStack{
							Text("Весь раздел")
							Image(systemName: "chevron.right")
						}
						.textStyle(.regularText)
					})
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
	
	@State var isLiked: Bool = false

	var body: some View {
		HStack(spacing: 0) {
			VStack(spacing: 0){
				Text("\(Int(review.grade)) (5)")
				Image("star.fill")
			}
			VStack(alignment: .leading, spacing: 8){
				HStack{
					Text(review.title)
						.textStyle(.boldText)
					Spacer()
					ZStack(alignment: .bottomTrailing){
						Image(isLiked ? "like" : "like.fill")
							.padding(.horizontal, 16)
							.onTapGesture {
								withAnimation {
									isLiked.toggle()
								}
							}
						Text("\(review.likes)")
							.font(.system(size: 11))
							.foregroundStyle(CustomColors.darkBrownColor)
					}
				}
				Text(review.text)
					.font(.system(size: 14))
					.frame(maxHeight: 90)
					.multilineTextAlignment(.leading)
			}
			.padding(.horizontal, 16)
		}
		.padding(.horizontal, 16)
	}
}
